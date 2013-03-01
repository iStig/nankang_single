//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "ProjectSelectView.h"
#import "Project.h"
#import "AppDelegate.h"
@implementation ProjectSelectView
@synthesize rootview,selectedProject,projects;
- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"ProjectSelectView" owner:nil options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
      self.frame=frame;
      tableview=[self viewWithTag:2];
      tableview.delegate=self;
      tableview.dataSource=self;
      UIButton*btnclosed=[self viewWithTag:1];
      [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
      UIButton*btn=[self viewWithTag:3];
      [btn addTarget:self action:@selector(OKClicked:) forControlEvents:UIControlEventTouchUpInside];
      selectedProject=-1;
        
       
    }
    return self;
}
-(void)OKClicked:(id)sender
{
  if (selectedProject==-1) {
    [[AppDelegate getAppDelegate]alert:@"提示信息" message:@"请选择项目"];
    return;
  }
  else {
      self.hidden=YES;
      [rootview modualViewClosed:self];
  }
 
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
    [tableview reloadData];
  }
   [super setHidden:hidden];
}
#pragma mark-
#pragma  mark TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return projects.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

  return  70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
  static NSString *identify = @"ProjectCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
  
  
  if(!cell)
  {
    
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProjectCell" owner:nil options:nil] objectAtIndex:2];
   
    
   
  }
  
 
    Project*project=[projects objectAtIndex:indexPath.row];
    UILabel*label1=(UILabel*)[cell viewWithTag:2];
    label1.text=project.ProjectName;
    
    UIButton*btn=(UIButton*)[cell viewWithTag:1];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"单选框.png"] forState:UIControlStateNormal];
    
    


  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  
 
  
    for (int i=0; i<[projects count];i++ ) {
      
      NSIndexPath *index=[NSIndexPath indexPathForRow:i inSection:0];
      
      if (indexPath.row==i) {
        
        UIButton      *btn = (UIButton *)[[tableview cellForRowAtIndexPath:indexPath] viewWithTag:1];
        [btn setBackgroundImage:[UIImage imageNamed:@"单选框点.png"] forState:UIControlStateNormal];
      }
      else{
        
        UIButton      *btn = (UIButton *)[[tableview cellForRowAtIndexPath:index ] viewWithTag:1];
        [btn setBackgroundImage:[UIImage imageNamed:@"单选框.png"] forState:UIControlStateNormal];
        
        
      }
      
    
    
    
    
    
  
    // [self cancle:[selectTableView cellForRowAtIndexPath:indexPath]];
    
    selectedProject=indexPath.row;
    }
}
-(void)closeView:(id)sender{
  
  self.hidden=YES;
//  [rootview modualViewClosed:self];
  
  
}
@end
