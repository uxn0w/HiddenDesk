//
//  AppDelegate.h
//  HiddenDesk
//
//  Created by Damian on 10.09.2023.
//

#import <Cocoa/Cocoa.h>
#import "HideDesktopMethod.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    
    NSStatusItem *statusItem;
    
    @private
    NSMenuItem *mainMenuItem;
}
@end
