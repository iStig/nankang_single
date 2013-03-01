//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "SurveyExcuteView.h"
#import "Project.h"
#import "Model_Question.h"
@implementation SurveyExcuteView
@synthesize rootview,mProject,strSampleName,currentAnsweredIndex;
- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"SurveyExcuteView" owner:nil options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
      self.frame=frame;
      mCurrentSelectedRow=-1;
      mCurrentSelectedSection=-1;
      lblProjectName=[self viewWithTag:1];
      mQuestionView=[self viewWithTag:2];
      lblSampleName=[self viewWithTag:3];
      lblRecord=[self viewWithTag:5];
      tableview=[self viewWithTag:6];
      tableview.dataSource=self;
      tableview.delegate=self;
      currentAnsweredIndex=0;
      mQuestionList=[NSMutableArray new];
      mAnswerslist=[NSMutableArray new];
      [((UIButton*)[self viewWithTag:7])addTarget:self action:@selector(closeSurvey:) forControlEvents:UIControlEventTouchUpInside];
      [((UIButton*)[self viewWithTag:8])addTarget:self action:@selector(switchProject:) forControlEvents:UIControlEventTouchUpInside];
   //   mSelectedStatus=[NSMutableArray new];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)refreshView
{
  lblSampleName.text=[[NSString alloc]initWithFormat:@"样本编号:%@" ,strSampleName];
  lblProjectName.text=mProject.ProjectName;
  lblRecord.text=[[NSString alloc]initWithFormat:@"答题纪录(%d/%d)",currentAnsweredIndex,mQuestionList.count];
   [tableview reloadData];
  }

-(void)setHidden:(BOOL)hidden
{
  if (!hidden) {
    [self refreshView];
    [self.superview bringSubviewToFront:self];
      }
   [super setHidden:hidden];
}
-(UIView*)getQuestionView
{
  return mQuestionView;
}
#pragma mark-
#pragma  mark NKSurveyExcuteDelegate 
-(void)surveyExcuteStatus:(BOOL)finished currentQIndex:(int) currentQIndex
{
 [rootview sendImageinfo];

[rootview sendTrackinfo:currentQIndex];
 
  if(finished)
  {
   
    [rootview surveyFinished:true];
    
  }
  else  if(currentQIndex>=0){
    
   lblRecord.text=[[NSString alloc]initWithFormat:@"答题纪录(%d/%d)",currentQIndex,mQuestionList.count];
    mAnswerslist=[rootview.mSurveyManager getQuestionAnswer];
    [tableview reloadData];
    
  }
 

  NSLog(@"%d",currentQIndex);
}

#pragma mark-
#pragma  mark TableView delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return mAnswerslist.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{     
  
  return 44;
  //  return mCurrentSelectedSection==indexPath.section&&mCurrentSelectedRow==indexPath.row?80:45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
  static NSString *identify = @"AnswerRecordCell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
  
  
  if(!cell)
  {
    
    
    //    cell = [[[NSBundle mainBundle] loadNibNamed:@"SampleCell" owner:nil options:nil] objectAtIndex:(indexPath.row==mCurrentSelectedRow&&indexPath.section==mCurrentSelectedSection?1:0)];
    cell = [[[NSBundle mainBundle] loadNibNamed:@"AnswerRecordCell" owner:nil options:nil] objectAtIndex:0];
    
  }
  Model_Question *question=[mAnswerslist objectAtIndex:indexPath.row];
  UILabel*label1=(UILabel*)[cell viewWithTag:2];
  label1.text=question.Title ;
  UIButton*btn=[cell viewWithTag:1];
  [btn setSelected:TRUE];
  
  return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  [rootview backQuestion:[mAnswerslist objectAtIndex:indexPath.row ] ];
}
-(void)setQuestionList:(NSMutableArray *)questions andAnswers:(NSMutableArray *)answers
{
 lblRecord.text=[[NSString alloc]initWithFormat:@"答题纪录(0/%d)",questions.count];
  
    [mQuestionList removeAllObjects];
    [mQuestionList addObjectsFromArray:questions];
    //[mSelectedStatus removeAllObjects];
//    for (int i=0;i<questions.count;i++) {
//        [mSelectedStatus addObject:@"N"];
//      
//    }
   [mAnswerslist removeAllObjects];
  if (answers!=nil) {
   
    [mAnswerslist addObjectsFromArray:answers];
 
//    for (Model_Question*answer in answers) {
//      int index=[self getQuestionIndex4Answer:answer];
//      if (index>=0) {
//        [mSelectedStatus replaceObjectAtIndex:index withObject:@"Y"];
//      }
//    }
    
    
  }
 
 
}
-(int)getQuestionIndex4Answer:(Model_Question*)answer
{
  for (int i=0;i<mQuestionList.count;i++) {
    Model_Question*question=[mQuestionList objectAtIndex:i];
    if ([question.Id isEqualToString:answer.Id]) {
      return i;
    }
  }
  return -1;
}
//中断访问
-(void)closeSurvey:(id)sender
{
  [rootview closeSurvey:FALSE];
}
-(void)switchProject:(id)sender
{
  [rootview closeSurvey:TRUE];
}
@end
