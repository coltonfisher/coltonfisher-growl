//
//  GrowlBubblesWindowView.h
//  Growl
//
//  Created by Nelson Elhage on Wed Jun 09 2004.
//  Name changed from KABubbleWindowView.h by Justin Burns on Fri Nov 05 2004.
//  Copyright (c) 2004 Nelson Elhage. All rights reserved.
//

#import <AppKit/NSView.h>

#import "GrowlBubblesPrefsController.h" // to get the limit pref

@interface GrowlBubblesWindowView : NSView {
	NSImage				*_icon;
	NSString			*_title;
	NSAttributedString  *_text;
	float				_textHeight;
	SEL					_action;
	id					_target;
    NSColor             *_bgColor;
}


- (void)setPriority:(int)priority;
- (void) setIcon:(NSImage *) icon;
- (void) setTitle:(NSString *) title;
- (void) setAttributedText:(NSAttributedString *) text;
- (void) setText:(NSString *) text;

- (void) sizeToFit;
- (float) descriptionHeight;
- (int) descriptionRowCount;
	
- (id) target;
- (void) setTarget:(id) object;

- (SEL) action;
- (void) setAction:(SEL) selector;
@end

