//
//  NKAnswerQuestionRecord.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VOEnums.h"
@interface NKAnswerQuestionRecord : NSObject
{
   NSString* answerId;

 
  
   NSString* filePath;
   NSString* questionId;
   NSString* answerQuestionId;
   NSString* qinfoElementBodyId;
   NSString* qinfoElementId;
  
   enum EnumAnswerRecordScope recordScope;
   enum EnumAnswerRecordType recordType;
   NSString* relateFilePath;

 
   NSData* voiceBlob;//voiceBlob
   
    
}
@property (nonatomic, retain)NSString* answerId;


@property (nonatomic, retain)NSData* voiceBlob;
@property (nonatomic, retain)NSString* filePath;
@property (nonatomic, retain)NSString* questionId;

@property (nonatomic, retain)NSString* qinfoElementBodyId;
@property (nonatomic, retain)NSString* qinfoElementId;
@property (nonatomic, retain)NSString* answerQuestionId;
@property (nonatomic, assign)enum EnumAnswerRecordScope recordScope;
@property (nonatomic, assign)enum EnumAnswerRecordType recordType;
@property (nonatomic, retain)NSString* relateFilePath;

@end
