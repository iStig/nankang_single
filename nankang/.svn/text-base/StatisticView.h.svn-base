//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

#import "Project.h"

@interface StatisticView : UIControl<NKSurveyExcuteDelegate>{
  RootViewController*rootview;

  Project*mProject;
 

  UILabel*lblProjectName;
 
  UIView*mQuestionView;

  UIButton*btnAll;
  UIButton*btnPart;
    
    UILabel*lblTotal;
    UILabel*lblVisit;
    UILabel*lblSuccess;
    UILabel*lblfalse;
    
    UIView *viewcon;
  IBOutlet UIView *viewtt;  
    IBOutlet UITextField *text1,*text2;
    IBOutlet UIDatePicker *picker1,*picker2;
    IBOutlet UIButton *butt1,*butt2,*buser;
    IBOutlet UILabel *labe1,*labe2;
    
    NSDate *dateA,*dateB;
   

}
-(void)refreshView;
-(UIView*)getQuestionView;


@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic) Project*mProject;

@end
