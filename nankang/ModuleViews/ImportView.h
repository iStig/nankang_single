//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

@interface ImportView : UIView<UITableViewDataSource,UITableViewDelegate>
{
  RootViewController*rootview;
  IBOutlet  UIButton *btn1,*btn2,*btn3,*btn4,*btn5;
  IBOutlet  UIButton *suree;  
  NSMutableArray *zipfiles;
  UIView *viewback;
    UITableView*tableview;
     UILabel*label1;
    NSMutableArray*status; 
}
-(void)refreshView;

@property(retain,nonatomic) RootViewController*rootview;


@end
