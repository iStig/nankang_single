//
//  Survey.m
//  nankang
//
//  Created by 军锋 安 on 12-8-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SurveyManager.h"

@implementation SurveyManager
-(void)loadSurveyFromLocal:(NSString*)filepath
{
    reader = [[SurveyXMLReader alloc] init:filepath];
}
-(void)startSurvey:(UIView*)view surveyExcuteDelegate:(id)delegate
{
    questBaseView = [[QuestBaseViewController alloc] init];
    questBaseView.filepath = reader.m_filepath;
    questBaseView.mqlist =reader.m_QuestionList;
    questBaseView.type=0;
    questBaseView.delegate = delegate;
    questBaseView.welcome = reader.m_WelcomeSentence;
    questBaseView.quit = reader.m_QuitSentenceList;
    for (UIView* _view in view.subviews) {
        [_view removeFromSuperview];
    }
    questBaseView.view = view;
}
-(NSMutableArray*)getQuestionAnswer
{
    return questBaseView.answerQuestionList;
}
-(NSMutableArray*)getQuestionList
{
    return reader.m_QuestionList;
}
-(void) showQuestionAnswer:(NSMutableArray*) quesionList answer:(NSMutableArray*) answer delegate:(id)delegate view:(UIView*)view
{
    questBaseView = [[QuestBaseViewController alloc] init];
    questBaseView.mqlist =quesionList;
    questBaseView.answerQuestionList = answer;
    questBaseView.type=1;
    questBaseView.delegate = delegate;
    questBaseView.welcome = reader.m_WelcomeSentence;
    questBaseView.quit = reader.m_QuitSentenceList;
    for (UIView* _view in view.subviews) {
        [_view removeFromSuperview];
    }
    questBaseView.view = view;
}
-(void)backQuestion:(Model_Question*) question
{
    questBaseView.isAnswerSettingNull = [self getQuestionIndex:question];
    questBaseView.isAnswerIndex = [self getQuestionAnswerIndex:question];
    [questBaseView backQuestion];
}
-(int) getQuestionIndex:(Model_Question*) question
{
    int index = 0;
    for (Model_Question* temp in reader.m_QuestionList) {
        if([temp.Id isEqualToString:question.Id])
        {
            break;
        }
        index++;
    }
    return index;
}
-(int) getQuestionAnswerIndex:(Model_Question*) question
{
    int index = 0;
    for (Model_Question* temp in questBaseView.answerQuestionList) {
        if([temp.Id isEqualToString:question.Id])
        {
            break;
        }
        index++;
    }
    return index;
}
@end
