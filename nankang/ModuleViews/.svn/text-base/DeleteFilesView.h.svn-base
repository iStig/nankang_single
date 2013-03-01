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
@interface DeleteFilesView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    RootViewController*rootview;
    UITableView*tableview;
    NSMutableArray*mprojects;//项目列表
    NSArray *imgArray;
    UILabel *labText;
    NSMutableArray *pprojects;
    NSMutableArray*status;
    IBOutlet UIButton *suree;
    UIView *viewback;
}
-(void)refreshView;

@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic)  NSMutableArray *projects;

@end

