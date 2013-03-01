//
//  AppDelegate.h
//  nankang
//
//  Created by xudong jin on 12-7-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTAppDelegate.h"
#import "User.h"
@interface AppDelegate : UTAppDelegate <UIApplicationDelegate,UIAlertViewDelegate>
{
    NSMutableArray*users;
  User*currentUser;
  BOOL isLocalLogin;//是否本地登陆;
}
@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic)  BOOL isLocalLogin;
@property (nonatomic, retain)  NSMutableArray*users;
@property (strong, nonatomic) UINavigationController *rootNavigationController;
@property (strong, nonatomic) UIViewController *rootController;
+(AppDelegate *)getAppDelegate;
-(void)loginSucess:(User*)loginuser;
-(User*)getCurrentUser;
- (void)alert:(NSString*)title message:(NSString*)message;
-(void)showLoginView;
-(void)startGpsMonitor;//开始gps监控
-(void)stopGpsMonitor;
-(void)sendImageinfo;
-(void)sendTrackInfo:(int)status quesitonIndex:(int)index;
-(NSString*)getSampleValueForKey:(NSString*)key;
-(void)setSampleValue:(NSString*)value ForKey:(NSString*)key;
@end
