

#import <Foundation/Foundation.h>
#import "User.h"

@class Status;
@class Comment;
@class User;
@class Draft;
@class WeiboAccount;

@interface UTAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BOOL connectionStatus;
    UIViewController*mCurrentView;

    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


+ (void) increaseNetworkActivityIndicator;
+ (void) decreaseNetworkActivityIndicator;



- (void)signIn:(WeiboAccount *)user;
- (void)signOut;


- (void)refresh;
-(void)openLoginView;
-(void)openRegisterView;
-(void)openLogin;
@end
