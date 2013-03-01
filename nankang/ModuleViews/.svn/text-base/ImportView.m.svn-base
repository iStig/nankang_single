//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "ImportView.h"
#import "PathHelper.h"
#import "UTSystemHelper.h"
#import "AppDelegate.h"

@implementation ImportView
@synthesize rootview;
- (id)initWithFrame:(CGRect)frame{
  self = [[[NSBundle mainBundle] loadNibNamed:@"ImportView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
      self.frame=frame;
      UIButton*btnclosed=[self viewWithTag:1];
      [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
      
      tableview=[self viewWithTag:22];
      tableview.delegate=self;
      tableview.dataSource=self;
      
     
  }
    
  NSFileManager *manager = [NSFileManager defaultManager];
  NSString *home =[PathHelper documentDirectoryPathWithName:@""];
  
  
  
  NSDirectoryEnumerator *direnum = [manager enumeratorAtPath:home];
  
  zipfiles = [NSMutableArray new];
  NSString *filename ;
  while (filename = [direnum nextObject]) {
    if ([[filename pathExtension] isEqualToString:@"zip"]) {
      [zipfiles addObject: filename];
    }
  }

  
    status=[[NSMutableArray alloc]init];
    [status removeAllObjects];
    for (int i=0;i<zipfiles.count+5;i++) {
        [status addObject:@"N"];
        
        
    }
  return self;
}



#pragma mark-
#pragma  mark TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return zipfiles.count;
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
    
    
    if(!cell)
    {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProjectCell" owner:nil options:nil] objectAtIndex:2];
        
        
        
    }
    
    
    
    label1=(UILabel*)[cell viewWithTag:2];
    label1.text=[zipfiles objectAtIndex:indexPath.row];
    
    UIButton*btnnn=(UIButton*)[cell viewWithTag:1];
    if ([[status objectAtIndex:indexPath.row]isEqualToString:@"N"]) {
        [btnnn setBackgroundImage:[UIImage imageNamed:@"复选框.png"] forState:UIControlStateNormal];
    }
    else {
        [btnnn setBackgroundImage:[UIImage imageNamed:@"复选框勾.png"] forState:UIControlStateNormal];
        
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
 
    if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
        
        [status replaceObjectAtIndex:indexPath.row withObject:@"N"];
        
    }
    else {
        [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
        
    }
    
  [tableView reloadData];
  
  return;

    for (int i=0; i<[zipfiles count];i++ ) {
        NSIndexPath *index=[NSIndexPath indexPathForRow:i inSection:0];
        if (indexPath.row == i) {
            [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
            
        }
        else {
            [status replaceObjectAtIndex:index.row withObject:@"N"];
        }
        
    } 


}



- (IBAction)sure:(id)sender{

       
    NSString* *newzipfiles=nil;
    for (int i=0; i<zipfiles.count;i++) {
        if ([[status objectAtIndex:i]isEqualToString:@"Y"]) {
            newzipfiles = [zipfiles objectAtIndex:i];
        }
    }
    
    //NSLog(@"======%d",newzipfiles.count);
  if (newzipfiles==nil) {
    [[AppDelegate getAppDelegate]alert:@"" message:@"请选择需要导入的文件"];
    return;
  }
  [rootview importProjectFile:newzipfiles];
    [rootview modualViewClosed:self];
   // self.hidden=YES;



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
     }
  [super setHidden:hidden];
}
#pragma mark-
#pragma  mark TableView delegate
-(void)closeView:(id)sender{
  
  self.hidden=YES;
  //[rootview modualViewClosed:self];
  
  
}



@end
