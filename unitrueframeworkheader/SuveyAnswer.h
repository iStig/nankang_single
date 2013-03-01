//
//  SuveyAnswer.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NKAgent;
@class NKCompany;
@class Project;
@interface SuveyAnswer : NSObject
{
  NKAgent*agent;
  NKCompany*company;
  Project*project;
  NSMutableArray*samples;
  NSMutableArray*samplesVisits;
  NSMutableArray*answerContents;
  NSMutableArray*answerChkPoint;//可为空
  NSMutableArray*answerInfo;
  NSMutableArray*answerQElement;//可为空
  NSMutableArray*answerQFlow;
  NSMutableArray*answerQuestion;
  NSMutableArray*answerQuestionRecord;
  NSMutableArray*answerVariable;
  NSMutableArray*answerVariableHistory;
  
  NSMutableArray*voicesPath;
  NSMutableArray*imagesPath;
  NSMutableArray*mediasPath;
  
  
}
@property(nonatomic,retain) NSMutableArray*answerQuestionRecord;
@property(nonatomic,retain) NKAgent*agent;
@property(nonatomic,retain) NKCompany*company;
@property(nonatomic,retain) Project*project;
-(id)initWithAgent:(NKAgent*)agent company:(NKCompany*)comany project:(Project*)project samples4Upload:(NSArray*)samples;
-(NSArray*)getVoicesPath;
-(NSArray*)getImagesPath;
-(NSArray*)getMediasPath;

@end
