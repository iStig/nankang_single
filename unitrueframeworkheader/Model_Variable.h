//
//  Model_Variable.h
//  nankang
//
//  Created by 军锋 安 on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"
#import "SurveyLibraryLiteral.h"
#import "DDXMLElementAdditions.h"
@interface Model_Variable : NSObject
{
    NSString*   ID;
    NSString*   name;
    NSString*   type;
}
@property(strong,nonatomic)NSString*   ID;
@property(strong,nonatomic)NSString*   name;
@property(strong,nonatomic)NSString*   type;
- (id)initWithXml:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral*) surveyLib;
@end
