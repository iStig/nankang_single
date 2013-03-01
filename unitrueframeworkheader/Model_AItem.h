//
//  Model_AItem.h
//  UnitrueFramework
//
//  Created by 军锋 安 on 12-7-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DDXML.h"
#import "SurveyLibraryLiteral.h"
#import "DDXMLElementAdditions.h"
#import "Model_Media.h"
@interface Model_AItem : NSObject
{
    NSString* Id; 
    NSString* Identity; 
    NSString* Title; 
    NSString* Code; 
    NSString* Category;
    NSString* Index; 
    NSString* IsAlternation; 
    NSString* IsDraw; 
    NSString* IsOpen; 
    NSString* IShold; 
    NSString* Prop; 
    NSString* Min; 
    NSString* Max; 
    NSString* MaxNumOperator;
    NSString* MinNumOperator; 
    NSString* OpenTextShowAsPwd; 
    NSString* Memo; 
    NSString* FontFamily; 
    NSString* FontSize; 
    NSString* FontStyle; 
    NSString* ForeColor;
    NSString* OptionListItemId; 
    NSString* CategoryListItemId; 
    NSString* WithKnowledge; 
    NSString* ImageTextShowMode; 
    NSString* ImageTextPos;
    NSString* MarkEndTime; 
    NSString* IsOpenTextShowByDigit; 
    NSString* OpenTextFractionNum; 
    NSString* OpenTextPrefix; 
    NSString* OpenTextPostfix;
    NSString* ItemColWidth; 
    NSString* TitleHasScript;
    
    Model_Media* qItemMedia;
}
@property(strong,nonatomic)Model_Media* qItemMedia;
@property(strong,nonatomic)NSString* Id; 
@property(strong,nonatomic)NSString* Identity; 
@property(strong,nonatomic)NSString* Title; 
@property(strong,nonatomic)NSString* Code; 
@property(strong,nonatomic)NSString* Category;
@property(strong,nonatomic)NSString* Index; 
@property(strong,nonatomic)NSString* IsAlternation; 
@property(strong,nonatomic)NSString* IsDraw; 
@property(strong,nonatomic)NSString* IsOpen; 
@property(strong,nonatomic)NSString* IShold; 
@property(strong,nonatomic)NSString* Prop; 
@property(strong,nonatomic)NSString* Min; 
@property(strong,nonatomic)NSString* Max; 
@property(strong,nonatomic)NSString* MaxNumOperator;
@property(strong,nonatomic)NSString* MinNumOperator; 
@property(strong,nonatomic)NSString* OpenTextShowAsPwd; 
@property(strong,nonatomic)NSString* Memo; 
@property(strong,nonatomic)NSString* FontFamily; 
@property(strong,nonatomic)NSString* FontSize; 
@property(strong,nonatomic)NSString* FontStyle; 
@property(strong,nonatomic)NSString* ForeColor;
@property(strong,nonatomic)NSString* OptionListItemId; 
@property(strong,nonatomic)NSString* CategoryListItemId; 
@property(strong,nonatomic)NSString* WithKnowledge; 
@property(strong,nonatomic)NSString* ImageTextShowMode; 
@property(strong,nonatomic)NSString* ImageTextPos;
@property(strong,nonatomic)NSString* MarkEndTime; 
@property(strong,nonatomic)NSString* IsOpenTextShowByDigit; 
@property(strong,nonatomic)NSString* OpenTextFractionNum; 
@property(strong,nonatomic)NSString* OpenTextPrefix; 
@property(strong,nonatomic)NSString* OpenTextPostfix;
@property(strong,nonatomic)NSString* ItemColWidth; 
@property(strong,nonatomic)NSString* TitleHasScript;
- (id)initWithXml:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral*) surveyLib;
@end
