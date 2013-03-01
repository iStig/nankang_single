//
//  ResultObjec.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultObject : NSObject
{
  /// <summary>
  /// 返回一个用于标识此次文件传输的唯一ID号
  /// </summary>
  
  int result ;//返回成功与否；
  /// <summary>
  /// 获取服务器返回的信息
  /// </summary>
  
  NSString* msg ;
  /// <summary>
  /// 返回在服务器、客户端上要保存的文件名
  /// </summary>
  
  NSString* info ;
  /// <summary>
  /// 返回List序列化后字符串，获取后需要反序列化
  /// </summary>
  
  NSMutableArray* content ;
}

@property (nonatomic, retain) NSString* msg ;
@property (nonatomic, retain) NSMutableArray* content ;
@property (nonatomic, assign) NSString* info ;
@property (nonatomic, assign) int result ;
- (ResultObject*)initWithJsonDictionary:(NSDictionary*)dic;
@end
