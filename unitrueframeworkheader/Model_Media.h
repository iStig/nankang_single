//
//  Model_Media.h
//  nankang
//
//  Created by 军锋 安 on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"
#import "SurveyLibraryLiteral.h"
#import "DDXMLElementAdditions.h"
@interface Model_Media : NSObject<NSCopying>
{
    NSString* Id; 
    NSString* Title; 
    NSString* Index; 
    NSString* MediaCategory;
    NSString* MediaFormat; 
    NSString* SizeMode; 
    NSString* Width; 
    NSString* Height; 
    NSString* DisplayMode; 
    NSString* FilePath; 
    NSString* WebFilePath; 
    NSString* Memo; 
    NSString* FillColor;
}
@property(strong,nonatomic)NSString* Id; 
@property(strong,nonatomic)NSString* Title; 
@property(strong,nonatomic)NSString* Index; 
@property(strong,nonatomic)NSString* MediaCategory;
@property(strong,nonatomic)NSString* MediaFormat; 
@property(strong,nonatomic)NSString* SizeMode; 
@property(strong,nonatomic)NSString* Width; 
@property(strong,nonatomic)NSString* Height; 
@property(strong,nonatomic)NSString* DisplayMode; 
@property(strong,nonatomic)NSString* FilePath; 
@property(strong,nonatomic)NSString* WebFilePath; 
@property(strong,nonatomic)NSString* Memo; 
@property(strong,nonatomic)NSString* FillColor;
- (id)initWithXml:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral*) surveyLib;
@end
