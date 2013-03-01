//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "ThemeView.h"
#import "UTSystemHelper.h"
#import "Publicdef.h"
#import "LoginViewController.h"
#import "BILayerClient.h"
#import "AppDelegate.h"
#import "AgentLoginResult.h"

@implementation ThemeView
@synthesize rootview;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"ThemeView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
    self.frame=frame;
    tableview=[self viewWithTag:2];
    tableview.delegate=self;
    tableview.dataSource=self;
      
      

      
    UIButton*btnclosed=[self viewWithTag:1];
    [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
    mThemes=[[NSMutableArray alloc]initWithObjects:@"科技蓝",@"休闲绿",@"激情红",@"商务白" ,nil];
      
      
   }
  
    NSString *str=[UTSystemHelper getCstSettingsByKey:Theme]; 
  
    
     status=[[NSMutableArray alloc]init];
    [status removeAllObjects];
    //[pprojects removeAllObjects];
    //先填充前三个；

    NSLog(@"%@",str);
    

    for (int i=0;i<mThemes.count;i++) {
        if (i==0) {
            if ([str isEqualToString:@"科技蓝"]) {
                [status addObject:@"Y"];
            }else {
                [status addObject:@"N"];
            }
        }
        if (i==1) {
            if ([str isEqualToString:@"休闲绿"]) {
                  [status addObject:@"Y"];
            }else {
                  [status addObject:@"N"];
            }
        }
        if (i==2) {
            if ([str isEqualToString:@"激情红"]) {
                [status addObject:@"Y"];
            }else {
                [status addObject:@"N"];
            }
        }
        if (i==3) {
            if ([str isEqualToString:@"商务白"]) {
                [status addObject:@"Y"];
            }else { 
                [status addObject:@"N"];
            }
        }
    }
   
   // if (!([str isEqualToString:@"科技蓝"] || [str isEqualToString:@"休闲绿"] || [str isEqualToString:@"激情红"] || [str isEqualToString:@"商务白"])) {
   //     [[status objectAtIndex:0]isEqualToString:@"Y"];
   // }
    

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

-(void)setProjects:(NSMutableArray *)projects
{
    [status removeAllObjects];
    //[pprojects removeAllObjects];
    //先填充前三个；
    for (int i=0;i<projects.count+5;i++) {
        [status addObject:@"N"];
        
        
    }
  
    
}
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
  return mThemes.count;
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
    
    cell = [[[NSBundle mainBundle] loadNibNamed:@"ProjectCell" owner:nil options:nil] objectAtIndex:2];
    
    
    
  }
  
    
    
    label1=(UILabel*)[cell viewWithTag:2];
    label1.text=[mThemes objectAtIndex:indexPath.row];
    
    UIButton*btnnn=(UIButton*)[cell viewWithTag:1];
    if ([[status objectAtIndex:indexPath.row]isEqualToString:@"N"]) {
        [btnnn setBackgroundImage:[UIImage imageNamed:@"单选框.png"] forState:UIControlStateNormal];
    }
    else {
        [btnnn setBackgroundImage:[UIImage imageNamed:@"单选框点.png"] forState:UIControlStateNormal];
        
    }

  
  cell.selectionStyle = UITableViewCellSelectionStyleNone;

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    
    
    for (int i=0; i<[mThemes count];i++ ) {
        NSIndexPath *index=[NSIndexPath indexPathForRow:i inSection:0];
        if (indexPath.row == i) {
            [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
         
        }
        else {
            [status replaceObjectAtIndex:index.row withObject:@"N"];
        }
  
    } 
    [tableView reloadData];

    return;
    
    
    
  
  for (int i=0; i<[mThemes count];i++ ) {
    
    NSIndexPath *index=[NSIndexPath indexPathForRow:i inSection:0];
    
    if (indexPath.row==i) {
      
      UIButton      *btn = (UIButton *)[[tableview cellForRowAtIndexPath:indexPath] viewWithTag:1];
      [btn setBackgroundImage:[UIImage imageNamed:@"单选框点.png"] forState:UIControlStateNormal];

        
    }
    else{
      
      UIButton      *btn = (UIButton *)[[tableview cellForRowAtIndexPath:index ] viewWithTag:1];
      [btn setBackgroundImage:[UIImage imageNamed:@"单选框.png"] forState:UIControlStateNormal];
      
      
    }
   
    
      
  }
}


- (IBAction)sure:(id)sender{
    
    User *user=[[User alloc]init];
    NSString*str=nil;
    for (int i=0;i<status.count;i++) {
        if ([[status objectAtIndex:i]isEqualToString:@"Y"]) {
            str = [mThemes objectAtIndex:i];
        }
    }
    NSLog(@"=====%@",str);
    
    
    [UTSystemHelper saveCstSettingsWithValue:str forKey:Theme];
   
    self.hidden=YES;
  if ([rootview respondsToSelector:@selector(modualViewClosed:)]) {
    [rootview modualViewClosed:self];
  }

    
    NSLog(@"%@", str);
}


-(void)closeView:(id)sender{
  
  self.hidden=YES;

  
}


@end
