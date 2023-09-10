//
//  NSTaskHideDesktopMethod.m
//  HiddenDesk
//
//  Created by Damian on 10.09.2023.
//

#import <Foundation/Foundation.h>
#import "NSTaskHideDesktopMethod.h"

@implementation NSTaskHideDesktopMethod

- (BOOL)isHidden {
    NSString *output = [
        self runCommand: @"defaults read com.apple.finder CreateDesktop"
    ];
    output = [output stringByReplacingOccurrencesOfString: @"\n" withString: @""];
    return ([output isEqualToString: @"true"]) ? false : true;
};

- (void)toggleVisibility {
    NSString *hiddenString = ([self isHidden]) ? @"true" : @"false";
    NSString *command = [
        NSString stringWithFormat: @"defaults write com.apple.finder CreateDesktop %@; killall Finder",
        hiddenString
    ];
    [self runCommand: command];
}

- (NSString *)runCommand:(NSString *)command
{
    NSTask *task = [NSTask new];
    
    [task setLaunchPath: @"/bin/sh"];
    
    NSArray *arguments = [
        NSArray arrayWithObjects: @"-c",
        [NSString stringWithFormat: @"%@", command],
        nil
    ];
    
    [task setArguments: arguments];

    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];

    NSFileHandle *file = [pipe fileHandleForReading];
    [task launch];
    [task waitUntilExit];

    NSData *data = [file readDataToEndOfFile];
    NSString *output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    
    return output;
}

@end
