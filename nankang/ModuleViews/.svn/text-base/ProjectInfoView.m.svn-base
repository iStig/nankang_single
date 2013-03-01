//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "ProjectInfoView.h"
#import "Project.h"
#import "NKSample.h"
@implementation ProjectInfoView
@synthesize rootview,project;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"ProjectInfoView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
    self.frame=frame;
   
    UIButton*btnclosed=[self viewWithTag:1];
    [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
      
     
  }
    
   
   //label1.text=project.ProjectName;

     return self;
}

- (IBAction)sure:(id)sender{
    
    
    
    self.hidden=YES;
    
    [rootview modualViewClosed:self];
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)setHidden:(BOOL)hidden
{
  if (!hidden) {
    //刷新界面
    label1.text = [NSString stringWithFormat:@"  %@", project.ProjectName];
    label2.text = [NSString stringWithFormat:@"  自%@", project.TaskStartTime];
    label6.text = [NSString stringWithFormat:@"  至%@",  project.TaskEndTime];
    label3.text = [NSString stringWithFormat:@"  %d", project.samples.count];
    int visitnum=0;
    int successnum=0;
    int losingnum = 0;
    for (NKSample*sample in project.samples) {
      if (sample.status!=-2) {
        visitnum++;
      }
      if (sample.status==50) {
        successnum++;
      }
      if (sample.status!=-2&&sample.status!=50) {
        losingnum++;
      }

    }
     label4.text = [NSString stringWithFormat:@"  %d", visitnum];
     label5.text = [NSString stringWithFormat:@"  %d", successnum];
     label7.text  = [NSString stringWithFormat:@"  %d", losingnum];
  }
    
   [super setHidden:hidden];
}
-(void)closeView:(id)sender{
  
  self.hidden=YES;
  [rootview modualViewClosed:self];
  
  
}
@end
