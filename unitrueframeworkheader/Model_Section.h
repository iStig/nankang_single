//
//  Model_Section.h
//  nankang
//
//  Created by 军锋 安 on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"
#import "SurveyLibraryLiteral.h"
#import "DDXMLElementAdditions.h"
#import "Model_ObjectBase.h"
@interface Model_Section : Model_ObjectBase
{
    NSString* ID; 
    NSString* identity; 
    NSString* name; 
    NSString* isalternation;
    NSString* isdraw; 
    NSString* memo; 
    NSString* issamepage; 
    NSString* questionalternation; 
    NSString* questiondraw;
    NSMutableArray* QuestionList;
}
@property(strong,nonatomic)NSMutableArray* QuestionList;
@property(strong,nonatomic)NSString* ID; 
@property(strong,nonatomic)NSString* identity; 
@property(strong,nonatomic)NSString* name; 
@property(strong,nonatomic)NSString* isalternation;
@property(strong,nonatomic)NSString* isdraw; 
@property(strong,nonatomic)NSString* memo; 
@property(strong,nonatomic)NSString* issamepage; 
@property(strong,nonatomic)NSString* questionalternation; 
@property(strong,nonatomic)NSString* questiondraw;
- (id)initWithXml:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral*) surveyLib;
@end
