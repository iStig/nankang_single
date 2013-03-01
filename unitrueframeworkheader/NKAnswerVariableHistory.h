//
//  NKAnswerVariableHistory.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKAnswerVariableHistory : NSObject
{
  NSString* answerId;
   int pageIndex;
  NSString* answerVariableId;
 NSString* variableValue;
}
@property (nonatomic, retain)NSString* answerId;
@property (nonatomic, assign)int pageIndex;
@property (nonatomic, retain)NSString* answerVariableId;
@property (nonatomic, retain)NSString* variableValue;

@end
