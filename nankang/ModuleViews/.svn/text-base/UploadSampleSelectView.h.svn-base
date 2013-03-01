//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;
@class NKSample;
@class Project;
@interface UploadSampleSelectView : UIView<UITableViewDataSource,UITableViewDelegate>
{
  RootViewController*rootview;
  UITableView*tableview;
  NSMutableArray*samples;
  NSMutableArray*status;
  UIView *viewback;
  NSMutableArray*sampleSelected;
  Project*project;
    NSMutableArray *pprojects;
 
}
-(void)refreshView;
@property(retain,nonatomic) Project*project;
@property(retain,nonatomic) NKSample* selectedSample;
@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic) NSMutableArray*samples;
@property(retain,nonatomic) NSMutableArray*sampleSelected;
@end
