//
//  AppDelegate.m
//  nankang
//
//  Created by xudong jin on 12-7-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "RootViewController.h"
#import "PathHelper.h"
#import "User.h"
#import "SurveyXMLReader.h"
#import "CJSONDeserializer.h"
#import "SuveyAnswer.h"
#import "UTSystemHelper.h"
#import "Publicdef.h"
#import "LocationManager.h"
@implementation AppDelegate

@synthesize window = _window;
@synthesize rootNavigationController,rootController;
@synthesize users,isLocalLogin;

- (void)dealloc
{
  [_window release];
  [rootNavigationController release];
    [super dealloc];
}
- (void)saveConversationsToLocal {
	NSString *filePath = [PathHelper getdocumentFilePath:@"users.db"];
	[NSKeyedArchiver archiveRootObject:users toFile:filePath];
  
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  isLocalLogin=YES;;
  NSString *filePath = [PathHelper getdocumentFilePath:@"users.db"];
  users = [[NSKeyedUnarchiver unarchiveObjectWithFile:filePath]retain];
  if (users==nil) {
    users=[[NSMutableArray alloc]init];
  }

    SurveyXMLReader* r = [[SurveyXMLReader alloc] init];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.

  //currentUser=[users objectAtIndex:0];

  
  

  rootController = [[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil] autorelease];
  rootNavigationController = [[[UINavigationController alloc] initWithRootViewController:rootController] autorelease];
  self.window.rootViewController=rootNavigationController;
  
 
 
    [self.window makeKeyAndVisible];
   LoginViewController *loginViewController = [[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil] autorelease];
  
  [self.window.rootViewController presentModalViewController:loginViewController animated:YES];
     return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
-(void)showLoginView
{
  LoginViewController *loginViewController = [[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil] autorelease];
  
  [self.window.rootViewController presentModalViewController:loginViewController animated:YES];

}
- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
    [self saveConversationsToLocal];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */

}
+(AppDelegate*)getAppDelegate
{
  return (AppDelegate*)[UIApplication sharedApplication].delegate;
}
-(void)loginSucess:(User*)loginuser
{
  BOOL find=FALSE;

  for (User*user in users) {
    //如果之前已经登录过则更新用户信息
    if([user.username isEqualToString:loginuser.username]&&[user.companyCode isEqualToString:loginuser.companyCode])
    {
      find=TRUE;
      user.password=[loginuser.password retain];
       currentUser=user;
      break;
    }
  }
  if (!find) {
    [users addObject:loginuser];
     currentUser=[loginuser retain];
  }
 
   [self.window.rootViewController dismissModalViewControllerAnimated:YES];
}
-(User*)getCurrentUser
{
  return currentUser;
}
- (void)alert:(NSString*)title message:(NSString*)message
{
  
  
 UIAlertView * sAlert = [[UIAlertView alloc] initWithTitle:title
                                      message:message
                                     delegate:self
                            cancelButtonTitle:@"关闭"
                            otherButtonTitles:nil];
  [sAlert show];
  [sAlert release];
}
-(void)startGpsMonitor
{
  [((RootViewController*)rootController) startGpsMonitor ];
}
-(void)stopGpsMonitor
{
   [((RootViewController*)rootController) stopGpsMonitor ];
}
-(void)sendImageinfo
{
 
  {
      [((RootViewController*)rootController) sendImageinfo ];
  }


}
-(void)sendTrackInfo:(int)status quesitonIndex:(int)index
{
  
}
-(NSString*)getSampleValueForKey:(NSString*)key
{
  return [((RootViewController*)rootController) getSampleValueForKey:key ];
}
-(void)setSampleValue:(NSString*)value ForKey:(NSString*)key
{
  
}
@end
