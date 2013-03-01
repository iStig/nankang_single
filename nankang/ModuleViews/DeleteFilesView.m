//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "DeleteFilesView.h"
#import "Project.h"
#import "NKSample.h"
@implementation DeleteFilesView
@synthesize rootview,projects;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"DeleteFilesView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
    self.frame=frame;
    tableview=[self viewWithTag:2];
    tableview.delegate=self;
    tableview.dataSource=self;
      
   

    UIButton*btnclosed=[self viewWithTag:1];
    [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
    pprojects=[[NSMutableArray alloc]initWithObjects:@"离线导出文件",@"离线下发文件",@"所有项目文件",nil];
      status=[[NSMutableArray alloc]init];
    mprojects=[NSMutableArray new];
      
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

#pragma mark-
#pragma  mark TableView delegate
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.

  return pprojects.count;
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
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProjectCell" owner:nil options:nil] objectAtIndex:3];
        
        
        
    }
    
    
    if (indexPath.row<=2) {
        
        UILabel*label1=(UILabel*)[cell viewWithTag:2];
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
    else {
        //Project*project=[projects objectAtIndex:indexPath.row];
        //label1.text=project.ProjectName;

        UILabel*label1=(UILabel*)[cell viewWithTag:2];
        label1.hidden=YES;
        UILabel*label2=(UILabel*)[cell viewWithTag:4];
        label2.text=[pprojects objectAtIndex:indexPath.row];
  
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%i",indexPath.row); 
    
    if (indexPath.row<=1) {
        if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
            
            [status replaceObjectAtIndex:indexPath.row withObject:@"N"];
        }
        else {
            [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
        }

    }
    if (indexPath.row==2) {
            if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
                
                [status replaceObjectAtIndex:indexPath.row withObject:@"N"];
                for (int i=indexPath.row+1; i<status.count;i++) {
                    [status replaceObjectAtIndex:i withObject:@"N"];
                }
            }
            else {
                [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
                for (int i=indexPath.row+1; i<status.count;i++) {
                    [status replaceObjectAtIndex:i withObject:@"Y"];
                }
       }
  
    }
    
    
    //for (int i=indexPath.row; i<pprojects.count; i++) 
    if (indexPath.row>2) 
    {
        int k = indexPath.row-2;
        int p = indexPath.row-k;
        if ([[status objectAtIndex:p]isEqualToString:@"Y"]){
            [status replaceObjectAtIndex:p withObject:@"N"];
        }

        
        if ([[status objectAtIndex:indexPath.row]isEqualToString:@"Y"]) {
            
            [status replaceObjectAtIndex:indexPath.row withObject:@"N"];
        }
        else {
            [status replaceObjectAtIndex:indexPath.row withObject:@"Y"];
        }
        
        
        BOOL bb=true;
        for (int i= 3; i<pprojects.count; i++) {
            
            if ([[status objectAtIndex:i]isEqualToString:@"N"]) {
                bb=false;
            }
        }
    
    if (bb) {
         [status replaceObjectAtIndex:p withObject:@"Y"];
    }
     
        

    }


    [tableView reloadData];
    return;
        
}

- (IBAction)sure:(id)sender{
    

    
   
  BOOL result=FALSE;
  if ([[status objectAtIndex:0]isEqualToString:@"Y"]) {
    result|=[rootview deleteSystemFiles:0];
  }
  if ([[status objectAtIndex:1]isEqualToString:@"Y"]) {
    result|=[rootview deleteSystemFiles:1];
  }
      
  if ([[status objectAtIndex:2]isEqualToString:@"Y"]) {
    for (Project*project in mprojects) {
      [rootview deleteProjectFiles:project];
        result =YES;
    }
  }
  else {
    for (int i=3;i<status.count;i++) {
      if ([[status objectAtIndex:i]isEqualToString:@"Y"])
      {
        [rootview deleteProjectFiles:[mprojects objectAtIndex:(i-3)]];
          result=YES;
      }
    }
  }
    
    if (!result) {
        [[AppDelegate getAppDelegate]alert:@"提示信息" message:@"请选择需上传的样本"];
        return;
    }else {
        [[AppDelegate getAppDelegate]alert:@"" message:@"删除文件完毕！"];
        
        self.hidden=YES;
        [rootview modualViewClosed:self];

    }
 }



-(void)closeView:(id)sender{
  
  self.hidden=YES;
  //[rootview modualViewClosed:self];
  
  
}
-(void)setProjects:(NSMutableArray *)projects
{
 [mprojects removeAllObjects];
  mprojects=[projects retain];
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
    
    NSLog(@".....%d",projects.count);
    NSLog(@"、、、、%d",pprojects.count);

}
@end
