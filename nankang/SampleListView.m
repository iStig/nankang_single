//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "SampleListView.h"
#import "Project.h"
@implementation SampleListView
@synthesize rootview,mCurrentSelectedSample,mSampleListWithStatus,mProject;
- (id)initWithFrame:(CGRect)frame
{
  
    self = [[[NSBundle mainBundle] loadNibNamed:@"SampleListView" owner:nil options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
      self.frame=frame;
      tableview=[self viewWithTag:1];
      tableview.delegate=self;
      tableview.dataSource=self;
      tableview.backgroundColor=[UIColor clearColor];
      tableview.backgroundView=nil;
      mCurrentSelectedRow=-1;
      mCurrentSelectedSection=-1;
      mCurrentSelectedSample=nil;
      lblProjectName=[self viewWithTag:2];
      mCurrentShowStatus=-2;
        mSamplesShow=[NSMutableArray new];
      [((UIButton*)[self viewWithTag:4])addTarget:self action:@selector(groupClicked:) forControlEvents:UIControlEventTouchUpInside];
      [((UIButton*)[self viewWithTag:5])addTarget:self action:@selector(groupClicked:) forControlEvents:UIControlEventTouchUpInside];

      [((UIButton*)[self viewWithTag:6])addTarget:self action:@selector(groupClicked:) forControlEvents:UIControlEventTouchUpInside];
      
       [((UIButton*)[self viewWithTag:9])addTarget:self action:@selector(switchClicked:) forControlEvents:UIControlEventTouchUpInside];

      
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
  
  lblProjectName.text=mProject.ProjectName;
  [mSamplesShow removeAllObjects];
  UIImageView*bg=[self viewWithTag:8];
  UIImageView*titlebg=[self viewWithTag:7];
  UILabel*title=[self viewWithTag:30];
  
  [((UILabel*)[self viewWithTag:10])setText:[[NSString alloc]initWithFormat:@"%d",((NSArray*)[mSampleListWithStatus valueForKey:@"-2"]).count]];
  [((UILabel*)[self viewWithTag:11])setText:[[NSString alloc]initWithFormat:@"%d",((NSArray*)[mSampleListWithStatus valueForKey:@"50"]).count]];
  NSMutableArray*failedSamples=[NSMutableArray new];
  for (NSString*key in mSampleListWithStatus.allKeys) {
    if (![key isEqualToString:@"-2"]&&![key isEqualToString:@"50"]) {
      [failedSamples addObjectsFromArray:[mSampleListWithStatus valueForKey:key]];
    }
  }
   [((UILabel*)[self viewWithTag:12])setText:[[NSString alloc]initWithFormat:@"%d",failedSamples.count]];
  
  if (mCurrentShowStatus==-2) {
    [mSamplesShow addObjectsFromArray:[mSampleListWithStatus valueForKey:@"-2"]];
    [bg setImage:[UIImage imageNamed:@"TAB1.png"]];
    [titlebg setImage:[UIImage imageNamed:@"未接触顶部条.png"]];
    title.text=[[NSString alloc]initWithFormat:@"未接触(%d)",mSamplesShow.count];
    
  }
  if ( mCurrentShowStatus==50) {
    [mSamplesShow addObjectsFromArray:[mSampleListWithStatus valueForKey:@"50"]];
    [bg setImage:[UIImage imageNamed:@"TAB2.png"]];
    [titlebg setImage:[UIImage imageNamed:@"成功顶部条.png"]];
    title.text=[[NSString alloc]initWithFormat:@"访问成功(%d)",mSamplesShow.count];
  }
  if (mCurrentShowStatus==52) {
    [bg setImage:[UIImage imageNamed:@"TAB3.png"]];
    [titlebg setImage:[UIImage imageNamed:@"失败顶部条.png"]];
//    for (NSString*key in mSampleListWithStatus.allKeys) {
//      if (![key isEqualToString:@"-2"]&&![key isEqualToString:@"50"]) {
//        [mSamplesShow addObjectsFromArray:[mSampleListWithStatus valueForKey:key]];
//      }
//    }
    [mSamplesShow addObjectsFromArray:failedSamples];
    title.text=[[NSString alloc]initWithFormat:@"访问失败(%d)",failedSamples.count];
  }
  [tableview reloadData ];

}
-(void)resetCurrentSample
{
  lblProjectName.text=@"";
  mCurrentSelectedSample=nil;
  mProject=nil;
}
-(void)setHidden:(BOOL)hidden
{
  if (!hidden) {
    lblProjectName.text=mProject.ProjectName;
   
    [self refreshView];
  }
   [super setHidden:hidden];
}
#pragma mark-
#pragma  mark TableView delegate
//
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//  UIView*view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 640, 40)];
//  
////  UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"online_bg_1.png"]];
////  imageview.frame=view.frame;
////  [view addSubview:imageview];
//  
//
//    
//    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(35, 0, 200, 50)];
//    label.backgroundColor=[UIColor clearColor];
//  NSString*key=[[mSampleListWithStatus allKeys]objectAtIndex:section ];
//  NSArray*value=[mSampleListWithStatus valueForKey:key];
//    label.text=[[NSString alloc]initWithFormat: @"%@(%d)",[rootview getSampleStatusName:key],value.count];
//    label.textColor=[UIColor grayColor];
//    label.font=[UIFont systemFontOfSize:30];
//    label.userInteractionEnabled=FALSE;
//    UIButton*arrow=[UIButton buttonWithType:UIButtonTypeCustom];
//    
//    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame=view.frame;
//    // btn.backgroundColor=[UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
//    // [btn setBackgroundImage:[UIImage imageNamed:@"online_bg_1.png"] forState:UIControlStateNormal];
//    
//    [btn addTarget:self action:@selector(collapse:) forControlEvents:UIControlEventTouchUpInside];
//    btn.tag=section;
//    //     [btn addTarget:self action:@selector(touchdown:) forControlEvents:UIControlEventTouchDown];
//    
//    [view addSubview:label];
//    [view addSubview:arrow];
//  [view addSubview:btn];
//    return view;
//  
//    
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.

    return mSamplesShow.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{     

  return 60;
//  return mCurrentSelectedSection==indexPath.section&&mCurrentSelectedRow==indexPath.row?80:45;
}
  

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
  static NSString *identify = @"SampleCell";

  
  NKSample*sample=[mSamplesShow objectAtIndex:indexPath.row];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
  
  
  if(!cell)
  {
    
    
//    cell = [[[NSBundle mainBundle] loadNibNamed:@"SampleCell" owner:nil options:nil] objectAtIndex:(indexPath.row==mCurrentSelectedRow&&indexPath.section==mCurrentSelectedSection?1:0)];
    cell = [[[NSBundle mainBundle] loadNibNamed:@"SampleCell" owner:nil options:nil] objectAtIndex:(sample==mCurrentSelectedSample?1:0)];
    
  }

  UILabel*label1=(UILabel*)[cell viewWithTag:1];
  label1.text=[[NSString alloc]initWithFormat:@"样本编号 %@", sample.sampleId];
 
  UIButton*btnInfo=(UIButton*)[cell viewWithTag:2];

  [btnInfo addTarget:self action:@selector(infoBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
  
  

  
  UIButton*btnStart=(UIButton*)[cell viewWithTag:4];
  btnStart.hidden=NO;
  UIImageView*imgView=[cell viewWithTag:6];
   [btnStart addTarget:self action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
  if (sample.status!=-2)//如果不是未接触则可以查看答卷
  {
    imgView.image=[UIImage imageNamed:@"查看答卷小图标"];
    [btnStart setTitle:@"查看答卷" forState:UIControlStateNormal];
    
  }
  else {
    imgView.image=[UIImage imageNamed:@"开始访问小图标"];
  }
  
  UIImageView*imageview=[cell viewWithTag:7];
  switch (mCurrentShowStatus) {
    case -2:
      imageview.image=[UIImage imageNamed:@"未接触小图标"];
      break;
    case 50:
      imageview.image=[UIImage imageNamed:@"成功小图标"];
      break;
    default:
      imageview.image=[UIImage imageNamed:@"失败小图标"];

      break;
  }
  UIButton*btnReuse=(UIButton*)[cell viewWithTag:3];
  UIImageView*img=[cell viewWithTag:5];
  [btnReuse addTarget:self action:@selector(reuseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
  if (sample.status!=50&&sample.status!=-2) {//如果不是未接触和访问成功，则可以回收样本
    btnReuse.hidden=NO;
    img.hidden=NO;
    btnStart.hidden=YES;
  }
  else
  {
    btnReuse.hidden=YES;
    btnStart.hidden=NO;
    img.hidden=YES;
  }
  return cell;
}
-(void)infoBtnClicked:(id)sender
{
  SampleInfoView*mProjectInfoView=[[SampleInfoView alloc]initWithFrame:self.superview. frame];
  mProjectInfoView.rootview=self.rootview;
  mProjectInfoView.sample=[self getSelectedSample];
  mProjectInfoView.hidden=NO;
  [self.superview addSubview:mProjectInfoView];
}
-(void)reuseBtnClicked:(id)sender
{
  [rootview reuseSurveyForSample:[self getSelectedSample]];
  [self refreshView];  
}
-(void)startBtnClicked:(id)sender
{
  if ([self getSelectedSample].status==-2) {
    [self getSelectedSample].status=-1;
    [self refreshView];
    [rootview excuteSurvey:[self getSelectedSample]];
  }
  else {
    [rootview reviewSurveyanswers:[self getSelectedSample]];
  }
  
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  mCurrentSelectedRow=indexPath.row;
  mCurrentSelectedSection=indexPath.section;
  
  NSArray*keys=mSampleListWithStatus.allKeys;
  mCurrentSelectedSample=[mSamplesShow objectAtIndex:indexPath.row];
  [tableView reloadData];
  

  
}

-(NKSample*)getSelectedSample
{
//  if (mCurrentSelectedSection==-1) {
//    return nil;
//  }
//  NSArray*keys=mSampleListWithStatus.allKeys;
//  return  [[mSampleListWithStatus objectForKey:[keys objectAtIndex:mCurrentSelectedSection]]objectAtIndex:mCurrentSelectedRow];
  return mCurrentSelectedSample;
}

-(void)downloadFileBtnClicked:(id)sender
{
  
  [rootview downloadProjectFiles:mProject];  
}
-(void)groupClicked:(id)sender
{
  UIButton*btn=sender;

  if (btn.tag==4) {
    mCurrentShowStatus=-2;
    
  }
  if (btn.tag==5) {
    mCurrentShowStatus=50;

  }
  if (btn.tag==6) {
    mCurrentShowStatus=52;
   
  }
  [self refreshView];
}
-(void)switchClicked:(id)sender
{
  [rootview switchProject];
}

@end
