//
//  Survey.h
//  nankang
//
//  Created by 军锋 安 on 12-8-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SurveyXMLReader.h"
#import "QuestBaseViewController.h"
#import "Model_Question.h"
@interface SurveyManager : NSObject
{
    SurveyXMLReader* reader;
    QuestBaseViewController* questBaseView;
}
-(void)loadSurveyFromLocal:(NSString*)filepath;
-(void)startSurvey:(UIView*)view surveyExcuteDelegate:(id)delegate;
-(NSMutableArray*)getQuestionAnswer;
-(NSMutableArray*)getQuestionList;
-(void) showQuestionAnswer:(NSMutableArray*) quesionList answer:(NSMutableArray*) answer delegate:(id)delegate view:(UIView*)view;
-(void)backQuestion:(Model_Question*) question;

@end
