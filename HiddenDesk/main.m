//
//  main.m
//  HiddenDesk
//
//  Created by Damian on 10.09.2023.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    AppDelegate *delegate = [AppDelegate new];
    NSApplication.sharedApplication.delegate = delegate;
    [NSApplication.sharedApplication run];
    return NSApplicationMain(argc, argv);
}
