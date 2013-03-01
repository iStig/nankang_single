//
//  NKAnswerContent.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKAnswerContent : NSObject
{
  NSString* answerCode;
  NSString* answerContentId;
  NSString* answerId;
  NSString* answerQInfoElementId;
  NSString* answerQuestionId;
  NSString* answerText;
   NSNumber*  displayEffect;
   NSNumber* isSelected;
  NSString* questionId;
   int selectOrder;
}
@property (nonatomic, retain)NSString* answerCode;
@property (nonatomic, retain)NSString* answerContentId;
@property (nonatomic, retain)NSString* answerId;
@property (nonatomic, retain)NSString* answerQInfoElementId;
@property (nonatomic, retain)NSString* answerQuestionId;
@property (nonatomic, retain)NSString* answerText;
@property (nonatomic, assign)NSNumber* displayEffect;
@property (nonatomic, retain) NSNumber* isSelected;
@property (nonatomic, retain)NSString* questionId;
@property (nonatomic, assign)int selectOrder;
@end
