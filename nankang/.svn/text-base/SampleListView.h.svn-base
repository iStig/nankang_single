//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;
#import "NKSample.h"
#import "Project.h"
#import "SampleInfoView.h"
@interface SampleListView : UIView<UITableViewDataSource,UITableViewDelegate>
{
  RootViewController*rootview;
  UITableView*tableview;
  Project*mProject;
 int mCurrentSelectedSection;
  int mCurrentSelectedRow;
  NKSample*mCurrentSelectedSample;
  UILabel*lblProjectName;
   NSMutableDictionary*mSampleListWithStatus;//按照样本状态分成的样本列表
   NSMutableArray*mSamplesShow;//当前显示的样本列表
   UILabel*mSampleStatus;
  int mCurrentShowStatus;//当先展示的样本状态:-2未访问，50访问成功，其他访问失败
  
}
-(void)refreshView;
-(void)resetCurrentSample;//复原当前的样本;
-(NKSample*)getSelectedSample;
-(void)groupClicked:(id)sender;
-(void)switchClicked:(id)sender;
@property(retain,nonatomic)  NSMutableDictionary*mSampleListWithStatus;
@property(retain,nonatomic)    NKSample*mCurrentSelectedSample;;

@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic) Project*mProject;
@end
