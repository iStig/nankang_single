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
@interface SampleSelectView : UIView<UITableViewDataSource,UITableViewDelegate>
{
  RootViewController*rootview;
  UITableView*tableview;
  NSMutableArray*samples;
    
  UIView *viewback;
    

}
-(void)refreshView;
@property(assign,nonatomic) NKSample* selectedSample;
@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic) NSMutableArray*samples;

@end
