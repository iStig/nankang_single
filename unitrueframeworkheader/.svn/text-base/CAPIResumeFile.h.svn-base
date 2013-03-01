//
//  CAPIResumeFileListVO.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VOEnums.h"
@interface CAPIResumeFile : NSObject
{
  NSString* Id ;//编号
  NSString* TaskId ;//任务编号
  NSString* CompanyCode ;//公司码
  int ThreadId ;//下载器编号
  int StartPos ;//开始点
  int EndPos ;//结束点
  int CompleteSize ;//完成度
  enum EnumFileCompleteStatus CompleteStatus ;//下载文件状态
  NSString* Url ;//URL
  NSString* BeginTime ;//开始时间
  NSString* EndTime ;//结束时间
  long FileSize ;//文件总大小
  enum EnumUpDownType UploadDownType ;//上传下发类型
  BOOL isSurvery;//是否是问卷文件
}
@property (nonatomic, retain) NSString* Id ;
@property (nonatomic, retain) NSString* TaskId ;
@property (nonatomic, retain) NSString* CompanyCode ;
@property (nonatomic, retain) NSString* Url ;
@property (nonatomic, retain) NSString* BeginTime ;
@property (nonatomic, retain) NSString* EndTime ;
@property (nonatomic, assign) int ThreadId ;
@property (nonatomic, assign) int StartPos ;
@property (nonatomic, assign) int EndPos ;
@property (nonatomic, assign) int CompleteSize ;
@property (nonatomic, assign) BOOL isSurvery; ;
@property (nonatomic, assign) long FileSize ;
@property (nonatomic, assign) enum EnumFileCompleteStatus CompleteStatus ;
@property (nonatomic, assign) enum EnumUpDownType UploadDownType ;
- (CAPIResumeFile*)initWithJsonDictionary:(NSDictionary*)dic;
@end
