//
//  QuestBaseViewController.h
//  nankang
//
//  Created by 军锋 安 on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurveyXMLReader.h"
#import "SBlankQuestionView.h"
#import "SChoiceQuestionView.h"
#import "QuestionBase.h"
#import "MChoiceQuestionView.h"
#import "SFormQuestionView.h"
#import "Model_Question.h"
#import "Model_Question+Item.h"
#import "MBlankQuestionView.h"
#import "MChoiceOrderQuestionView.h"
#import "MFormQuestionView.h"
#import "BFormQuestionView.h"
#import "AppDelegate.h"
#import "Model_Sentence.h"
@protocol NKSurveyExcuteDelegate<NSObject>

@required
-(void)surveyExcuteStatus:(BOOL)finished currentQIndex:(int) currentQIndex;

@end
@interface QuestBaseViewController : UIView
{
    NSMutableArray* mqlist;
    UIView*   view;
    UIButton* pBtn;
    UIButton* nBtn;
    UILabel* labIndex;
    int index;
    QuestionBase* viewController;
    NSMutableArray* answerQuestionList;
    int type;
    UIImageView* progressBG;
    UIImageView* progressView;
    id<NKSurveyExcuteDelegate> delegate;
    NSString* filepath;
    Model_Sentence* welcome;
    NSMutableArray* quit;
    
    UIScrollView* welcomeView;
    UIScrollView* quitView;
    
    int isAnswerSettingNull;
    int isAnswerIndex;
    
    UIButton* btn_star;
    UIButton* btn_stop;
}
@property(nonatomic,assign)int isAnswerIndex;
@property(nonatomic,assign)int index;
@property(nonatomic,assign) int isAnswerSettingNull;
@property(strong,nonatomic)NSMutableArray* quit;
@property(strong,nonatomic)Model_Sentence* welcome;
@property(strong,nonatomic)NSString*    filepath;
@property(nonatomic,assign)int type;
@property(strong,nonatomic)NSMutableArray* answerQuestionList;
@property(strong,nonatomic)UIView*   view;
@property(strong,nonatomic)NSMutableArray* mqlist;
@property(strong,nonatomic)id<NKSurveyExcuteDelegate> delegate;
-(IBAction)Next:(id)sender;
-(IBAction)Previous:(id)sender;
-(void) viewShow;
-(void) backQuestion;
@end
