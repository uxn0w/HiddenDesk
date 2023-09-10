//
//  AppDelegate.m
//  HiddenDesk
//
//  Created by Damian on 10.09.2023.
//

#import "AppDelegate.h"
#import "HideDesktopMethod.h"
#import "NSTaskHideDesktopMethod.h"

@interface AppDelegate ()
@property(nonatomic, retain)id <HideDesktopMethod> method;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [self setupMethod];
    [self setupComponents];
    [self updateComponents];
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

// MARK: - Setup methods
- (void) setupComponents {
    mainMenuItem = [
        [NSMenuItem alloc] initWithTitle: @""
        action:@selector(toggleDesktopFoldersVisibility)
        keyEquivalent:@""
    ];
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength: 18];
    statusItem.button.image = [
        NSImage imageWithSystemSymbolName: @"" accessibilityDescription: nil
    ];
    [statusItem setMenu: [self makeMenu]];
}

- (void) setupMethod {
    self.method = [NSTaskHideDesktopMethod new];
}

- (void) updateComponents {
    bool isHidden = [self.method isHidden];
    statusItem.button.image = [
        NSImage
        imageWithSystemSymbolName: (isHidden) ? @"eye.slash.fill" : @"eye"
        accessibilityDescription: nil
    ];
    mainMenuItem.title = (isHidden) ? @"Show desktop icons" : @"Hide desktop icons";
}

// MARK: - Menu fabrication
- (NSMenu*)makeMenu {
    
    NSMenu *menu = [NSMenu new];
    
    NSMenuItem *aboutAppItem = [
        [NSMenuItem alloc] initWithTitle: @"About app"
        action:nil
        keyEquivalent:@""
    ];
    
    NSMenuItem *quitItem = [
        [NSMenuItem alloc] initWithTitle:@"Quit"
        action: @selector(quit_application)
        keyEquivalent:@"Q"
    ];
    [menu addItem: mainMenuItem];
    [menu addItem: aboutAppItem];
    [menu addItem: NSMenuItem.separatorItem];
    [menu addItem: quitItem];
    return menu;
}

// MARK: - Menu Actions
- (void) toggleDesktopFoldersVisibility {
    [self.method toggleVisibility];
    [self updateComponents];
}

- (void) quit_application {
    exit(0);
}

@end
