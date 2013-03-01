//
//  RootViewController.h
//  nankang
//
//  Created by xudong jin on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTBaseViewController.h"
#import "QuestBaseViewController.h"
#import "SurveyManager.h"
#import "NKSample.h"
#import <MapKit/MapKit.h>

#import "Project.h"
@class SampleSelectView;
@class ProjectSelectView;
@class ProjectListView;
@class SampleListView;
@class SurveyExcuteView;
@class StatisticView;
enum CurrentStep
{
  NOStep,
  ProjectManage,//项目管理
  SampleManage,//样本管理
  ExcuteSurvey,//问卷执行
  Statistic,//统计
  UploadStep,//答卷上传
  ExportFile,//答卷导出
  Other//其他
};
@interface RootViewController : UTBaseViewController<UIAlertViewDelegate,CLLocationManagerDelegate>
{

  
  IBOutlet UIView*defaultMenuView;
  IBOutlet UIView*projectManageMenuView;
  IBOutlet UIView*rightView;//右侧展示区域
  IBOutlet UIView*otherMenuView;
  IBOutlet UIActivityIndicatorView*progress;
   CLLocationManager *locationManager;
    
  enum CurrentStep mCurrentStep;
   ProjectSelectView *mPojectSelectView;//选择项目对话框
  SampleSelectView*mSampleSelectView;//选择样本对话框
  ProjectListView*mProjectListView;// 项目列表视图
  SampleListView*mSampleListView;// 样本列表视图
   SurveyExcuteView*mSurveyExcuteView;// 面访执行视图
  StatisticView*mStatisticView;//统计界面
    IBOutlet  UIButton *btn;
    int type;// -1:不弹出selectView 1:弹出selectView 10:selectViewCell被选中
    int btnstate;//
     int btnstateOther;//
    IBOutlet    UIButton *otherBtn;
    IBOutlet  UIButton *statisticBtn;
    IBOutlet UIButton *sampleBtn;
    IBOutlet UIButton *surveyBtn;
  
  NSMutableArray*mProjects;
  SurveyManager *mSurveyManager;
  NSMutableDictionary*mSampleListWithStatus;//按照样本状态分成的样本列表
    
  NSString*mSurveyxml;//当前执行的问卷脚本

    BOOL isFirstShow;
    IBOutlet UILabel *lab1;
    IBOutlet UILabel *lab2;
    IBOutlet UILabel *lab3;
    IBOutlet UILabel *lab4;
    IBOutlet UILabel *lab5;
    IBOutlet UILabel *lab6;
    IBOutlet UILabel *lab7;   
    IBOutlet UILabel *lab8;
    
    
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;

    IBOutlet UIImageView *imgProject;
    IBOutlet UIImageView *imgOther;
  
  int surveystatus;//1:在访问中 2:查看答案 0：其他状态
  NSString* sessionID;
  Project*currentuploadProject;
  NSArray*currentuploadSamples;
  
  BOOL mGpsMonitorRunned;
  BOOL mSwitchProject;
  NSString* mGpsInfo;//经纬度信息
 

}
@property(retain,nonatomic) SurveyManager *mSurveyManager;
@property(retain,nonatomic) NSMutableArray*mProjects;
-(IBAction)downloadClicked:(id)sender;//在线下载
-(IBAction)uploadClicked:(id)sender;//上传答卷
-(IBAction)excuteSurveyClicked:(id)sender;//问卷执行
-(IBAction)projectManageClicked:(id)sender;//项目管理
-(IBAction)sampleManageClicked:(id)sender;//样本管理
-(IBAction)statisticsClicked:(id)sender;//统计
-(IBAction)otherClicked:(id)sender;//其他
-(IBAction)deleteFilesClicked:(id)sender;//垃圾文件管理
-(IBAction)projectInfoClicked:(id)sender;//项目概况
-(IBAction)exportClicked:(id)sender;// 导出文件
-(IBAction)importClicked:(id)sender;// 导入文件
-(IBAction)settingsClicked:(id)sender;// 系统设置
-(IBAction)themesClicked:(id)sender;// 主题应用
-(IBAction)updateClicked:(id)sender;// 版本更新
-(IBAction)aboutClicked:(id)sender;// 关于
-(IBAction)logoutClicked:(id)sender;// 注销
-(void)reviewSurveyanswers:(NKSample*)sample;//查看答卷内容
-(void)excuteSurvey:(NKSample*)sample;
-(NSString*)getSampleStatusName:(NSString*)statuscode;
-(void)modualViewClosed:(id)sender;//对话框关闭回调
-(Project*)getSelectedProject;
-(NSMutableArray*)getNewSampleList4SelectedProject;
-(void)groupSampleListwithStatus;//将指定项目的样本根据样本状态分组
-(void)downloadProjectFiles:(Project*)project;
-(BOOL)deleteProjectFiles:(Project*)project;
-(BOOL)deleteSystemFiles:(int)type;//0:离线导出文件 1:离线下发文件
-(void)surveyFinished:(BOOL)isSuccess;
-(void)uploadSurveysForProject:(Project*)project;
-(void)prepare4ExcuteSurvey;//开始访问前进行准备
-(void)reuseSurveyForSample:(NKSample*)sample;//回收样本
-(void)importProjectFile:(NSString*)zipFile;//离线导入文件
-(void)switchProject;//切换项目
-(void)closeSurvey:(BOOL)switchProject;//switchProject:true切换项目，false:中止访问
-(void)startGpsMonitor;//开始gps监控
-(void)stopGpsMonitor;
-(void)sendImageinfo;
-(void)sendTrackinfo:(int)index;
-(void)backQuestion:(Model_Question*) question ;//问卷回退到指定题目
-(NSString*)getSampleValueForKey:(NSString*)key;//获取样本参数值
@end
