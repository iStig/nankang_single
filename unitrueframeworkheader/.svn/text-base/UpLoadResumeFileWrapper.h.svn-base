//
//  UpLoadResumeFileWrapper.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAPIResumeFile.h"
@interface UpLoadResumeFileWrapper : NSObject
{
  /// <summary>
  /// 断点续传文件集合()
  /// </summary>
  NSMutableArray* ResumenFileList ;
  
  /// <summary>
  /// 上传任务状态(状态 0准备；1：下载中；2完成；3无效)
  /// </summary>
  int UpnLoadTaskState ;
  
  /// <summary>
  /// 结果标识，小于0，为不成功，为1表示成功
  /// </summary>
  int result;
  
  /// <summary>
  /// 消息
  /// </summary>
  NSString* msg ;
}

@property (nonatomic, retain) NSString* msg ;
@property (nonatomic, retain) NSMutableArray* ResumenFileList ;
@property (nonatomic, assign) int UpnLoadTaskState ;
@property (nonatomic, assign) int result ;
- (UpLoadResumeFileWrapper*)initWithJsonDictionary:(NSDictionary*)dic;
@end
