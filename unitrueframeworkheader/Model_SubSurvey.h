//
//  Model_SubSurvey.h
//  nankang
//
//  Created by 军锋 安 on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"
#import "SurveyLibraryLiteral.h"
#import "DDXMLElementAdditions.h"
#import "Model_ObjectBase.h"
@interface Model_SubSurvey : Model_ObjectBase
{
    NSString*   Id; 
    NSString*   Identity; 
    NSString*   Name; 
    NSString*   IsAlternation;
    NSString*   IsDraw; 
    NSString*   Memo; 
    NSString*   IsSamePage; 
    NSString*   SectionAlternation; 
    NSString*   SectionDraw;
    NSMutableArray* SectionList;
}
@property(strong,nonatomic)NSMutableArray* SectionList;
@property(strong,nonatomic)NSString*   Id; 
@property(strong,nonatomic)NSString*   Identity; 
@property(strong,nonatomic)NSString*   Name; 
@property(strong,nonatomic)NSString*   IsAlternation;
@property(strong,nonatomic)NSString*   IsDraw; 
@property(strong,nonatomic)NSString*   Memo; 
@property(strong,nonatomic)NSString*   IsSamePage; 
@property(strong,nonatomic)NSString*   SectionAlternation; 
@property(strong,nonatomic)NSString*   SectionDraw;
- (id)initWithXml:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral*) surveyLib;
@end
