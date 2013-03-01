//
//  User.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import "NKAgent.h"
#import "NKCompany.h"
@interface User : NSObject
{
  

  NSString* username ;
  NSString* password ;
  NSString* companyCode ;
  NSMutableArray*projects;
  
  NSString* downloadPath ;//下发路径

  NSString* uploadPath ;// 上传路径

  NSString* inspectPath ;// 监控路径
  NKAgent*agent;
  NKCompany*company;

}
@property (nonatomic, retain) NKCompany*company;
@property (nonatomic, retain) NKAgent*agent;
@property (nonatomic, retain) NSString* username ;
@property (nonatomic, retain) NSString* password ;
@property (nonatomic, retain) NSString* companyCode ;
@property (nonatomic, retain) NSString* inspectPath ;
@property (nonatomic, retain) NSString* downloadPath ;//下发路径

@property (nonatomic, retain) NSString* uploadPath ;// 上传路径
@property (nonatomic, retain) NSMutableArray*projects;
@end
