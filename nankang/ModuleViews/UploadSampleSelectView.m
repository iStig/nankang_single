//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "UploadSampleSelectView.h"
#import "Project.h"
#import "NKSample.h"
#import "AppDelegate.h"
@implementation UploadSampleSelectView
@synthesize rootview,selectedSample,samples,sampleSelected,project;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"UploadSampleSelectView" owner:nil options:nil] objectAtIndex:0];
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
    selectedSample=nil;
    sampleSelected=[NSMutableArray new];

    pprojects=[[NSMutableArray alloc]initWithObjects:@"所有样本",nil];
    status=[[NSMutableArray alloc]init];
      
  }
 

  return self;
}

/*
-(void)setProject:(NSMutableArray *)projects
{
    [sampleSelected removeAllObjects];
    sampleSelected=[projects retain];
    [status removeAllObjects];
    //[pprojects removeAllObjects];
    //先填充前三个；
    for (int i=0;i<projects.count+3;i++) {
        [status addObject:@"N"];
        if (i>=3) {
            Project*project=[projects objectAtIndex:(i-3)];
            [pprojects addObject:project.ProjectName];
        }
        
        
    }
}
 -(NSArray*)getSuccessSamplesForProject
 {
 NSMutableArray*arry=[NSMutableArray new];
 
 for (NKSample*sample in project.samples) {
 //if (sample.status==50) 
 [status addObject:@"N"];
 {
 [arry addObject:sample];
 }
 
 }
 return  arry;
 }
 
 -(void)setProject:(Project *)pro
 {
 
 
 project=pro;
 samples=[self getSuccessSamplesForProject];
 }

*/
-(NSArray*)getSuccessSamplesForProject
{
    //NSMutableArray*arry=[NSMutableArray new];
 
    
    NSLog(@"%d",samples.count+1);
    NSMutableArray*arry=[[NSMutableArray alloc]initWithObjects:@"所有样本",nil];
    for (NKSample*sample in project.samples) {
        //if (sample.status==50) 
        [status addObject:@"N"];

        if (arry.count>0) {
            [arry addObject:sample];
        }
    }
    NSLog(@"======%d",status.count);
    for (int i=0; i<1; i++) {
        [status addObject:@"N"];
    }
    NSLog(@"======%d",status.count);
    return  arry;
}

-(void)setProject:(Project *)pro
{  
    project=pro;
    samples=[self getSuccessSamplesForProject];
}


-(void)OKClicked:(id)sender
{
    NSMutableArray *savesamples; 
    for (int p=1; p<status.count; p++) {
        if ([[status objectAtIndex:p]isEqualToString:@"Y"]) {
            savesamples=[samples objectAtIndex:p];
            
            selectedSample  = [samples objectAtIndex:p];       
        }
        
    }
    
  if (selectedSample==nil) {
    [[AppDelegate getAppDelegate]alert:@"提示信息" message:@"请选择需上传的样本"];
    return;
  }
  else {
      [sampleSelected removeAllObjects];
      for (NKSample*sample in samples) {
          [sampleSelected addObject:sample];
      }
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
    [self.superview bringSubviewToFront: self];
  }
  [super setHidden:hidden];
}
#pragma mark-
#pragma  mark TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return samples.count;
  //return pprojects.count; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  return  50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
  static NSString *identify = @"ProjectCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
  
  
  //if(!cell)
  {
    
    cell = [[[NSBundle mainBundle] loadNibNamed:@"ProjectCell" owner:nil options:nil] objectAtIndex:3];
    
    
    
  }  
  
    
    if (indexPath.row >0) {
        NKSample*sample=[samples objectAtIndex:indexPath.row];
        UILabel*label2=(UILabel*)[cell viewWithTag:4];
        label2.text=[sample.sampleId isKindOfClass:[NSNull class]]?@"":sample.sampleId;
        
        UILabel*label1=(UILabel*)[cell viewWithTag:2];
        label1.hidden=YES;
        
        UIButton*btnnn=(UIButton*)[cell viewWithTag:1];
        btnnn.hidden=YES;
        UIButton*btnn=(UIButton*)[cell viewWithTag:5];
        if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
            [btnn setBackgroundImage:[UIImage imageNamed:@"复选框勾.png"] forState:UIControlStateNormal];
        }
        else {
            [btnn setBackgroundImage:[UIImage imageNamed:@"复选框.png"] forState:UIControlStateNormal];
            
        } 

    } 
    else {
        UILabel*label1=(UILabel*)[cell viewWithTag:2];        
        label1=(UILabel*)[cell viewWithTag:2];
        label1.text=[pprojects objectAtIndex:indexPath.row];
        
        UILabel*label2=(UILabel*)[cell viewWithTag:4];
        label2.hidden=YES;
        
        UIButton*btnnn=(UIButton*)[cell viewWithTag:1];
        if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
            [btnnn setBackgroundImage:[UIImage imageNamed:@"复选框勾.png"] forState:UIControlStateNormal];
        }
        else {
            [btnnn setBackgroundImage:[UIImage imageNamed:@"复选框.png"] forState:UIControlStateNormal];
            
        }
        UIButton*btnn=(UIButton*)[cell viewWithTag:5];
        btnn.hidden=YES;

    }
 
    
    
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    NSLog(@"%i",indexPath.row); 
    
    if (indexPath.row==0) {
        if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
            
            [status replaceObjectAtIndex:indexPath.row withObject:@"N"];
            for (int p=1; p<status.count; p++) {
                [status replaceObjectAtIndex:p withObject:@"N"];
            }
        }
        else {
            [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
            for (int p=1; p<status.count; p++) {
                [status replaceObjectAtIndex:p withObject:@"Y"];
            }
        }
        
    }

    
    
    //for (int i=indexPath.row; i<pprojects.count; i++) 
    if (indexPath.row>0) 
    {
        if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]){
            [status replaceObjectAtIndex:indexPath.row withObject:@"N"];
        }
        else {
            [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
        }
        
        BOOL bb =YES;
        for (int p=1; p<status.count; p++) {
            if ([[status objectAtIndex:p]isEqualToString:@"N"]) {
                bb=NO;
            }

        } 
        
        if (bb) {
            [status replaceObjectAtIndex:0 withObject:@"Y"];
        }
        else {
            [status replaceObjectAtIndex:0 withObject:@"N"];

        }
    }
    
    
    [tableView reloadData];
    return;
    
    

  for (int i=0; i<[samples count];i++ ) {
    
    NSIndexPath *index=[NSIndexPath indexPathForRow:i inSection:0];
    
    if (indexPath.row==i) {
      
      UIButton      *btn = (UIButton *)[[tableview cellForRowAtIndexPath:indexPath] viewWithTag:1];
      [btn setBackgroundImage:[UIImage imageNamed:@"复选框勾.png"] forState:UIControlStateNormal];
    }
    else{
      
      UIButton      *btn = (UIButton *)[[tableview cellForRowAtIndexPath:index ] viewWithTag:1];
      [btn setBackgroundImage:[UIImage imageNamed:@"复选框.png"] forState:UIControlStateNormal];
      
      
    }
    // [self cancle:[selectTableView cellForRowAtIndexPath:indexPath]];
    
    selectedSample=[[rootview getNewSampleList4SelectedProject] objectAtIndex:indexPath.row];
  }
}

-(void)closeView:(id)sender{
  
  self.hidden=YES;
 // [rootview modualViewClosed:self];
  
  
}
@end
