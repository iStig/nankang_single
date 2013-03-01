//
//  SurveyXMLReader.h
//  nankang
//
//  Created by 军锋 安 on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"
#import "XmlConvert.h"
#import "SurveyLibraryLiteral.h"
#import "Model_Survey.h"
#import "Model_Sentence.h"
#import "Model_Variable.h"
#import "Model_Option.h"
#import "Model_SubSurvey.h"
#import "Model_Section.h"
#import "Model_Question.h"
#import "Model_GreetingQuestion.h"
#import "Model_ScriptQuestion.h"
#import "Model_SBlankQuestion.h"
#import "Model_MBlankQuestion.h"
#import "Model_SChoiceQuestion.h"
#import "Model_MChoiceQuestion.h"
#import "Model_MChoiceOrderQuestion.h"
#import "Model_SFormQuestion.h"
#import "Model_MFormQuestion.h"
#import "Model_BFormQuestion.h"
#import "Model_ThreeSFormQuestion.h"
#import "Model_ThreeMFormQuestion.h"
#import "Model_ThreeBFormQuestion.h"
#import "Model_Question+Item.h"
@interface SurveyXMLReader : NSObject
{
    SurveyLibraryLiteral*   surveyObject;
    Model_Survey*           m_Survey;//原始问卷
    Model_Sentence*         m_WelcomeSentence;
    NSMutableArray*         m_QuitSentenceList;
    NSMutableArray*         m_VariableList;
    NSMutableArray*         m_OptionList;
    Model_Survey*           m_OrderSurvey;//抽取并排序后问卷
    NSMutableArray*         m_QuestionList;
    NSString*               m_filpath;
}
@property(strong,nonatomic)NSString*                m_filepath;
@property(strong,nonatomic)NSMutableArray*         m_QuestionList;
@property(strong,nonatomic)SurveyLibraryLiteral*    surveyObject;
@property(strong,nonatomic)Model_Survey*            m_Survey;
@property(strong,nonatomic)Model_Sentence*          m_WelcomeSentence;
@property(strong,nonatomic)NSMutableArray*          m_QuitSentenceList;
@property(strong,nonatomic)NSMutableArray*          m_VariableList;
@property(strong,nonatomic)NSMutableArray*          m_OptionList;
@property(strong,nonatomic)Model_Survey*           m_OrderSurvey;
- (NSMutableArray*)initSectionWithXml:(DDXMLElement *)node;
- (NSMutableArray*)initQuestionWithXml:(DDXMLElement *)node;
-(id) init:(NSString*)fileName;
@end
