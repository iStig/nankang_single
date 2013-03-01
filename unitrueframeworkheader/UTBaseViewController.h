//
//  BaseViewController.h
//  bee2cIos
//
//  Created by xudong jin on 12-2-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTBaseViewController : UIViewController
{
NSString *rightBarItemTitle;
    NSString *leftBarItemTitle;
}
@property (retain,nonatomic)NSString *rightBarItemTitle;
@property (retain,nonatomic)NSString *leftBarItemTitle;
-(void)initSwitchChannelNavigationTitle:(NSString*)title;

@end
