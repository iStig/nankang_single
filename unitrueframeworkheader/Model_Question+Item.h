//
//  Model_QuestionItem.h
//  UnitrueFramework
//
//  Created by 军锋 安 on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Question.h"
#import "Model_Item.h"
@interface Model_Question (Model_QuestionItem)
-(NSMutableArray*) initQitems:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral *)surveyLib;
-(NSMutableArray*) initAitems:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral *)surveyLib;
-(NSMutableArray*) initCitems:(DDXMLElement *)node surveyLib:(SurveyLibraryLiteral *)surveyLib;
@end
