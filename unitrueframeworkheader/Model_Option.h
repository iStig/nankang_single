//
//  Model_Option.h
//  nankang
//
//  Created by 军锋 安 on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"
#import "SurveyLibraryLiteral.h"
#import "DDXMLElementAdditions.h"
@interface Model_Option : NSObject
{
    NSString*   ID;
    NSString*   index;
    NSString*   name;
}
@property(strong,nonatomic)NSString*   ID;
@property(strong,nonatomic)NSString*   index;
@property(strong,nonatomic)NSString*   name;
- (id)initWithXml:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral*) surveyLib;
@end
