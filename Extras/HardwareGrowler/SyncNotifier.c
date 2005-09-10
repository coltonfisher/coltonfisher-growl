//
//  SyncNotifier.c
//  HardwareGrowler
//
//  Created by Ingmar Stein on 03.09.05.
//  Copyright 2005 The Growl Project. All rights reserved.
//

#include "SyncNotifier.h"

static struct SyncNotifierCallbacks callbacks;

extern void NSLog(CFStringRef format, ...);

static void syncStarted(CFNotificationCenterRef center, 
						void *observer, 
						CFStringRef name, 
						const void *object, 
						CFDictionaryRef userInfo) {
#pragma unused(center,observer,name,object,userInfo)
	if (callbacks.syncStarted)
		callbacks.syncStarted();
}

static void syncFinished(CFNotificationCenterRef center, 
						 void *observer, 
						 CFStringRef name, 
						 const void *object, 
						 CFDictionaryRef userInfo) {
#pragma unused(center,observer,name,object)
	CFStringRef status = CFDictionaryGetValue(userInfo, CFSTR("ISyncPlanStatus"));
	if (callbacks.syncFinished && status && CFStringCompare(status, CFSTR("Finished"), 0) == kCFCompareEqualTo)
		callbacks.syncFinished();
	// else if (CFStringCompare(status, CFSTR("Cancelled"), 0) == kCFCompareEqualTo)
}

void SyncNotifier_init(const struct SyncNotifierCallbacks *c) {
	callbacks = *c;
	CFNotificationCenterRef center = CFNotificationCenterGetDistributedCenter();
	CFNotificationCenterAddObserver(/*center*/ center,
									/*observer*/ "SyncNotifier",
									/*callBack*/ syncStarted,
									/*name*/ CFSTR("com.apple.syncservices.ISyncPlanChangedNotification"),
									/*object*/ CFSTR("ISyncPlanCreated"),
									/*suspensionBehavior*/ CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(/*center*/ center,
									/*observer*/ "SyncNotifier",
									/*callBack*/ syncFinished,
									/*name*/ CFSTR("com.apple.syncservices.ISyncPlanChangedNotification"),
									/*object*/ CFSTR("ISyncPlanEnded"),
									/*suspensionBehavior*/ CFNotificationSuspensionBehaviorCoalesce);
}

void SyncNotifier_dealloc(void) {
	CFNotificationCenterRemoveEveryObserver(CFNotificationCenterGetDistributedCenter(),
											"SyncNotifier");
}
