//
//  SampleQuotaVO.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKAnswerInfo.h"
#import "NKSampleVisit.h"
@interface NKSample : NSObject
{
  NSString*  address;
  NSString*  agent;
  NSString*  area;
  NSString*  areaCode;
  NSString*  city;
  NSString*  companyTel1;
  NSString*  companyTel2;
  NSString*  country;
  NSString*  countryCode;
  NSString*  createPerson;
  NSString*  createTime;
  NSString*  email;
  NSString*  homeTel1;
  NSString*  homeTel2;
  NSString*  identityCardNo;
  NSString*  lastContact;
  NSString*  lastContactAgent;
  NSString*  memoContent;
  NSString*  mobileTel;//联系电话
  NSString*  name;//姓名
  NSString*  companyCode;
  NSString*  otherTel;
  NSString*  preAgent;
  NSString*  preAgentGroup;
  NSString*  pprefix;
  
  NSString*  province;
 
  NSString*  quotaValue;
  NSString*  sampleId; //样本编号
  
  NSString*  sex;//性别
 
  NSString*  suffix;
  NSString*  updatePerson;
  NSString*  updateTime;
  int  status;//-2未接触  -1访问中 50 成功 52中途退出 51不成功
  int  sampleIndex;
  int  sampleType;
  int  quotaStatus;
  int  visitNum;
  int  isDownLoad;
  int  lastCheckFlag;
  int  priority;
  
  //逻辑部分
  NKAnswerInfo*answerInfo;
    NKSampleVisit*sampleVisit;//已访问次数 nil 0
}
@property (nonatomic, retain) NKSampleVisit*sampleVisit;
@property (nonatomic, retain)NKAnswerInfo*answerInfo;
@property (nonatomic, retain)  NSString*  address;
@property (nonatomic, retain)  NSString*  agent;
@property (nonatomic, retain)  NSString*  area;
@property (nonatomic, retain)  NSString*  areaCode;
@property (nonatomic, retain)  NSString*  city;
@property (nonatomic, retain)  NSString*  companyTel1;
@property (nonatomic, retain)  NSString*  companyTel2;
@property (nonatomic, retain)  NSString*  country;
@property (nonatomic, retain)  NSString*  countryCode;
@property (nonatomic, retain)  NSString*  createPerson;
@property (nonatomic, retain) NSString*  createTime;
@property (nonatomic, retain)  NSString*  email;
@property (nonatomic, retain)  NSString*  homeTel1;
@property (nonatomic, retain)  NSString*  homeTel2;
@property (nonatomic, retain)  NSString*  identityCardNo;
@property (nonatomic, assign) int  isDownLoad;
@property (nonatomic, assign) int  lastCheckFlag;
@property (nonatomic, retain) NSString*  lastContact;
@property (nonatomic, retain)  NSString*  lastContactAgent;
@property (nonatomic, retain)  NSString*  memoContent;
@property (nonatomic, retain)  NSString*  mobileTel;
@property (nonatomic, retain)  NSString*  name;
@property (nonatomic, retain)  NSString*  companyCode;
@property (nonatomic, retain)  NSString*  otherTel;
@property (nonatomic, retain)  NSString*  preAgent;
@property (nonatomic, retain)  NSString*  preAgentGroup;
@property (nonatomic, retain)  NSString*  pprefix;
@property (nonatomic, assign) int  priority;
@property (nonatomic, retain)  NSString*  province;
@property (nonatomic, assign) int  quotaStatus;
@property (nonatomic, retain)  NSString*  quotaValue;
@property (nonatomic, retain)  NSString*  sampleId;
@property (nonatomic, assign) int  sampleIndex;
@property (nonatomic, assign) int  sampleType;
@property (nonatomic, retain)  NSString*  sex;
@property (nonatomic, assign) int status;
@property (nonatomic, retain)  NSString*  suffix;
@property (nonatomic, retain)  NSString*  updatePerson;
@property (nonatomic, retain) NSString*  updateTime;
@property (nonatomic, assign) int  visitNum;
- (NKSample*)initWithJsonDictionary:(NSDictionary*)dic;
@end
