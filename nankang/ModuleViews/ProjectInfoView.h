//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;
@class Project;
@interface ProjectInfoView : UIView
{
  RootViewController*rootview;

  Project*project;//待显示概况的项目
    IBOutlet UIButton *bttt;
     UIView *viewback;
   IBOutlet UILabel *label1,*label2,*label3,*label4,*label5,*label6,*label7;
}
-(void)refreshView;

@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic)  Project*project;

@end
