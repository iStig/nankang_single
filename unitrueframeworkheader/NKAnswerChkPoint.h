//
//  NKAnswerChkPoint.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKAnswerChkPoint : NSObject//显示为空数组
{
  NSString* answerCheckPointId;
  NSString* answerId;
  NSString* checkPointId;
   float    pointValue;
}
@property (nonatomic, retain)NSString* answerCheckPointId;
@property (nonatomic, retain)NSString* answerId;
@property (nonatomic, retain)NSString* checkPointId;
@property (nonatomic, assign)float pointValue;
@end
