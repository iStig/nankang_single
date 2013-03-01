//
//  CustomTabBar.h
//  CstWeibo
//
//  Created by xudong jin on 12-3-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CustomTabBar : UITabBarController {
    NSMutableArray *buttons;
    int currentSelectedIndex;
    UIImageView *slideBg;
    NSMutableArray *tabimages;
}

@property (nonatomic,assign) int currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;
@property (nonatomic,retain) NSMutableArray *tabimages;
- (void)hideRealTabBar;
- (void)customTabBar;
- (void)selectedTab:(UIButton *)button;
- (void)setTabImages:(NSArray *)images;

@end
