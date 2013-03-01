//
//  NKAnswerInfo.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKSampleVisit.h"
#import "VOEnums.h"
#import "NKAnswerQFlow.h"
@interface NKAnswerInfo : NSObject
{
   NSString* answerId;
   enum EnumCheckFlag checkFlag;
   NSString* checkMemoContent;
   NSString* checkPerson;
   float checkPointValue;
   NSString* checkTime;
   enum EnumCodingFlag codingFlag;
   NSString* endTime;
   NSString* gpsLatitude;
   NSString* gpsLongitude;
   NSString* gpsRawText;
   NSString* projectId;
   NSString* questionnaireId;
   NSString* sampleId;
   NSString* startTime;
   enum EnumAnswerStatus status;
   NSString* vedioPath;
   NSString* visitAgent;
   int visitDuration;
   NSString* voiceFile;
  //逻辑部分,用来上传到服务器

  NSMutableArray*answerContents;
  NSMutableArray*answerChkPoint;
  
  NSMutableArray*answerQElement;
  NKAnswerQFlow*answerQFlow;
  NSMutableArray*answerQuestion;
  NSMutableArray*answerQuestionRecord;
  NSMutableArray*answerVariable;
  NSMutableArray*answerVariableHistory;
  
  NSMutableArray*answers4upload;//原始的答卷内容，需要解析成上面的各个变量以供上传
     NSMutableArray*questions;//答卷原题
  
  NSString*voicePath;
  NSMutableArray*imagesPath;
  NSMutableArray*mediasPath;
}
@property(nonatomic,retain) NSString*voicePath;
@property(nonatomic,retain) NSMutableArray*imagesPath;
@property (nonatomic, retain)NSMutableArray*mediasPath;
@property(nonatomic,retain) NSMutableArray*questions;
@property(nonatomic,retain) NSMutableArray*answers4upload;
@property (nonatomic, retain)NSMutableArray*answerContents;
@property (nonatomic, retain)NSMutableArray*answerChkPoint;

@property (nonatomic, retain)NSMutableArray*answerQElement;
@property (nonatomic, retain)NKAnswerQFlow*answerQFlow;
@property (nonatomic, retain)NSMutableArray*answerQuestion;
@property (nonatomic, retain)NSMutableArray*answerQuestionRecord;
@property (nonatomic, retain)NSMutableArray*answerVariable;
@property (nonatomic, retain)NSMutableArray*answerVariableHistory;
@property (nonatomic, retain)NSString* answerId;
@property (nonatomic, retain)NKSampleVisit*sampleVisit;
@property (nonatomic, assign)enum EnumCheckFlag checkFlag;
@property (nonatomic, retain)NSString* checkMemoContent;
@property (nonatomic, retain)NSString* checkPerson;
@property (nonatomic, assign)float checkPointValue;
@property (nonatomic, retain)NSString* checkTime;
@property (nonatomic, assign)enum EnumCodingFlag codingFlag;
@property (nonatomic, retain)NSString* endTime;
@property (nonatomic, retain)NSString* gpsLatitude;
@property (nonatomic, retain)NSString* gpsLongitude;
@property (nonatomic, retain)NSString* gpsRawText;
@property (nonatomic, retain)NSString* projectId;
@property (nonatomic, retain)NSString* questionnaireId;
@property (nonatomic, retain)NSString* sampleId;
@property (nonatomic, retain)NSString* startTime;
@property (nonatomic, assign)enum EnumAnswerStatus status;
@property (nonatomic, retain)NSString* vedioPath;
@property (nonatomic, retain)NSString* visitAgent;
@property (nonatomic, assign)int visitDuration;
@property (nonatomic, retain)NSString* voiceFile;
@end
