//
//  NKAnswerQElement.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKAnswerQElement : NSObject
{
   NSString* AnswerId;
   NSString* AnswerQInfoElementId;
   NSString* AnswerQuestionId;
   int DimensionIndex;
   int DisplayEffect;
   NSString* QInfoElementId;
   int SequenceNo;
   NSString* Tip;
   NSString* Title;
}
@property (nonatomic, retain)NSString* AnswerId;
@property (nonatomic, retain)NSString* AnswerQInfoElementId;
@property (nonatomic, retain)NSString* AnswerQuestionId;
@property (nonatomic, assign)int DimensionIndex;
@property (nonatomic, assign)int DisplayEffect;
@property (nonatomic, retain)NSString* QInfoElementId;
@property (nonatomic, assign)int SequenceNo;
@property (nonatomic, retain)NSString* Tip;
@property (nonatomic, retain)NSString* Title;
@end
