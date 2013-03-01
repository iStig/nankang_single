//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

@interface ProjectListView : UIView<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
  RootViewController*rootview;
  UITableView*tableview;
  NSMutableArray*mProjects;
  int mCurrentSelected;
}
-(void)refreshView;
-(void)resetCurrentProject;//复原当前选中的项目
-(int)getProjectDownloadProgress:(Project*)project;
-(int)getProjectUploadProgress:(Project*)project;
-(Project*)getSelectedProject;
@property(retain,nonatomic)  NSMutableArray*mProjects;
@property(assign,nonatomic) int mCurrentSelected;
@property(retain,nonatomic) RootViewController*rootview;
@end
