//
//  AgentLoginResult.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AgentLoginResult : NSObject
{

  
  int result;//返回成功与否；
  
  /// <summary>
  /// 获取服务器返回的信息
  /// </summary>
  
  NSString* msg ;
  /// <summary>
  /// 下发路径
  /// </summary>
  
  NSString* downloadPath ;
  /// <summary>
  /// 上传路径
  /// </summary>
  
  NSString* uploadPath ;
  /// <summary>
  /// 监控路径
  /// </summary>
  
  NSString* inspectPath ;
}
@property (nonatomic, assign) int result ;
@property (nonatomic, retain) NSString* msg ;
@property (nonatomic, retain) NSString* downloadPath ;
@property (nonatomic, retain) NSString* uploadPath ;
@property (nonatomic, retain) NSString* inspectPath ;
- (AgentLoginResult*)initWithJsonDictionary:(NSDictionary*)dic;
@end
