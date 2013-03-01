//
//  NKAgent.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRepresentation.h"

@interface NKAgent : NSObject<JSONRepresentation>
{
  NSString*Id;
  NSString* AgentCode;

  NSString* CallerNo;

  NSString* CompanyCode;
  NSString* Department;

  NSString* LastPasswordTime;
  NSString* LoginName;
  NSString* Memo;
  NSString* Name;
  NSString* NormalGroupId;
  NSString* NormalGroupName;

  NSString* Password;
  NSString* Position;
  int Status;
  NSString* StatusText;
  int SysFlag;
}
@property (nonatomic, retain)NSString* AgentCode;
@property (nonatomic, retain)NSString* Id;
@property (nonatomic, retain)NSString* CallerNo;

@property (nonatomic, retain)NSString* CompanyCode;
@property (nonatomic, retain)NSString* Department;

@property (nonatomic, retain)NSString* LastPasswordTime;
@property (nonatomic, retain)NSString* LoginName;
@property (nonatomic, retain)NSString* Memo;
@property (nonatomic, retain)NSString* Name;
@property (nonatomic, retain)NSString* NormalGroupId;
@property (nonatomic, retain)NSString* NormalGroupName;

@property (nonatomic, retain)NSString* Password;
@property (nonatomic, retain)NSString* Position;
@property (nonatomic, assign)int Status;
@property (nonatomic, retain)NSString* StatusText;
@property (nonatomic, assign)int SysFlag;
- (NKAgent*)initWithJsonDictionary:(NSDictionary*)dic;
@end
