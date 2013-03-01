//
//  RootViewController.m
//  nankang
//
//  Created by xudong jin on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "Project.h"
#import "NKAnswerQuestionRecord.h"
#import "BILayerClient.h"
#import "User.h"
#import "AppDelegate.h"
#import "ResultObject.h"
#import "DownLoadResumeFileWrapper.h"
#import "CAPIResumeFile.h"
#import "VOEnums.h"
#import "PathHelper.h"
#import "CJSONDeserializer.h"
#import "User.h"
#import "SuveyAnswer.h"
#import "CJSONSerializer.h"
#import "UTSystemHelper.h"
#import "NKSampleStatus.h"
#import "ProjectSelectView.h"
#import "SampleSelectView.h"
#import "DeleteFilesView.h"
#import "ProjectInfoView.h"
#import "ExportView.h"
#import "ImportView.h"
#import "settingsview.h"
#import "UploadSampleSelectView.h"
#import "ThemeView.h"
#import "ProjectListView.h"
#import "SampleListView.h"
#import "SurveyExcuteView.h"
#import "StatisticView.h"
#import "SBJSON.h"
#import "NKAnswerInfo.h"
#import "NKSampleVisit.h"
#import "StringResult.h"
#import "UpLoadResumeFileWrapper.h"
#import "UTAnimations.h"
#import "Publicdef.h"
#import "LocationManager.h"
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize mProjects,mSurveyManager;
int DownloadFileBuf=10240;
#pragma mark - View lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        mSurveyManager=[[SurveyManager alloc]init];
        mSampleListWithStatus=[NSMutableDictionary new];
        
        type=-1;
        btnstate=1;
        btnstateOther=1;
        mCurrentStep=NOStep;  
      sessionID=nil;
      
      locationManager = [[CLLocationManager alloc] init];
      locationManager.delegate = self; 
      locationManager.desiredAccuracy = kCLLocationAccuracyBest;
      locationManager.distanceFilter=5;
      
      mGpsInfo=@"";
     
    }
    return self;
}

- (void)viewDidLoad
{
    self.title=@"面访专家";
    [super viewDidLoad];
  [self.navigationController setNavigationBarHidden:YES];
    progress.frame=CGRectMake(500, 300, 100, 60);
    
    progress.backgroundColor=[UIColor darkGrayColor];
    progress.contentMode=UIViewContentModeCenter;
    
    mProjectListView=[[ProjectListView alloc]initWithFrame:rightView.frame];
    mProjectListView.rootview=self;
    mProjectListView.hidden=NO;
    [self.view addSubview:mProjectListView];
    
    mSampleListView=[[SampleListView alloc]initWithFrame:rightView.frame];
    mSampleListView.rootview=self;
    mSampleListView.hidden=YES;
    [self.view addSubview:mSampleListView];
    
    mSurveyExcuteView=[[SurveyExcuteView alloc]initWithFrame:self.view.frame];
    mSurveyExcuteView.rootview=self;
    mSurveyExcuteView.hidden=YES;
    [self.view addSubview:mSurveyExcuteView];
    
    mStatisticView=[[StatisticView alloc]initWithFrame:rightView.frame];
    mStatisticView.rootview=self;
    mStatisticView.hidden=YES;
    [self.view addSubview:mStatisticView];
    
    
    // Do any additional setup after loading the view from its nib.
    
    
    mPojectSelectView=[[ProjectSelectView alloc]initWithFrame:self.view.frame];
    mPojectSelectView.rootview=self;
    mPojectSelectView.hidden=YES;
    [self.view addSubview:mPojectSelectView];
    
    mSampleSelectView=[[SampleSelectView alloc]initWithFrame:self.view.frame];
    mSampleSelectView.rootview=self;
    mSampleSelectView.hidden=YES;
    [self.view addSubview:mSampleSelectView];
  isFirstShow=TRUE;
  [self startPump];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation==UIInterfaceOrientationLandscapeRight;
}


-(void)viewWillAppear:(BOOL)animated
{

  if (surveystatus==1) {//如果是在访问中，则可能是拍照后的返回，什么都不用做
    return;
  }


  mProjectListView.hidden=NO;
  mSampleListView.hidden=YES;
  mSurveyExcuteView.hidden=YES;
  mStatisticView.hidden=YES;
    
   
    otherMenuView.hidden=YES;
     projectManageMenuView.hidden=YES;
    imgOther.hidden=YES;
    imgProject.hidden=YES;
  
    img1.hidden=YES;
    img2.hidden=YES;
    img3.hidden=YES;
    btn.selected=NO;
    otherBtn.selected=NO;

    
  [mProjectListView resetCurrentProject];
  [mSampleListView resetCurrentSample];

    User*currentUser=[[AppDelegate getAppDelegate] getCurrentUser];
    if (currentUser!=nil) {
        mProjects=currentUser.projects;
        //如果是在线登录则刷新项目列表
          if (![AppDelegate getAppDelegate ].isLocalLogin) {
            for (Project*project in mProjects) {
              project.isOldProject=TRUE;
            }
            
            [self getProjects];
          }
            
      
       [mProjectListView refreshView];
    }
    
    
}

#pragma mark-
#pragma  mark 数据下载 



-(void)getProjects
{
  
  [progress removeFromSuperview];
  [self.view addSubview:progress];
  [progress startAnimating];
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(getProjectListDidReceive:obj:)];
  User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
  if (currentuser==nil) {//尚未登录
    return;
  }
  [advClient getProjectList:currentuser.username companyCode:currentuser.companyCode ];
  
}
- (void)getProjectListDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  //DownLoadResumeFileWrapper*result=[[DownLoadResumeFileWrapper alloc]initWithJsonDictionary:obj];
  [progress stopAnimating];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  ResultObject *result=[[ResultObject alloc]initWithJsonDictionary:obj];
  if (mProjects==nil) {
    mProjects=[[NSMutableArray alloc]init];
  }
  
  if (result.result==1) {
//    if (mProjects.count>0) {
//      [mProjects removeAllObjects];
//    }
    for (NSDictionary*dic in result.content) {
      Project*project=[[Project alloc]initWithJsonDictionary:dic];
      BOOL exist=FALSE;
      //如果是新项目，则加入项目列表
      for (Project *oldproject in mProjects) {
        if ([[oldproject ProjectId]isEqualToString:project.ProjectId]) {
          exist=TRUE;
          break;
        }
      }
      if (!exist) {
        project.isOldProject=FALSE;
         [mProjects addObject:project];
            }
     
     
    }
    
    
  }
  else {
    [[AppDelegate getAppDelegate]alert:@"获取项目数据失败" message:@""];
    
  }
  User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
  currentuser.projects=[mProjects retain];
  //   [mTableView reloadData];
  [mProjectListView refreshView];
  
  
}

- (void)getDownLoadResumeFileWrapperDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  
  //DownLoadResumeFileWrapper*result=[[DownLoadResumeFileWrapper alloc]initWithJsonDictionary:obj];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  DownLoadResumeFileWrapper*downloader=[[DownLoadResumeFileWrapper alloc]initWithJsonDictionary:obj];
  if (downloader.result==-1) {
    NSString*msg=[[NSString alloc]initWithFormat:@"下载项目信息错误:%@",downloader.msg];
    [[AppDelegate getAppDelegate]alert:@"提示信息" message:msg];
    return;
  }
  Project*project= sender.context;
  
  project.downloadFilelist=[downloader.ResumenFileList retain];
  if (project.downloadFilelist==nil) {
    [[AppDelegate getAppDelegate]alert:@"" message:downloader.msg];
  }
  for (CAPIResumeFile*file in project.downloadFilelist) {
    if (file.CompleteStatus!=Complete) {
      //下载文件
      [self downloadFile:file forProject:project];
      break;
    }
  }  
}

-(void)downloadFile:(CAPIResumeFile*)file  forProject:(Project*)project
{
  //如果本地未保存文件，则从头开始下载文件
  if (![PathHelper isFileExist:file.Url]) 
  {
    file.CompleteSize=0;  
  }
  
  int statpos=file.CompleteSize;
  int  endpos=file.FileSize>(statpos+DownloadFileBuf)?(statpos+DownloadFileBuf):file.FileSize;
  endpos=endpos-1;

  file.CompleteStatus=Loading;
  
  
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(downloadDidReceive:obj:)];
  advClient.context=[[NSArray alloc]initWithObjects:project,file, [[NSNumber alloc]initWithInt:endpos ],nil]; 
  [advClient downLoadFile:statpos endPos:endpos guid:file.Id]; 
}
- (void)downloadDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  //[progress stopAnimating];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  Project*project=[((NSArray*)sender.context)objectAtIndex:0];
  CAPIResumeFile*file=[((NSArray*)sender.context)objectAtIndex:1];
  NSString*filepath=[PathHelper  getdocumentFilePath:file.Url];
  //如果是第一次下载，需要删除本地已有的文件
  if (file.CompleteSize==0)
    
  {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]) {
      NSError*error=nil;
      [[NSFileManager defaultManager] removeItemAtPath:filepath  error:&error];
      
    }
    
    [PathHelper createPathIfNecessary:[filepath substringToIndex:[filepath rangeOfString:@"/" options:NSBackwardsSearch ].location]];
    BOOL result=[[NSFileManager defaultManager] createFileAtPath:filepath contents:nil attributes:nil];
    int a=3;
    
  }
  
  file.CompleteSize=[[((NSNumber*)sender.context)objectAtIndex:2]intValue]+1;
  [mProjectListView refreshView];
  //保存下载的内容到本地
  
  NSFileHandle*filehandle=[NSFileHandle fileHandleForWritingAtPath:filepath];
  [filehandle seekToEndOfFile];
  [filehandle writeData:obj];
  [filehandle closeFile];
  
  //1.下载完毕
  if (file.CompleteSize==file.FileSize) {
    file.CompleteStatus=Complete;
    //发送该文件下载完成信号
    BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                             action:nil];
    [advClient sendCompleteUpLoadTaskInfo:@"2002" companyCode:@"SHNK"   projectId:project.ProjectId deviceType:@"2" taskid:file.TaskId];
    
    if ([file.Url rangeOfString:@".xml"].location!=NSNotFound) {//如果是项目信息文件，则还需解析该文件
      [self parseProjectFileInfo:[PathHelper getdocumentFilePath:file.Url] project:project ];
    }
    if (!project.fileDownloading) {//中止下载
      [mProjectListView refreshView];
      return;
    }
    //开始下载其他未完成下载的文件
    for (CAPIResumeFile*otherfile in project.downloadFilelist) {
      if (otherfile.CompleteStatus!=Complete) {
        [self downloadFile:otherfile forProject:project];
        return;
      }
    }
  }
  //2.未下载完毕，继续下载
  else {
    if (!project.fileDownloading) {//中止下载
      [mProjectListView refreshView];
      return;
    }
    [self downloadFile:file forProject:project];
    
  }
  //  NSString*downloadcontent=[[NSString alloc]initWithData:obj encoding:NSUTF8StringEncoding];
  
  
  
  
  
  
  
  
  
}

#pragma mark-
#pragma  mark 数据上传
-(void)getSessionIDDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  sessionID=[[NSString alloc]initWithFormat:@"%@",obj];
  //首先检查是否有上次未上传完毕的文件
  [self checkFileUploadedNotCompleted];

  return;
   
}
-(void)checkFileUploadedNotCompleted
{
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(getunCompleteFileDidReceive:obj:)];
  User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
  if (currentuser==nil) {//尚未登录
    return;
  }
  
  User*user=[[AppDelegate getAppDelegate]getCurrentUser];
  [advClient getUpLoadResumeFileWrapper:user.username companyCode:user.companyCode projectId:[mProjectListView getSelectedProject].ProjectId sessionId:sessionID];
}
-(void)getunCompleteFileDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  //1.获得已上传的文件列表
  [progress stopAnimating];
  UpLoadResumeFileWrapper*uploader=[[UpLoadResumeFileWrapper alloc]initWithJsonDictionary:obj];
  if (uploader.result==-1) {
    NSString*msg=[[NSString alloc]initWithFormat:@"获得待上传样本信息错误:%@",uploader.msg];
    [[AppDelegate getAppDelegate]alert:@"提示信息" message:msg];
    return;
  }
  //如果没有未上传完毕的列表，则开始本次打包数据上传
  if (uploader.ResumenFileList==nil||uploader.ResumenFileList.count==0) {
    ExportView*mExportView=[[ExportView alloc]initWithFrame:self.view.frame];
    mExportView.rootview=self;
    mExportView.hidden=NO;
    [self.view addSubview:mExportView];
  }
  //如果有未上传完毕的列表，则继续上传文件
  else {
  
    for (CAPIResumeFile *file in uploader.ResumenFileList) {
      BILayerClient*advClient1 = [[BILayerClient alloc] initWithTarget:self 
                                                                action:@selector(beginUpLoadDidReceive:obj:)];
       advClient1.context=[[NSArray alloc]initWithObjects:file.Url,file, uploader.ResumenFileList,nil];
      [advClient1 beginUpLoad:file.Url fileLength:file.FileSize guid:file.Id keepOn:TRUE sessionId:sessionID];
      
    }
  }
 
}



-(void)getUpLoadResumeFileWrapperDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  //1.获得已上传的文件列表
  [progress stopAnimating];
  UpLoadResumeFileWrapper*uploader=[[UpLoadResumeFileWrapper alloc]initWithJsonDictionary:obj];
  if (uploader.result==-1) {
    NSString*msg=[[NSString alloc]initWithFormat:@"获得待上传样本信息错误:%@",uploader.msg];
    [[AppDelegate getAppDelegate]alert:@"提示信息" message:msg];
    return;
  }
  Project*project= [mProjectListView getSelectedProject];
  
  //2.根据服务器传回的待上传文件信息来更新本地的文件信息
  for (CAPIResumeFile *filesever in uploader.ResumenFileList)
  {
    for (CAPIResumeFile *filelocal in project.uploadFilelist)
    {
      if ([filelocal.Url isEqualToString:filesever.Url]) {
        filelocal.CompleteSize=filesever.CompleteSize;
        filelocal.StartPos=filesever.StartPos;
        filelocal.EndPos=filesever.EndPos;
      }
    }
  }
  
  
  for (CAPIResumeFile *file in project.uploadFilelist) {
    //开始上传第一个文件
    if (file.CompleteStatus!=Complete) {
      BILayerClient*advClient1 = [[BILayerClient alloc] initWithTarget:self 
                                                                action:@selector(beginUpLoadDidReceive:obj:)];
      advClient1.context=sender.context;
      [advClient1 beginUpLoad:file.Url fileLength:file.FileSize guid:file.Id keepOn:TRUE sessionId:sessionID];
      break;
    }


  }
  
 
  
  
  
//  if (project.uploadFilelist.count>0) {
//    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"有未完成的上传任务，需要继续上传吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
//    // optional - add more buttons:
//    alert.tag=3;
//    [alert show];
//    return;
//    
//  }

  
  

  
  
}
-(void)getSampleListDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  UploadSampleSelectView*mImportView=[[UploadSampleSelectView alloc]initWithFrame:self.view.frame];
  mImportView.project=[mProjectListView getSelectedProject];
  mImportView.rootview=self;
  mImportView.hidden=NO;
  [self.view addSubview:mImportView];
}
- (void)prepare4Upload:(Project *)project uploadfiles:(NSArray*)filelist
{
  
  
   NSMutableArray*resumefiles=[[NSMutableArray alloc]init];
  for (NSString*filepath in filelist) {
    CAPIResumeFile*file=[CAPIResumeFile new];
    
    NSFileHandle*filehandle=[NSFileHandle fileHandleForReadingAtPath:[PathHelper getdocumentFilePath:filepath] ];
    NSData*filecontentdata=[filehandle readDataToEndOfFile];
    
    
    
    //  
    file.FileSize=[filecontentdata length];
    
    file.CompanyCode=[[AppDelegate getAppDelegate]getCurrentUser].companyCode ;
    file.UploadDownType=Upload;
    file.CompleteStatus=Loading;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
    //  
    //  [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; 
    file.BeginTime=[[NSDate date]description];
    file.BeginTime=[file.BeginTime substringToIndex:[file.BeginTime rangeOfString:@" " options:NSBackwardsSearch].location];
    file.EndTime=[file.BeginTime retain];
    file.Url=[[NSString alloc]initWithFormat:@"%@",filepath];
    [resumefiles addObject:file];
  }
  
 
  if (project.uploadFilelist==nil) {
    project.uploadFilelist=[NSMutableArray new];
  }
  [project.uploadFilelist removeAllObjects];
  [project.uploadFilelist addObjectsFromArray:resumefiles];
  //3。发送准备上传指令
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(beginUpLoadTaskInfoDidReceive:obj:)];
   User*user=[[AppDelegate getAppDelegate]getCurrentUser];
  CAPIResumeFile*firstfile=[project.uploadFilelist objectAtIndex:0];
  advClient.context=[[NSArray alloc]initWithObjects:firstfile.Url,[project.uploadFilelist objectAtIndex:0], project.uploadFilelist,nil];
  NSError*error=nil;
  NSString*jsonFilelist=[[[[[SBJsonWriter alloc]init]autorelease] stringWithObject:project.uploadFilelist  error:&error]retain];
  [advClient sendBeginUpLoadTaskInfo:user.username companyCode:user.companyCode  projectId:project.ProjectId deviceType:@"2" fileList:jsonFilelist sessionId:sessionID ];
}

-(void)beginUpLoadTaskInfoDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(getUpLoadResumeFileWrapperDidReceive:obj:)];

  advClient.context=sender.context;
  User*user=[[AppDelegate getAppDelegate]getCurrentUser];
  [advClient getUpLoadResumeFileWrapper:user.username companyCode:user.companyCode projectId:[mProjectListView getSelectedProject].ProjectId sessionId:sessionID];

  
  
  
  
}
-(void)beginUpLoadDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  tns1_UpLoadReadyInfo*result=obj;
  NSString*filepath=[((NSArray *)sender.context)objectAtIndex:0];
  CAPIResumeFile*file=[((NSArray *)sender.context)objectAtIndex:1];
  NSArray*allfiles=[((NSArray *)sender.context)objectAtIndex:2];
  [self uploadFile:filepath GUID:result.Guid file:file allfiles:allfiles  sessionID:sessionID];
  
}
-(void)uploadFile:(NSString*)filepath  GUID:(NSString*)guid file:(CAPIResumeFile*)file allfiles:(NSArray*)allfiles sessionID:(NSString*)sessionID
{
  BILayerClient*advClient2 = [[BILayerClient alloc] initWithTarget:self 
                                                            action:@selector(uploadDidReceive:obj:)];
  
  NSFileHandle*filehandle=[NSFileHandle fileHandleForReadingAtPath:[PathHelper getdocumentFilePath:filepath] ];
   [filehandle seekToFileOffset:file.CompleteSize];
  NSData*filecontentdata=[filehandle readDataOfLength:10*1024];
  int aa=filecontentdata.length;
  [filehandle closeFile];
  if (filecontentdata.length>0) {
    advClient2.context=[[NSArray alloc]initWithObjects:filepath,guid, [NSNumber numberWithLong:[filecontentdata length] ], file,allfiles,nil];
    [advClient2 upLoad:filecontentdata guid:guid sessionId:sessionID];
  }
  else {
   
      file.CompleteStatus=Complete;
    //继续上传其他文件
      for (CAPIResumeFile*otherfile in allfiles) {
        if (otherfile.CompleteStatus!=Complete) {
          BILayerClient*advClient1 = [[BILayerClient alloc] initWithTarget:self 
                                                                    action:@selector(beginUpLoadDidReceive:obj:)];
        advClient1.context=[[NSArray alloc]initWithObjects:otherfile.Url,otherfile, allfiles,nil];
          [advClient1 beginUpLoad:otherfile.Url fileLength:otherfile.FileSize guid:otherfile.Id keepOn:TRUE sessionId:sessionID];
         
          return;
        }
      }
    //如果项目的待上传文件列表是空的，则说明刚才是断点续传，现在开始的才是本次数据的打包上传
    if ([mProjectListView getSelectedProject].uploadFilelist==nil||[mProjectListView getSelectedProject].uploadFilelist.count==0) {
      ExportView*mExportView=[[ExportView alloc]initWithFrame:self.view.frame];
      mExportView.rootview=self;
      mExportView.hidden=NO;
      [self.view addSubview:mExportView];
    }
    else {
    //  [[mProjectListView getSelectedProject].uploadFilelist removeAllObjects];
      
      NSString*msg=[[NSString alloc]initWithFormat:@"项目文件上传结束"];
      
      [[AppDelegate getAppDelegate]alert:@"" message:msg];

    }
         }

  

  
}
-(void)uploadDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  NSArray*params=sender.context;
  NSString*guid=[params objectAtIndex:1];
  CAPIResumeFile*file=[params objectAtIndex:3];
  NSArray*allfiles=[params objectAtIndex:4];
  long uploadlenth=((NSNumber*)[params objectAtIndex:2]).longValue;
  file.CompleteSize+=uploadlenth;
  NSString*filepath=[params objectAtIndex:0];
  //只有上传的是本次数据才更新进度条，断点续传不更新
  if ([mProjectListView getSelectedProject].uploadFilelist.count>0)
  {
     [mProjectListView refreshView];
  }
  
  //继续上传文件

   [self uploadFile:filepath GUID:guid file:file allfiles:allfiles  sessionID:sessionID];
    
  
   
  
}


-(void)clientVersionInfoDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  [progress stopAnimating];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  StringResult*result=[[StringResult alloc]initWithJsonDictionary:obj];
  if (result.result==-1) {
    [[AppDelegate getAppDelegate]alert:@"" message:result.msg];
  }
  else {
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"有新版本，是否要更新?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
    // optional - add more buttons:
    alert.tag=2;
    [alert show];
  }
}

#pragma mark-
#pragma  mark 首页面上的menu按钮响应
-(IBAction)downloadClicked:(id)sender
{
  //如果已经在下载中则什么也不做
  if ([mProjectListView getSelectedProject].fileDownloading) {
    return;
  }
  [mProjectListView getSelectedProject].fileDownloading=TRUE;
  [mProjectListView refreshView];
  [self downloadProjectFiles:[mProjectListView getSelectedProject]];
}
-(IBAction)uploadClicked:(id)sender
{
  //如果已经在上传中则什么也不做
  if ([mProjectListView getSelectedProject].fileuploading) {
    return;
  }
  [mProjectListView getSelectedProject].fileuploading=TRUE;
  [mProjectListView refreshView];
  [self uploadSurveysForProject:[mProjectListView getSelectedProject]];
}
-(IBAction)excuteSurveyClicked:(id)sender
{
    mCurrentStep=ExcuteSurvey;
    surveyBtn=sender;

    projectManageMenuView.hidden=YES;
    otherMenuView.hidden=YES;
    otherBtn.selected=NO;
    btn.selected=NO;

    
    img1.hidden=YES;
    img2.hidden=NO;
    img3.hidden=YES;
    imgOther.hidden=YES;
    imgProject.hidden=YES;
    
    if ([mProjectListView getSelectedProject]==nil) {
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"请先选择项目" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil] autorelease];
        // optional - add more buttons:
        [alert show];
        
        return;
    }
    Project*project=[mProjectListView getSelectedProject];
    mSurveyxml=@"";
    for ( CAPIResumeFile*file in   project.downloadFilelist) {
        if (file.isSurvery) {
            mSurveyxml=[[PathHelper getdocumentFilePath:file.Url]retain];
            
        }
        if (file.CompleteStatus!=Complete) {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"请先下载项目文件" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil] autorelease];
            // optional - add more buttons:
            [alert show];
            
            return;
        }
    }
  if ([mSampleListView getSelectedSample]!=nil&&[mSampleListView getSelectedSample].status==-2) {
    [self excuteSurvey:[mSampleListView getSelectedSample]];
  }
  else {
    mSampleSelectView.samples=[self getNewSampleList4SelectedProject];
    mSampleSelectView.hidden=NO;
  }

    }
-(IBAction)projectManageClicked:(id)sender
{
    if (otherBtn.selected) {
        
        otherMenuView.hidden=YES;
        otherBtn.selected=NO;
        imgOther.hidden=YES;
        imgProject.hidden=NO;
        projectManageMenuView.hidden=NO;
        [self.view bringSubviewToFront:projectManageMenuView];
        
        btn.selected=YES;
        return;
    }
    
    
    img1.hidden=YES;
    img2.hidden=YES;
    img3.hidden=YES;
    
    mCurrentStep=ProjectManage;
    mSurveyExcuteView.hidden=YES;
    mSampleListView.hidden=YES;
    mStatisticView.hidden=YES;
    mProjectListView.hidden=NO;
    
    
     lab1.hidden=NO;
     lab2.hidden=NO;
     lab3.hidden=NO;
     lab4.hidden=NO;
     lab5.hidden=NO;
     lab6.hidden=NO;
     lab7.hidden=NO;
     lab8.hidden=NO;
    
    
    

    if (btnstate==1) { 
     
        btnstate=-1;
    }
    
    
    if ([mProjectListView getSelectedProject]==nil) {
        
        mPojectSelectView.projects=[mProjects retain];
        mPojectSelectView.hidden=NO;
        type=1;
 
    }
    else{
        
        
        
        NSLog(@"%d",btn.selected);
        if (btn.selected) {
            otherMenuView.hidden=YES;
            defaultMenuView.hidden=NO;
          
            projectManageMenuView.hidden=YES;
            imgProject.hidden=YES;
            imgOther.hidden=YES;
            btn.selected=NO;
        }
        else{
            
            otherMenuView.hidden=YES;
            projectManageMenuView.hidden=NO;
            imgProject.hidden=NO;
            imgOther.hidden=YES;
        
            [self.view bringSubviewToFront:projectManageMenuView];
            btn.selected=YES;
            
        }
        
        NSLog(@"%d",btn.selected);
        
    }
    
    
    

    otherBtn.selected=NO;
    //[self.view bringSubviewToFront:defaultMenuView];
    //[self.view insertSubview:defaultMenuView aboveSubview:projectManageMenuView];
      
    //[self.view addSubview:defaultMenuView];
    
}





-(IBAction)sampleManageClicked:(id)sender
{
    
    sampleBtn=sender;
    
    imgProject.hidden=YES;
    imgOther.hidden=YES;

    projectManageMenuView.hidden=YES;
    otherMenuView.hidden=YES;
    otherBtn.selected=NO;
    btn.selected=NO;
    
    img1.hidden=NO;
    img2.hidden=YES;
    img3.hidden=YES;
    
    mCurrentStep=SampleManage;
    mSurveyExcuteView.hidden=YES;
    mStatisticView.hidden=YES;
    if ([mProjectListView getSelectedProject]==nil) {
        mPojectSelectView.projects=mProjects;
        [self.view bringSubviewToFront:mPojectSelectView];
        mPojectSelectView.hidden=NO;
    }
    else {
        if (mSampleListWithStatus.allKeys.count==0) {
            [[AppDelegate getAppDelegate]alert:@"" message:@"请先下载项目文件"];
            return;
        }
      
        mSampleListView.mSampleListWithStatus=mSampleListWithStatus;
        mSampleListView.mProject=[mProjectListView getSelectedProject ];
        mProjectListView.hidden=YES;
        [self.view bringSubviewToFront:mSampleListView];
        mSampleListView.hidden=NO;
        
        
    }
  

}
-(IBAction)statisticsClicked:(id)sender
{
    statisticBtn=sender;
    imgProject.hidden=YES;
    imgOther.hidden=YES;
    projectManageMenuView.hidden=YES;
    otherMenuView.hidden=YES;
    
    otherBtn.selected=NO;
    btn.selected=NO;
    
    img1.hidden=YES;
    img2.hidden=YES;
    img3.hidden=NO;
    
    mCurrentStep=Statistic;
  if ([mProjectListView getSelectedProject]!=nil) {
    if (mSampleListWithStatus.allKeys.count==0) {
      [[AppDelegate getAppDelegate]alert:@"" message:@"请先下载项目文件"];
      return;
    }
    mProjectListView.hidden=YES;
    mSampleListView.hidden=YES;
    
    mStatisticView.mProject=[mProjectListView getSelectedProject];
    mStatisticView.hidden=NO;
  }

  else {
    ProjectSelectView*view=[[ProjectSelectView alloc]initWithFrame:self.view.frame];
    view.rootview=self;
    view.projects=mProjects;
    [self.view addSubview:view];
  }
 
    
    
}
-(IBAction)otherClicked:(id)sender
{   
    if (btn.selected) {
        
       projectManageMenuView.hidden=YES;
        imgProject.hidden=YES;

        btn.selected=NO;
        otherMenuView.hidden=NO;
              imgOther.hidden=NO;
        [self.view bringSubviewToFront:otherMenuView]; 
              otherBtn.selected=YES;
        return;
    }
    
    img1.hidden=YES;
    img2.hidden=YES;
    img3.hidden=YES;
    
    mCurrentStep=Other;

//    mSurveyExcuteView.hidden=YES;
//    mSampleListView.hidden=YES;
//    mStatisticView.hidden=YES;
//    mProjectListView.hidden=NO;
    if (btnstateOther==1) {
       
        btnstateOther=-1;
    }
    
    if (otherBtn.selected) {
        otherMenuView.hidden=YES;
        defaultMenuView.hidden=NO;

        projectManageMenuView.hidden=YES;
        imgProject.hidden=YES;
        imgOther.hidden=YES;
 
        otherBtn.selected=NO;
    }
    else{
        otherMenuView.hidden=NO;
    
        [self.view bringSubviewToFront:otherMenuView];
      
        projectManageMenuView.hidden=YES;
        imgProject.hidden=YES;
        imgOther.hidden=NO;
        otherBtn.selected=YES;
    }
    

    btn.selected=NO;
   //[self.view bringSubviewToFront:defaultMenuView];
    //[self.view insertSubview:defaultMenuView aboveSubview:otherMenuView];
   // [self.view addSubview:defaultMenuView];
}
-(IBAction)deleteFilesClicked:(id)sender
{
  
    DeleteFilesView*mDeleteFilesView=[[DeleteFilesView alloc]initWithFrame:self.view.frame];
    mDeleteFilesView.rootview=self;
    mDeleteFilesView.projects=mProjects;
    mDeleteFilesView.hidden=NO;
    [self.view addSubview:mDeleteFilesView];
}
-(IBAction)projectInfoClicked:(id)sender
{
    ProjectInfoView*mProjectInfoView=[[ProjectInfoView alloc]initWithFrame:self.view.frame];
    mProjectInfoView.rootview=self;
    mProjectInfoView.project=[self getSelectedProject];
    mProjectInfoView.hidden=NO;
    [self.view addSubview:mProjectInfoView];
}
-(IBAction)exportClicked:(id)sender
{
  mCurrentStep=ExportFile;
    ExportView*mExportView=[[ExportView alloc]initWithFrame:self.view.frame];
    mExportView.rootview=self;
    mExportView.hidden=NO;
    [self.view addSubview:mExportView];
}
-(IBAction)importClicked:(id)sender
{
    ImportView*mImportView=[[ImportView alloc]initWithFrame:self.view.frame];
    mImportView.rootview=self;
    mImportView.hidden=NO;
    [self.view addSubview:mImportView];
}
-(IBAction)settingsClicked:(id)sender
{
    
    SettingsView*mImportView=[[SettingsView alloc]initWithFrame:self.view.frame];
    mImportView.rootview=self;
    mImportView.hidden=NO;
    [self.view addSubview:mImportView];
}
-(IBAction)themesClicked:(id)sender
{
    ThemeView*mImportView=[[ThemeView alloc]initWithFrame:self.view.frame];
    mImportView.rootview=self;
    mImportView.hidden=NO;
    [self.view addSubview:mImportView];
}

-(IBAction)updateClicked:(id)sender
{
  [progress startAnimating];
  progress.hidden=NO;
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(clientVersionInfoDidReceive:obj:)];
 
  [advClient getClientVersionInfo:@"2" resolutionType:0]; 

}
-(IBAction)aboutClicked:(id)sender
{
    
}
-(IBAction)logoutClicked:(id)sender
{
  UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"确定注销登录吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
  // optional - add more buttons:
  alert.tag=4;
  [alert show];
  

}
#pragma mark-
#pragma  mark 辅助函数 
//对话框视图关闭后的回调
-(void)modualViewClosed:(id)sender
{
    if ([sender isKindOfClass:[ProjectSelectView class]]) {
        mProjectListView.mCurrentSelected=((ProjectSelectView*)sender).selectedProject;
        [self groupSampleListwithStatus];
        
        [mProjectListView refreshView];
        if (mCurrentStep==Statistic) {//当前是在统计功能上
          if (mSampleListWithStatus.allKeys.count==0) {
            [[AppDelegate getAppDelegate]alert:@"" message:@"请先下载项目文件"];
            return;
          }
            mProjectListView.hidden=YES;
            mSampleListView.hidden=YES;
            
            mStatisticView.mProject=[mProjectListView getSelectedProject];
            mStatisticView.hidden=NO;
        }
        if (mCurrentStep==SampleManage) {//当前是在样本管理功能上
            if (mSampleListWithStatus.allKeys.count==0) {
                [[AppDelegate getAppDelegate]alert:@"" message:@"请先下载项目文件"];
                return;
            }
            mSampleListView.mSampleListWithStatus=mSampleListWithStatus;
            mSampleListView.mProject=[mProjectListView getSelectedProject ];
            mProjectListView.hidden=YES;
            mSampleListView.hidden=NO;
            [self.view bringSubviewToFront:mSampleListView];
        }
      if (mCurrentStep==ExcuteSurvey) {//当前是在开始访问上
        if (mSampleListWithStatus.allKeys.count==0) {
          [[AppDelegate getAppDelegate]alert:@"" message:@"请先下载项目文件"];
          return;
        }
        mSampleSelectView.samples=[self getNewSampleList4SelectedProject];
        mSampleSelectView.hidden=NO;
      }
    }
    
    if ([sender isKindOfClass:[SampleSelectView class]]) {
        mSampleListView.mCurrentSelectedSample=((SampleSelectView*)sender).selectedSample;
        
        [mSampleListView refreshView];
        if (mCurrentStep==ExcuteSurvey) {//当前是在开始访问功能上
          [self excuteSurvey:[mSampleListView getSelectedSample]];
            
        }
    

    if (mCurrentStep==SampleManage) {//当前是在样本管理功能上
      if (mSampleListWithStatus.allKeys.count==0) {
        [[AppDelegate getAppDelegate]alert:@"" message:@"请先下载项目文件"];
        return;
      }
      mSampleListView.mSampleListWithStatus=mSampleListWithStatus;
      mSampleListView.mProject=[mProjectListView getSelectedProject ];
      mProjectListView.hidden=YES;
      mSampleListView.hidden=NO;
      [self.view bringSubviewToFront:mSampleListView];
    }
      
  }
if ([sender isKindOfClass:[UploadSampleSelectView class]]) {
    [((UIView*)sender) removeFromSuperview];
  UploadSampleSelectView*view=sender;
  currentuploadProject=view.project;
  currentuploadSamples=view.sampleSelected;
  ExportView*mExportView=[[ExportView alloc]initWithFrame:self.view.frame];
  mExportView.rootview=self;
  mExportView.hidden=NO;
  [self.view addSubview:mExportView];
  
  
 
  
  }
if([sender isKindOfClass:[ExportView class]])
{
  [((UIView*)sender) removeFromSuperview];
  //文件导出
  if (mCurrentStep==ExportFile) {
    //1.创建导出目录
    Project*project=[mProjectListView getSelectedProject];
    User*user=[[AppDelegate getAppDelegate]getCurrentUser];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];  
    NSString *dateAndTime =  [dateFormatter stringFromDate:[NSDate date]];  
    NSString*path=[[NSString alloc]initWithFormat:@"exportfile/%@/%@_%@",user.agent.AgentCode,project.ProjectId,dateAndTime];
    [PathHelper createPathIfNecessary:[PathHelper getdocumentFilePath:path]];
    //2.开始导出文件
   NSArray*filelist=[self saveProjectFile:path];
    if (filelist!=nil) {
      NSString*msg=[[NSString alloc]initWithFormat:@"导出文件成功！文件目录为：%@",path];
      [[AppDelegate getAppDelegate]alert:@"" message:msg];
    }

  }
  //文件上传
  else if(mCurrentStep==UploadStep)
  {
    //1.创建上传目录
    Project*project=[mProjectListView getSelectedProject];
    User*user=[[AppDelegate getAppDelegate]getCurrentUser];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];  
    NSString *dateAndTime =  [dateFormatter stringFromDate:[NSDate date]];  
    NSString*path=[[NSString alloc]initWithFormat:@"uploadfile/%@/%@_%@",user.agent.AgentCode,project.ProjectId,dateAndTime];
    [PathHelper createPathIfNecessary:[PathHelper getdocumentFilePath:path]];
    //2.开始导出文件
    NSArray*filelist=[self saveProjectFile:path];
    if (filelist!=nil) {
      [self prepare4Upload:project uploadfiles:filelist];
    }

  
  }
//  [self.view bringSubviewToFront:mProjectListView];

}

}
-(void)switchProject
{
  mPojectSelectView.projects=mProjects;
  [self.view bringSubviewToFront:mPojectSelectView];
  mPojectSelectView.hidden=NO;
}
//获得当前选择的项目
-(Project*)getSelectedProject
{
    
    return [mProjectListView getSelectedProject];
}
//获得当前项目未访问的样本列表
-(NSMutableArray*)getNewSampleList4SelectedProject
{
    if (mSampleListWithStatus==nil) {
        return nil;
    }
    return [mSampleListWithStatus objectForKey:@"-2"];
}
//根据样本状态码获得状态名称
-(NSString*)getSampleStatusName:(NSString*)statuscode
{
    Project*project=[mProjectListView getSelectedProject];
    if (project==nil) {
        return @"";
    }
    for (NKSampleStatus*status in project.sampleStatuss) {
        if (status.StatusCode ==statuscode.intValue ) {
            return status.StatusName;
        }
    } 
    return @"";
}
//问卷结束后的回调
-(void)surveyFinished:(BOOL)isSuccess
{

  surveystatus=0;
 
 [mSampleListView getSelectedSample].status=isSuccess?50:51;
  [mSampleListView getSelectedSample].answerInfo.status=isSuccess?AS_End:AS_About;
  [mSampleListView getSelectedSample].answerInfo.endTime=[[NSDate date]description];
  [[mSampleListView getSelectedSample].answerInfo.answers4upload removeAllObjects];
  [[mSampleListView getSelectedSample].answerInfo.questions removeAllObjects];
  [[mSampleListView getSelectedSample].answerInfo.questions addObjectsFromArray:[mSurveyManager getQuestionList]];
  [mSampleListView getSelectedSample].answerInfo.answers4upload=[mSurveyManager getQuestionAnswer];

  [self groupSampleListwithStatus];
  mSampleListView.mSampleListWithStatus=mSampleListWithStatus;
  //[mSampleListView refreshView];
  mSampleListView.hidden=NO;
  mProjectListView.hidden=YES;
   mSurveyExcuteView.hidden=YES;
  
  [UTAnimations setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
  

 }
-(BOOL)deleteSystemFiles:(int)type{
  if (type==0) {
    NSError*error=nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager  fileExistsAtPath:[PathHelper getdocumentFilePath:@"exportfile"]]) {
      return TRUE;
    }
    [fileManager removeItemAtPath:[PathHelper getdocumentFilePath:@"exportfile"] error:&error];
    if (error!=nil) {

    //  [[AppDelegate getAppDelegate]alert:@"出错提示" message:@"删除离线导出文件失败"];
      return FALSE;
    }
  }
  else if(type==1) {
    NSString *extension = @"zip";
    NSFileManager *fileManager = [NSFileManager defaultManager];


    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:[PathHelper getdocumentFilePath:@""] error:NULL];  
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
      
      if ([[filename pathExtension] isEqualToString:extension]) {
        NSError*error=nil;
        [fileManager removeItemAtPath:[PathHelper getdocumentFilePath:filename] error:&error];
        if (error!=nil) {
          if (error!=nil) {

           // [[AppDelegate getAppDelegate]alert:@"出错提示" message:@"删除离线导入文件失败"];
            return FALSE;;
          }
        }
      }
    }
  }
  return TRUE;
}
//删除指定项目的项目文件
-(BOOL)deleteProjectFiles:(Project*)project
{
    for (CAPIResumeFile*file in project.downloadFilelist) {
        NSString*filepath=[PathHelper getdocumentFilePath:file.Url];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filepath])
        {
            NSError*error=nil;
            [[NSFileManager defaultManager] removeItemAtPath:filepath  error:&error];
     
            
        }
        file.CompleteStatus=Init;
        file.CompleteSize=0;
    }
    [mProjectListView refreshView];
}
//将指定项目的样本根据样本状态分组
-(void)groupSampleListwithStatus
{
    
    if([mProjectListView getSelectedProject]==nil)
    {
        return;
    }
    [mSampleListWithStatus removeAllObjects];
    Project*project=[mProjectListView getSelectedProject];
    for (NKSample *sample in project.samples) {
        NSMutableArray*array=[mSampleListWithStatus objectForKey:[[NSString alloc]initWithFormat:@"%d",sample.status]];
        if (array==nil) {
            array=[NSMutableArray new];
            [mSampleListWithStatus setObject:array forKey:[[NSString alloc]initWithFormat:@"%d",sample.status]];
            
        }
        [array addObject:sample];
    }
     mSampleListView.mSampleListWithStatus=mSampleListWithStatus;
}
//解析项目信息文件
-(void)parseProjectFileInfo:(NSString*)filepath  project:(Project*)project
{
  
    if (![[NSFileManager defaultManager] fileExistsAtPath:filepath])
    {
        return;
        
    }
    NSFileHandle*filehandle=[NSFileHandle fileHandleForReadingAtPath:filepath];
    NSData*filecontent=[filehandle readDataToEndOfFile];
  NSString*sss=[[NSString alloc]initWithData:filecontent encoding:NSUTF8StringEncoding];
    NSError*error=Nil;
    NSDictionary*dic=[[CJSONDeserializer deserializer]deserialize:filecontent error:&error ];
    NSArray*keys=dic.allKeys;
    for (NSString*key in keys ) {
        NSLog(@"%@\n",key);
    }
    NSDictionary*agent=[dic valueForKey:@"AgentVO"];
    [[AppDelegate getAppDelegate]getCurrentUser].agent=[[NKAgent alloc]initWithJsonDictionary:agent];
    [[AppDelegate getAppDelegate]getCurrentUser].company=[[NKCompany alloc]initWithJsonDictionary:[dic valueForKey:@"CompanyVO"]];
    
    
    NSArray*sampleStatusList=[dic valueForKey:@"SampleStatusList"];
    if (project.sampleStatuss==nil) {
        project.sampleStatuss=[[NSMutableArray alloc]init];
    }
    [project.sampleStatuss removeAllObjects];
    for (NSDictionary*dic in sampleStatusList) {
        [project.sampleStatuss addObject:[[NKSampleStatus alloc]initWithJsonDictionary:dic]];
    }
    
    NSArray*sampleList=[dic valueForKey:@"SampleVOWrapperList"];
    if (project.samples==nil) {
        project.samples=[[NSMutableArray alloc]init];
    }
    [project.samples removeAllObjects];
    for (NSDictionary*dic in sampleList) {
        [project.samples addObject:[[NKSample alloc]initWithJsonDictionary:dic]];
    }
    [self groupSampleListwithStatus];
    
    
}
-(void)reviewSurveyanswers:(NKSample *)sample
{
  if (sample.answerInfo.questions==nil||sample.answerInfo.answers4upload==nil) {
    return;
  }
  mSurveyExcuteView.mProject=[mProjectListView getSelectedProject];
  mSurveyExcuteView.strSampleName=sample.sampleId;
  [mSurveyExcuteView setQuestionList:sample.answerInfo.questions andAnswers:sample.answerInfo.answers4upload];

  // mTableView.hidden=YES;
  mProjectListView.hidden=YES;
  mSurveyExcuteView.hidden=NO;
  mSampleListView.hidden=YES;
  mSampleSelectView.hidden=YES;
  surveystatus=2;
  [mSurveyManager showQuestionAnswer:sample.answerInfo.questions answer:sample.answerInfo.answers4upload delegate:mSurveyExcuteView view:[mSurveyExcuteView getQuestionView]];
}
-(void)excuteSurvey:(NKSample*)sample
{
    [self prepare4ExcuteSurvey];
    mSurveyxml=@"";
    for ( CAPIResumeFile*file in   [mProjectListView getSelectedProject].downloadFilelist) {
        if (file.isSurvery) {
            mSurveyxml=[[PathHelper getdocumentFilePath:file.Url]retain];
            
        }
        if (file.CompleteStatus!=Complete) {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"请先下载项目文件" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil] autorelease];
            // optional - add more buttons:
  
            [alert show];
            
            return;
        }
    }

    

mSurveyExcuteView.mProject=[mProjectListView getSelectedProject];
mSurveyExcuteView.strSampleName=sample.sampleId;
[mSurveyManager loadSurveyFromLocal:mSurveyxml];
[mSurveyExcuteView setQuestionList:[mSurveyManager getQuestionList] andAnswers:nil];
// mTableView.hidden=YES;
mProjectListView.hidden=YES;
mSurveyExcuteView.hidden=NO;
mSampleListView.hidden=YES;
mSampleSelectView.hidden=YES;
  surveystatus=1;
  [UTSystemHelper saveCstSettingsWithValue:[mProjectListView getSelectedProject].ProjectId forKey:ProjectID4Survey];
  [UTSystemHelper saveCstSettingsWithValue:sample.sampleId forKey:SampleID4Survey];
[mSurveyManager startSurvey:[mSurveyExcuteView getQuestionView ]surveyExcuteDelegate:mSurveyExcuteView];

//  CGContextRef context = UIGraphicsGetCurrentContext();
//  [UIView beginAnimations:nil context:context];
//  [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//  [UIView setAnimationDuration:1];
//  [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
//  [UIView setAnimationDelegate:self];
//  [UIView commitAnimations];
  
  [UTAnimations setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
  
  

}

-(void)uploadSurveysForProject:(Project*)project
{

   [project.uploadFilelist removeAllObjects];
  

  mCurrentStep=UploadStep;
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(getSessionIDDidReceive:obj:)];
  advClient.context=project;
  [advClient getSessionID:sessionID];


}

-(void)closeSurvey:(BOOL)switchProject
{
  mSwitchProject=switchProject;
  if (surveystatus==1) {
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"确定要中止访问吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
    // optional - add more buttons:
    alert.tag=1;
    [alert show];
    
    return;
  }
  else if(surveystatus==2){
    surveystatus=0;
    mSurveyExcuteView.hidden=YES;
    mPojectSelectView.hidden=YES;
    mStatisticView.hidden=YES;
    mSampleListView.hidden=NO;
    return;
  }
  

  


}
-(void)prepare4ExcuteSurvey
{
    NKAnswerInfo*answerinfo=[[NKAnswerInfo alloc]init];
    answerinfo.projectId=[[mProjectListView getSelectedProject].ProjectId retain];
    answerinfo.sampleId=[[mSampleListView getSelectedSample].sampleId retain];
    answerinfo.startTime=[[NSDate date]description];
    answerinfo.status=AS_InProcess;
    answerinfo.checkFlag=CF_NoChecked;
    answerinfo.codingFlag=CodeF_NoCoding;
    answerinfo.visitAgent=[[[AppDelegate getAppDelegate]getCurrentUser ].username retain];
    [mSampleListView getSelectedSample].answerInfo=answerinfo;
    
    NKSampleVisit* sampleVisit=[[NKSampleVisit alloc]init];
    sampleVisit.agent=[[[AppDelegate getAppDelegate]getCurrentUser ].username retain];
    sampleVisit.answerId=[answerinfo.answerId retain];
    sampleVisit.sampleId=[answerinfo.sampleId retain];
    sampleVisit.sampleStatus=-1;
    sampleVisit.startTime=[answerinfo.startTime retain];
    [mSampleListView getSelectedSample].sampleVisit=sampleVisit;
    [mSampleListView getSelectedSample].status=-1;
}
-(void)reuseSurveyForSample:(NKSample*)sample
{
    if (sample.status==-2||sample.status==50) {
        return;
    }
   
    sample.sampleVisit=nil;

    sample.answerInfo=nil;
    sample.status=-2;
    [self groupSampleListwithStatus];
}
-(void)importProjectFile:(NSString*)zipFile{
  NSArray*files=[UTSystemHelper unZipFile:zipFile ];
  for (NSString*unzipfile in files) {
    for (CAPIResumeFile*file in [self getSelectedProject ].downloadFilelist)
    {
      if ([ unzipfile rangeOfString: file.Url ].location!=NSNotFound) {
        file.CompleteStatus=Complete;
        file.CompleteSize=file.FileSize;
        if ([file.Url rangeOfString:@".xml"].location!=NSNotFound) {
          [self parseProjectFileInfo:[PathHelper getdocumentFilePath:unzipfile] project:[self getSelectedProject]];
        }
        break;
        
      }
    }
  }
[mProjectListView refreshView ];
  [[AppDelegate getAppDelegate]alert:@"" message:@"项目文件导入成功！"];
}


-(NSArray*)saveProjectFile:(NSString*)path
{
  NSError*error=nil;
  NSMutableArray*filelist=[NSMutableArray new];
  Project*project=[mProjectListView getSelectedProject];
  SBJsonWriter *writer = [[[SBJsonWriter alloc]init]autorelease];
  SuveyAnswer *surveyAnswer=[[SuveyAnswer alloc]initWithAgent:[[AppDelegate getAppDelegate]getCurrentUser].agent company:[[AppDelegate getAppDelegate]getCurrentUser].company project:project samples4Upload:project.samples];
  for (NKAnswerQuestionRecord*qrecord in surveyAnswer.answerQuestionRecord) {
    if ([qrecord.relateFilePath rangeOfString:@"temp"].location!=NSNotFound) {
       NSString*file=[qrecord.relateFilePath  substringFromIndex:([qrecord.relateFilePath  rangeOfString:@"temp"].location+5)];
      qrecord.relateFilePath=[file retain];
    }
    
  }
  
  User*user=[[AppDelegate getAppDelegate]getCurrentUser];
  

  
  
  NSString*filepath=[[NSString alloc]initWithFormat:@"%@/%@.xml",path,user.agent.AgentCode];
  //1.导出答卷vo
  if ([[UTSystemHelper getCstSettingsByKey:Export_Survey]isEqualToString:@"Y"]) {
    NSString *filecontent = [writer stringWithObject:surveyAnswer error:&error];
    [UTSystemHelper saveFiletoLocal:filepath filecontent:filecontent];
    [filelist addObject:filepath];
//    BOOL result=[UTSystemHelper addFileToZip:[PathHelper documentDirectoryPathWithName:filepath] toZipfile:[[NSString alloc]initWithFormat:@"export_%@.zip",project.ProjectId] withFileName:filepath];
//    if (!result) {
//      NSString*msg=[[NSString alloc]initWithFormat:@"导出文件%@，失败！",filepath];
//      [[AppDelegate getAppDelegate]alert:@"出错提示" message:msg];
//      return;
//    }

  }
  //2.导出图片文件
  if ([[UTSystemHelper getCstSettingsByKey:Export_Image]isEqualToString:@"Y"]) {
    NSArray*imagesPath=[surveyAnswer getImagesPath];
    for (NSString*imagePath in imagesPath) {
      NSString*file=[imagePath substringFromIndex:([imagePath rangeOfString:@"temp"].location+5)];
      NSString*filename=[[NSString alloc]initWithFormat:@"%@/%@",path,file];
      NSError*error=nil;
      BOOL result=[UTSystemHelper copyfile:imagePath toPath:[PathHelper getdocumentFilePath:filename] error:&error ];
//       BOOL result=[UTSystemHelper addFileToZip:imagePath toZipfile:[[NSString alloc]initWithFormat:@"export_%@.zip",project.ProjectId] withFileName:filename];
      if (!result) {
        NSString*msg=[[NSString alloc]initWithFormat: @"导出文件%@，失败！",filename];
        [[AppDelegate getAppDelegate]alert:@"出错提示" message:msg];
        return nil;
      }
      [filelist addObject:filename];
    }
  }
  //3.导出音视频文件
  if ([[UTSystemHelper getCstSettingsByKey:Export_Media]isEqualToString:@"Y"]) {
    NSArray*mediasPath=[surveyAnswer getMediasPath];
    for (NSString*mediaPath in mediasPath) {
      NSString*file=[mediaPath substringFromIndex:([mediaPath rangeOfString:@"temp"].location+5)];
      NSString*filename=[[NSString alloc]initWithFormat:@"%@/%@",path,file];
   BOOL result=[UTSystemHelper copyfile:mediaPath toPath:[PathHelper getdocumentFilePath:filename] error:&error ];

//      BOOL result=[UTSystemHelper addFileToZip:mediaPath toZipfile:[[NSString alloc]initWithFormat:@"export_%@.zip",project.ProjectId] withFileName:filename];
      if (!result) {
        NSString*msg=[[NSString alloc]initWithFormat:@"导出文件%@，失败！",filename];
        [[AppDelegate getAppDelegate]alert:@"出错提示" message:msg];
        return nil;
      }
      [filelist addObject:filename];
    }
    NSArray*voiecesPath=[surveyAnswer getVoicesPath];
    for (NSString*voicePath in voiecesPath) {
      NSString*file=[voicePath substringFromIndex:([voicePath rangeOfString:@"temp"].location+5)];
      NSString*filename=[[NSString alloc]initWithFormat:@"%@/%@",path,file];
      NSError*error=nil;
       BOOL result=[UTSystemHelper copyfile:voicePath toPath:[PathHelper getdocumentFilePath:filename] error:&error ];//      BOOL result=[UTSystemHelper addFileToZip:voicePath toZipfile:[[NSString alloc]initWithFormat:@"export_%@.zip",project.ProjectId] withFileName:filename];
      if (!result) {
        NSString*msg=[[NSString alloc]initWithFormat:@"导出文件%@，失败！",filename];
        [[AppDelegate getAppDelegate]alert:@"出错提示" message:msg];
       return nil;
      }
      [filelist addObject:filename];
    }
  }
  return filelist;

      
  
  
  
}
-(void)backQuestion:(Model_Question*) question
{
  [mSurveyManager backQuestion:question];
}
-(void)downloadProjectFiles:(Project*)project
{
  
  
  
  //获取项目包括的文件信息
  if (project.downloadFilelist.count==0) {
    BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                             action:@selector(getDownLoadResumeFileWrapperDidReceive:obj:)];
    User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
    advClient.context=project;
    [advClient getDownLoadResumeFileWrapper:currentuser.username companyCode:currentuser.companyCode projectId:project.ProjectId ];
  }
  else {
    for (CAPIResumeFile*file in project.downloadFilelist) {
      if (file.CompleteStatus!=Complete) {
        //下载文件
        [self downloadFile:file forProject:project];
        break;
      }
    }
  }
  
}
-(NSString*)getSampleValueForKey:(NSString*)key{
  return  [[[mSampleListView getSelectedSample] proxyForJson]valueForKey:key];
}
#pragma mark-
#pragma  mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
  if (alertView.tag==1) {
    if (buttonIndex==1) {
      surveystatus=0;
      mPojectSelectView.hidden=YES;
      mStatisticView.hidden=YES;
      [self surveyFinished:FALSE];
      [mSampleListView getSelectedSample].status=52;
      [UTAnimations setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
      if(mSwitchProject)
      {
        mPojectSelectView.projects=mProjects;

        mPojectSelectView.hidden=FALSE;
        [self.view bringSubviewToFront:mPojectSelectView];
      }
      
    }

  }
  if (alertView.tag==4&&buttonIndex==1) {
    BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:nil 
                                                             action:nil];
    [advClient agentLoginOut:[[AppDelegate getAppDelegate]getCurrentUser].username companyCode:[[AppDelegate getAppDelegate]getCurrentUser].companyCode ];
    [[AppDelegate getAppDelegate]showLoginView];
  }
//if(alertView.tag==3)
//{
//  if (buttonIndex==0) {
//    BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
//                                                             action:@selector(getSampleListDidReceive:obj:)];
//    User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
//    if (currentuser==nil) {//尚未登录
//      return;
//    }
//    advClient.context=[mProjectListView getSelectedProject];
//    User*user=[[AppDelegate getAppDelegate]getCurrentUser];
//    [advClient getSampleList:user.username companyCode:user.companyCode projectId:[mProjectListView getSelectedProject].ProjectId ];
//    
//    
//
//    return;
//  }
//}
}

-(void)sendImageinfo
{
  //本地登陆或不需要上传监控屏幕和答题路径信息
  if (![[UTSystemHelper getCstSettingsByKey:Monitor]isEqualToString:@"1"]||[AppDelegate getAppDelegate ].isLocalLogin) {
    return;
  }
      UIGraphicsBeginImageContext([mSurveyExcuteView getQuestionView].bounds.size);  
      [[mSurveyExcuteView getQuestionView].layer renderInContext:UIGraphicsGetCurrentContext()];   
      UIImage*image=UIGraphicsGetImageFromCurrentImageContext();    
      UIGraphicsEndImageContext();    
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
      //  
      [dateFormatter setDateFormat:@"yyyyMMddHHmmss"]; 
      //保存图像
      NSString *filepath =[[NSString alloc]initWithFormat:@"imageMonitor/%@.png",[dateFormatter stringFromDate:[NSDate date]]];
   
     
   

      BILayerClient*advClient2 = [[BILayerClient alloc] initWithTarget:nil 
                                                                action:nil];
      
      User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
      if (currentuser==nil) {//尚未登录
        return;
      }
      NSData*imgData= UIImagePNGRepresentation(image);
      if ([imgData length]>=0) {
        [advClient2 sendInspectImage:currentuser.agent.Id  loginName:currentuser.username companyCode:currentuser.companyCode contents:imgData projectId:[mProjectListView getSelectedProject].ProjectId fileName:filepath startPos:0 fileLength:[imgData length]];
      }
}
-(void)sendTrackinfo:(int)index
{
  if ([AppDelegate getAppDelegate ].isLocalLogin||![[UTSystemHelper getCstSettingsByKey:Monitor]isEqualToString:@"1"]) {
    return;
  }
  NSString*content=@"";
  User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
  if (currentuser==nil) {//尚未登录
    return;
  }
  if (index==-1) {
    NSString*projectid=[mProjectListView getSelectedProject].ProjectId;
    content=[[NSString alloc]initWithFormat:@"%@ %@执行%@问卷调查，访问开始",[UTSystemHelper getCurrentDate],currentuser.username,projectid];
  }
  else if(index==-2)
  {
    NSString*projectid=[mProjectListView getSelectedProject].ProjectId;
    content=[[NSString alloc]initWithFormat:@"%@ %@执行%@问卷调查，访问结束",[UTSystemHelper getCurrentDate],currentuser.username,projectid];

  }
    else if(index==-3)
  {
    NSString*projectid=[mProjectListView getSelectedProject].ProjectId;
    content=[[NSString alloc]initWithFormat:@"%@ %@执行%@问卷调查，中途退出",[UTSystemHelper getCurrentDate],currentuser.username,projectid];
    
  }
    else 
    {
      NSString*projectid=[mProjectListView getSelectedProject].ProjectId;
      content=[[NSString alloc]initWithFormat:@"%@ %@执行%@问卷调查，当前题号:%d",[UTSystemHelper getCurrentDate],currentuser.username,projectid,index];
      
    }

  
  BILayerClient*advClient2 = [[BILayerClient alloc] initWithTarget:nil 
                                                            action:nil];
  
  
  [advClient2 sendTrackInfo:currentuser.username companyCode:currentuser.companyCode  content:content projectId:[mProjectListView getSelectedProject].ProjectId projectCode:[mProjectListView getSelectedProject].ProjectCode];


  
}
-(void)startGpsMonitor
{
  if (mGpsMonitorRunned) {//监控线程已经启动
    return;
  }
  mGpsMonitorRunned=TRUE;
  [locationManager startUpdatingLocation];
  dispatch_async(dispatch_get_global_queue(0, 0), ^{  
    while (mGpsMonitorRunned) {
      [NSThread sleepForTimeInterval:10]; 
      if ([mGpsInfo isEqualToString:@""]||[AppDelegate getAppDelegate ].isLocalLogin) {
        continue;
      }
  
        BILayerClient*advClient2 = [[BILayerClient alloc] initWithTarget:nil 
                                                                  action:nil];
        
        User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
        if (currentuser==nil) {//尚未登录
          continue;
        }
         [advClient2 sendInfo:currentuser.username companyCode:currentuser.companyCode  deviceType:@"2" projectId:[mProjectListView getSelectedProject].ProjectId gps:mGpsInfo];
    }
    
    
  });  

}
-(void)stopGpsMonitor
{
   mGpsMonitorRunned=FALSE;
  [locationManager stopUpdatingLocation];
}
-(void)startPump
{  
  dispatch_async(dispatch_get_global_queue(0, 0), ^{  
    while (TRUE) {
    
      if (![AppDelegate getAppDelegate ].isLocalLogin) {
 
        
        User*currentuser= [[AppDelegate getAppDelegate]getCurrentUser];
        if (currentuser==nil) {//尚未登录
            [NSThread sleepForTimeInterval:10]; 
          continue;
        }
        BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                                 action:@selector(getInspectStatusDidReceive:obj:)];
        NSString*result=[advClient getInspectStatus:currentuser.username companyCode:currentuser.companyCode deviceType:@"2"];
        [UTSystemHelper saveCstSettingsWithValue:[result isEqualToString:@"success"]?@"1":@"0" forKey:Monitor];

          [NSThread sleepForTimeInterval:10]; 
        
      }
      }
     
    
  });  
}

#pragma mark-
#pragma  mark CLLocationManagerDelegate 

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation

{

  mGpsInfo=[[NSString alloc]initWithFormat:@"%f|%f", newLocation.coordinate.latitude,newLocation.coordinate.longitude];

  
}
@end