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
#import "SurveyManager.h"
@interface SurveyExcuteView : UIView<NKSurveyExcuteDelegate,UITableViewDataSource,UITableViewDelegate>{
  RootViewController*rootview;

  Project*mProject;
  NSString*strSampleName;
 int mCurrentSelectedSection;
  int mCurrentSelectedRow;
  UILabel*lblProjectName;
  UILabel*lblSampleName;
  UIView*mQuestionView;

  UIButton*btnPrev;
  UIButton*btnNext;
  UILabel*lblRecord;//答题纪录
  UITableView *tableview;
  NSMutableArray*mQuestionList;
  int currentAnsweredIndex;
 // NSMutableArray*mSelectedStatus;
  NSMutableArray*mAnswerslist;//已达题目列表，用于在答卷显示中标注哪些题目是已答的


}
-(void)refreshView;
-(UIView*)getQuestionView;



@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic) Project*mProject;
@property(retain,nonatomic)  NSString*strSampleName;
@property(assign,nonatomic)  int currentAnsweredIndex;
-(void)setQuestionList:(NSMutableArray *)questions andAnswers:(NSMutableArray *)answers;
@end
