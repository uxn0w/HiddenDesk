//
//  HideDesktopMethod.h
//  HiddenDesk
//
//  Created by Damian on 10.09.2023.
//

@protocol HideDesktopMethod<NSObject>

@required
- (BOOL) isHidden;

@required
- (void) toggleVisibility;

@end
