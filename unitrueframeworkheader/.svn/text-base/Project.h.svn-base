//
//  ProjectVO.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VOEnums.h"
#import "NKSample.h"
#import "CJSONSerializer.h"
#import "JSONRepresentation.h"

@interface Project : NSObject<JSONRepresentation>
{
  /********服务器接口部分*******************/
  NSString* ProjectCategoryId;
  NSString* ProjectCategoryId2;
  NSString* ParentId;
  NSString* CreatedCompanyCode;
  NSString* ExecutedCompanyCode;
  NSString* ProjectCode;
  NSString* ProjectName;//项目名称
  enum EnumProjectPublishFlag PublishFlag ;
  enum EnumProjectProp Prop;
  enum EnumProjectStatus Status;
  enum EnumProjectStatus OldStatus;
  NSString* CreateTime;
  NSString* CreatePerson;
  NSString* MemoContent;
  NSString* CustomerId;
  NSString* ProjectId;//++++
  
  //新增加的四个时间范围字段
  NSString* StartTime;//项目开始时间
  NSString* EndTime;//项目结束时间
  NSString* TaskStartTime;//任务开始时间
  NSString* TaskEndTime;//任务结束时间
  /*****************逻辑部分************************/
  NSMutableArray  *downloadFilelist;//文件下载信息（CAPIResumeFile）
  NSMutableArray  *uploadFilelist;//文件上传信息（CAPIResumeFile）

   NSMutableArray  *samples;//样本列表
   NSMutableArray  *sampleStatuss;//样本状态列表
  
  NSMutableArray*answerSurveys;//待上传的答卷列表
  BOOL fileDownloading;//下载文件中
  BOOL fileuploading;//上传文件中
  BOOL isOldProject;//是否是已有项目
  
  

}
@property (nonatomic, assign)   BOOL isOldProject;
@property (nonatomic, assign)   BOOL fileuploading;
@property (nonatomic, assign)   BOOL fileDownloading;
@property (nonatomic, retain)   NSMutableArray*answerSurveys;
@property (nonatomic, retain)  NSMutableArray  *sampleStatuss ;
@property (nonatomic, retain)  NSMutableArray  *samples ;
@property (nonatomic, retain) NSString* ProjectCategoryId ;
@property (nonatomic, retain) NSString* ProjectCategoryId2 ;
@property (nonatomic, retain) NSString* ParentId ;
@property (nonatomic, retain) NSString* CreatedCompanyCode ;
@property (nonatomic, retain) NSString* ExecutedCompanyCode ;
@property (nonatomic, retain) NSString* ProjectCode ;
@property (nonatomic, retain) NSString* ProjectName ;
@property (nonatomic, retain) NSString* CreatePerson ;
@property (nonatomic, retain) NSString* MemoContent ;
@property (nonatomic, retain) NSString* CustomerId ;
@property (nonatomic, retain) NSString* ProjectId ;
@property (nonatomic, retain) NSString* TaskEndTime ;
@property (nonatomic, retain) NSString* TaskStartTime ;
@property (nonatomic, retain) NSString* EndTime ;
@property (nonatomic, retain) NSString* StartTime ;
@property (nonatomic, retain) NSString* CreateTime ;
@property (nonatomic, assign)enum EnumProjectPublishFlag PublishFlag ;
@property (nonatomic, assign) enum EnumProjectStatus Status;
@property (nonatomic, assign) enum EnumProjectProp Prop; ;
@property (nonatomic, assign) enum EnumProjectStatus OldStatus;

@property (nonatomic, retain) NSMutableArray  *uploadFilelist ;
@property (nonatomic, retain) NSMutableArray  *downloadFilelist ;
- (Project*)initWithJsonDictionary:(NSDictionary*)dic;
@end
