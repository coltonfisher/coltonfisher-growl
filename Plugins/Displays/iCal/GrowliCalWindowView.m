//
//  GrowliCalWindowView.m
//  Growl
//
//  Created by Nelson Elhage on Wed Jun 09 2004.
//  Name changed from KABubbleWindowView.m by Justin Burns on Fri Nov 05 2004.
//	Adapted for iCal by Takumi Murayama on Thu Aug 17 2006.
//  Copyright (c) 2004-2006 The Growl Project. All rights reserved.
//

#import "GrowliCalWindowView.h"
#import "GrowlDefinesInternal.h"
#import "GrowliCalDefines.h"
#import "GrowlImageAdditions.h"
#import "GrowlBezierPathAdditions.h"
#import "NSMutableAttributedStringAdditions.h"
#import <WebKit/WebPreferences.h>

/* to get the limit pref */
#import "GrowliCalPrefsController.h"

/* Hardcoded geometry values */
#define PANEL_WIDTH_PX			270.0f /*!< Total width of the panel, including border */
#define BORDER_WIDTH_PX			  2.0f
#define BORDER_RADIUS_PX		  6.0f
#define PANEL_VSPACE_PX			  3.0f /*!< Vertical padding from bounds to content area */
#define PANEL_HSPACE_PX			  6.0f /*!< Horizontal padding from bounds to content area */
#define ICON_SIZE_PX			 32.0f /*!< The width and height of the (square) icon */
#define ICON_SIZE_LARGE_PX		 48.0f /*!< The width and height of the (square) icon */
#define ICON_HSPACE_PX			  8.0f /*!< Horizontal space between icon and title/description */
#define TITLE_VSPACE_PX			  5.0f /*!< Vertical space between title and description */
#define TITLE_FONT_SIZE_PTS		 11.0f
#define DESCR_FONT_SIZE_PTS		 11.0f
#define MAX_TEXT_ROWS				5  /*!< The maximum number of rows of text, used only if the limit preference is set. */
#define MIN_TEXT_HEIGHT			(PANEL_VSPACE_PX + PANEL_VSPACE_PX + iconSize)
#define TEXT_AREA_WIDTH			(PANEL_WIDTH_PX - PANEL_HSPACE_PX - PANEL_HSPACE_PX - iconSize - ICON_HSPACE_PX)

static void GrowliCalShadeInterpolate( void *info, const float *inData, float *outData ) {
	float *colors = (float *) info;

	register float a = inData[0];
	register float a_coeff = 1.0f - a;

	// SIMD could come in handy here
	// outData[0..3] = a_coeff * colors[4..7] + a * colors[0..3]
	outData[0] = a_coeff * colors[4] + a * colors[0];
	outData[1] = a_coeff * colors[5] + a * colors[1];
	outData[2] = a_coeff * colors[6] + a * colors[2];
	outData[3] = a_coeff * colors[7] + a * colors[3];
}

#pragma mark -

@implementation GrowliCalWindowView

- (id) initWithFrame:(NSRect) frame {
	NSLog(@"%s %f %f %f %f\n", __FUNCTION__, frame.origin.x, frame.origin.y, frame.size.height, frame.size.width);
	if ((self = [super initWithFrame:frame])) {
		titleFont = [[NSFont boldSystemFontOfSize:TITLE_FONT_SIZE_PTS] retain];
		textFont = [[NSFont messageFontOfSize:DESCR_FONT_SIZE_PTS] retain];
		borderColor = [[NSColor colorWithCalibratedRed:0.0588f green:0.2784f blue:0.9137f alpha:0.5f] retain];
		highlightColor = [[NSColor colorWithCalibratedRed:0.0588f green:0.2784f blue:0.9137f alpha:0.75f] retain];
		textLayoutManager = [[NSLayoutManager alloc] init];
		titleLayoutManager = [[NSLayoutManager alloc] init];
		lineHeight = [textLayoutManager defaultLineHeightForFont:textFont];

		int size = GrowliCalSizePrefDefault;
		READ_GROWL_PREF_INT(GrowliCalSizePref, GrowliCalPrefDomain, &size);
		if (size == GrowliCalSizeLarge) {
			iconSize = ICON_SIZE_LARGE_PX;
		} else {
			iconSize = ICON_SIZE_PX;
		}
	}
	return self;
}

- (void) dealloc {
	[titleFont          release];
	[textFont           release];
	[icon               release];
	[textColor          release];
	[bgColor            release];
	[lightColor         release];
	[borderColor        release];
	[highlightColor     release];
	[textStorage        release];
	[titleStorage       release];
	[textLayoutManager  release];
	[titleLayoutManager release];

	[super dealloc];
}

- (float) titleHeight {
	return haveTitle ? titleHeight : 0.0f;
}


- (void) drawRect:(NSRect) rect {
	NSLog(@"%s %f %f %f %f\n", __FUNCTION__, rect.origin.x, rect.origin.y, rect.size.height, rect.size.width);
	//Make sure that we don't draw in the main thread
	//if ([super dispatchDrawingToThread:rect]) {
		NSRect b = [self bounds];
		CGRect bounds = CGRectMake(b.origin.x, b.origin.y, b.size.width, b.size.height);
		CGRect shape = CGRectInset(bounds, BORDER_WIDTH_PX*0.5f, BORDER_WIDTH_PX*0.5f);

		CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];

		// Create a path with enough room to strike the border and remain inside our frame.
		// Since the path is in the middle of the line, this means we must inset it by half the border width.
		addRoundedRectToPath(context, shape, BORDER_RADIUS_PX);
		CGContextSetLineWidth(context, BORDER_WIDTH_PX);

		CGContextSaveGState(context);
		CGContextClip(context);

		// Create a callback function to generate the
		// fill clipped graphics context with our gradient
		struct CGFunctionCallbacks callbacks = { 0U, GrowliCalShadeInterpolate, NULL };
		float colors[8];

		[lightColor getRed:&colors[0]
					 green:&colors[1]
					  blue:&colors[2]
					 alpha:&colors[3]];

		[bgColor getRed:&colors[4]
				  green:&colors[5]
				   blue:&colors[6]
				  alpha:&colors[7]];

		CGFunctionRef function = CGFunctionCreate( (void *) colors,
												   1U,
												   /*domain*/ NULL,
												   4U,
												   /*range*/ NULL,
												   &callbacks );
		CGColorSpaceRef cspace = CGColorSpaceCreateDeviceRGB();

		CGPoint src, dst;
		src.x = CGRectGetMaxX(bounds);
		src.y = CGRectGetMaxY(bounds);
		dst.x = CGRectGetMinX(bounds);
		dst.y = src.y;
		CGShadingRef shading = CGShadingCreateAxial(cspace, src, dst,
													function, false, false);

		CGContextDrawShading(context, shading);

		CGShadingRelease(shading);
		CGColorSpaceRelease(cspace);
		CGFunctionRelease(function);

		CGContextRestoreGState(context);

		addRoundedRectToPath(context, shape, BORDER_RADIUS_PX);
		CGContextSetLineWidth(context, BORDER_WIDTH_PX);
		if (mouseOver)
			[highlightColor set];
		else
			[borderColor set];
		CGContextStrokePath(context);

		NSRect drawRect;
		drawRect.origin.x = PANEL_HSPACE_PX;
		drawRect.origin.y = PANEL_VSPACE_PX;
		drawRect.size.width = iconSize;
		drawRect.size.height = iconSize;

		[icon setFlipped:YES];
		[icon drawScaledInRect:drawRect
					 operation:NSCompositeSourceOver
					  fraction:1.0f];

		drawRect.origin.x += iconSize + ICON_HSPACE_PX;

		if (haveTitle) {
			[titleLayoutManager drawGlyphsForGlyphRange:titleRange atPoint:drawRect.origin];
			drawRect.origin.y += titleHeight + TITLE_VSPACE_PX;
		}

		if (haveText)
			[textLayoutManager drawGlyphsForGlyphRange:textRange atPoint:drawRect.origin];

		[[self window] invalidateShadow];
	//}
}

#pragma mark -

- (void) setPriority:(int)priority {
	NSString *key;
	NSString *textKey;
	NSString *topKey;

	switch (priority) {
		case -2:
			key = GrowliCalVeryLowColor;
			textKey = GrowliCalVeryLowTextColor;
			topKey = GrowliCalVeryLowTopColor;
			break;
		case -1:
			key = GrowliCalModerateColor;
			textKey = GrowliCalModerateTextColor;
			topKey = GrowliCalModerateTopColor;
			break;
		case 1:
			key = GrowliCalHighColor;
			textKey = GrowliCalHighTextColor;
			topKey = GrowliCalHighTopColor;
			break;
		case 2:
			key = GrowliCalEmergencyColor;
			textKey = GrowliCalEmergencyTextColor;
			topKey = GrowliCalEmergencyTopColor;
			break;
		case 0:
		default:
			key = GrowliCalNormalColor;
			textKey = GrowliCalNormalTextColor;
			topKey = GrowliCalNormalTopColor;
			break;
	}

	NSData *data = nil;

	float backgroundAlpha = 95.0f;
	READ_GROWL_PREF_FLOAT(GrowliCalOpacity, GrowliCalPrefDomain, &backgroundAlpha);
	backgroundAlpha *= 0.01f;

	Class NSDataClass = [NSData class];
	READ_GROWL_PREF_VALUE(key, GrowliCalPrefDomain, NSData *, &data);
	if (data && [data isKindOfClass:NSDataClass]) {
		bgColor = [NSUnarchiver unarchiveObjectWithData:data];
		bgColor = [bgColor colorWithAlphaComponent:backgroundAlpha];
	} else {
		bgColor = [NSColor colorWithCalibratedRed:0.3529f
											green:0.5647f
											 blue:1.0f
											alpha:backgroundAlpha];
	}
	[bgColor retain];
	[data release];

	data = nil;
	READ_GROWL_PREF_VALUE(textKey, GrowliCalPrefDomain, NSData *, &data);
	if (data && [data isKindOfClass:NSDataClass]) {
		textColor = [NSUnarchiver unarchiveObjectWithData:data];
	} else {
		textColor = [NSColor whiteColor];
	}
	[textColor retain];
	[data release];

	data = nil;
	READ_GROWL_PREF_VALUE(topKey, GrowliCalPrefDomain, NSData *, &data);
	if (data && [data isKindOfClass:NSDataClass]) {
		lightColor = [NSUnarchiver unarchiveObjectWithData:data];
		lightColor = [lightColor colorWithAlphaComponent:backgroundAlpha];
	} else {
		lightColor = [NSColor colorWithCalibratedRed:0.1255f
											   green:0.3765f
												blue:0.9529f
											   alpha:backgroundAlpha];
	}
	[lightColor retain];
	[data release];
}

- (void) setIcon:(NSImage *) anIcon {
	[icon release];
	icon = [anIcon retain];
	[self setNeedsDisplay:YES];
}

- (void) setTitle:(NSString *) aTitle isHTML:(BOOL)isHTML {
	haveTitle = [aTitle length] != 0;

	if (!haveTitle) {
		[self setNeedsDisplay:YES];
		return;
	}

	if (!titleStorage) {
		NSSize containerSize;
		containerSize.width = TEXT_AREA_WIDTH;
		containerSize.height = FLT_MAX;
		titleStorage = [[NSTextStorage alloc] init];
		titleContainer = [[NSTextContainer alloc] initWithContainerSize:containerSize];
		[titleLayoutManager addTextContainer:titleContainer];	// retains textContainer
		[titleContainer release];
		[titleStorage addLayoutManager:titleLayoutManager];	// retains layoutManager
		[titleContainer setLineFragmentPadding:0.0f];
	}

	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	[paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
	NSDictionary *defaultAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:
		titleFont,      NSFontAttributeName,
		textColor,      NSForegroundColorAttributeName,
		paragraphStyle, NSParagraphStyleAttributeName,
		nil];
	[paragraphStyle release];

	if (isHTML) {
		WebPreferences *webPreferences = [[WebPreferences alloc] initWithIdentifier:@"GrowliCalTitle"];
		[webPreferences setJavaEnabled:NO];
		[webPreferences setJavaScriptEnabled:NO];
		[webPreferences setPlugInsEnabled:NO];
		[webPreferences setUserStyleSheetEnabled:NO];
		[webPreferences setStandardFontFamily:[titleFont familyName]];
		[webPreferences setDefaultFontSize:TITLE_FONT_SIZE_PTS];
		NSNumber *useWebKit = [[NSNumber alloc] initWithInt:1];
		NSDictionary *options = [[NSDictionary alloc] initWithObjectsAndKeys:
			useWebKit,      @"UseWebKit",
			webPreferences, NSWebPreferencesDocumentOption,
			nil];
		[useWebKit      release];
		[webPreferences release];

		NSString *boldTitle = [[NSString alloc] initWithFormat:@"<strong>%@</strong>", aTitle];
		NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithHTML:[boldTitle dataUsingEncoding:NSUnicodeStringEncoding allowLossyConversion:NO]
																					 options:options
																		  documentAttributes:NULL];
		[boldTitle release];
		[options   release];
		[content addDefaultAttributes:defaultAttributes];
		[titleStorage setAttributedString:content];
		[content release];
	} else {
		[[titleStorage mutableString] setString:aTitle];
		[titleStorage setAttributes:defaultAttributes range:NSMakeRange(0, [titleStorage length])];
	}

	[defaultAttributes release];

	titleRange = [titleLayoutManager glyphRangeForTextContainer:titleContainer];	// force layout
	titleHeight = [titleLayoutManager usedRectForTextContainer:titleContainer].size.height;

	[self setNeedsDisplay:YES];
}

- (void) setText:(NSString *) aText isHTML:(BOOL)isHTML {
	haveText = [aText length] != 0;

	if (!haveText) {
		[self setNeedsDisplay:YES];
		return;
	}

	if (!textStorage) {
		NSSize containerSize;
		BOOL limitPref = YES;
		READ_GROWL_PREF_BOOL(GrowliCalLimitPref, GrowliCalPrefDomain, &limitPref);
		containerSize.width = TEXT_AREA_WIDTH;
		if (limitPref)
			containerSize.height = lineHeight * MAX_TEXT_ROWS;
		else
			containerSize.height = FLT_MAX;
		textStorage = [[NSTextStorage alloc] init];
  		textContainer = [[NSTextContainer alloc] initWithContainerSize:containerSize];
		[textLayoutManager addTextContainer:textContainer];	// retains textContainer
		[textContainer release];
		[textStorage addLayoutManager:textLayoutManager];	// retains layoutManager
		[textContainer setLineFragmentPadding:0.0f];
	}

	NSDictionary *defaultAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:
		textFont,  NSFontAttributeName,
		textColor, NSForegroundColorAttributeName,
		nil];

	if (isHTML) {
		WebPreferences *webPreferences = [[WebPreferences alloc] initWithIdentifier:@"GrowliCalText"];
		[webPreferences setJavaEnabled:NO];
		[webPreferences setJavaScriptEnabled:NO];
		[webPreferences setPlugInsEnabled:NO];
		[webPreferences setUserStyleSheetEnabled:NO];
		[webPreferences setStandardFontFamily:[textFont familyName]];
		[webPreferences setDefaultFontSize:DESCR_FONT_SIZE_PTS];
		NSNumber *useWebKit = [[NSNumber alloc] initWithInt:1];
		NSDictionary *options = [[NSDictionary alloc] initWithObjectsAndKeys:
			useWebKit,      @"UseWebKit",
			webPreferences, NSWebPreferencesDocumentOption,
			nil];
		[useWebKit      release];
		[webPreferences release];

		NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithHTML:[aText dataUsingEncoding:NSUnicodeStringEncoding allowLossyConversion:NO]
																					 options:options
																		  documentAttributes:NULL];
		[options release];
		[content addDefaultAttributes:defaultAttributes];
		[textStorage setAttributedString:content];
		[content release];
	} else {
		[[textStorage mutableString] setString:aText];
		[textStorage setAttributes:defaultAttributes range:NSMakeRange(0, [textStorage length])];
	}

	[defaultAttributes release];

	textRange = [textLayoutManager glyphRangeForTextContainer:textContainer];	// force layout
	textHeight = [textLayoutManager usedRectForTextContainer:textContainer].size.height;

	[self setNeedsDisplay:YES];
}

- (void) sizeToFit {
	float height = PANEL_VSPACE_PX + PANEL_VSPACE_PX + [self titleHeight] + [self descriptionHeight];
	if (haveTitle && haveText)
		height += TITLE_VSPACE_PX;
	if (height < MIN_TEXT_HEIGHT)
		height = MIN_TEXT_HEIGHT;

	// resize the window so that it contains the tracking rect
	NSWindow *window = [self window];
	NSRect windowRect = [window frame];
	windowRect.origin.y -= height - windowRect.size.height;
	windowRect.size.height = height;
	[window setFrame:windowRect display:NO];

	if (trackingRectTag)
		[self removeTrackingRect:trackingRectTag];
	trackingRectTag = [self addTrackingRect:[self frame] owner:self userData:NULL assumeInside:NO];
}

- (BOOL) isFlipped {
	// Coordinates are based on top left corner
    return YES;
}

- (float) descriptionHeight {
	return haveText ? textHeight : 0.0f;
}

- (int) descriptionRowCount {
	int rowCount = textHeight / lineHeight;
	BOOL limitPref = YES;
	READ_GROWL_PREF_BOOL(GrowliCalLimitPref, GrowliCalPrefDomain, &limitPref);
	if (limitPref)
		return MIN(rowCount, MAX_TEXT_ROWS);
	else
		return rowCount;
}
@end