//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

@interface ProjectSelectView : UIView<UITableViewDataSource,UITableViewDelegate>
{
  RootViewController*rootview;
  UITableView*tableview;
  NSMutableArray*projects;
  UIButton*btn;
  UIView *viewback;
}
-(void)refreshView;
@property(retain,nonatomic)  NSMutableArray*projects;
@property(assign,nonatomic) int selectedProject;
@property(retain,nonatomic) RootViewController*rootview;
@end
