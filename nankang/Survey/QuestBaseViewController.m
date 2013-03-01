//
//  QuestBaseViewController.m
//  nankang
//
//  Created by 军锋 安 on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "QuestBaseViewController.h"

@interface QuestBaseViewController ()

@end

@implementation QuestBaseViewController
@synthesize mqlist,delegate,view,answerQuestionList,type,filepath,welcome,quit,isAnswerSettingNull,isAnswerIndex;
-(void)setView:(UIView *)surveyview
{
    isAnswerSettingNull = -1;
    [PublicUtils setIndexInit];
    [self initWelcom:surveyview];
}
-(void) initWelcom:(UIView *)surveyview
{
    if (view!=surveyview) {
        [view release];
        view=[surveyview retain];
        CGRect r = CGRectMake(0, 50, 790, 400);
        welcomeView = [[UIScrollView alloc] initWithFrame:r];
        NSString* tempTitle =[NSString stringWithFormat:@"%@",welcome.title];
        UIFont* myfont = [UIFont fontWithName:@"Helvetica" size:25];
        CGSize textsize = [tempTitle sizeWithFont:myfont constrainedToSize:CGSizeMake(690, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
        UILabel* labTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, textsize.width, textsize.height)];
        labTitle.backgroundColor = [UIColor clearColor];
        labTitle.numberOfLines = textsize.height/20+1;
        labTitle.font = myfont;
        labTitle.text =tempTitle;
        
         btn_star = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_star.frame = CGRectMake(307, 460, 175, 40);
        [btn_star setTitle:@"开  始" forState:UIControlStateNormal];
        [btn_star addTarget:self action:@selector(star:) forControlEvents:UIControlEventTouchUpInside];
        [btn_star setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_star setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        btn_star.font = [UIFont fontWithName:@"Helvetica" size:25];
        [btn_star setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [view addSubview:btn_star];
        [welcomeView addSubview:labTitle];
        welcomeView.contentSize=CGSizeMake(790, textsize.height); 
        [view addSubview:welcomeView];
        
    }
}
-(void) initQuit:(NSString*) quitId
{
    [view retain];
    if(viewController)
    {
        [viewController.view removeFromSuperview];
    }
    Model_Sentence* quit_sentence = nil;
    for (Model_Sentence* temp in quit) {
        if([[temp.ID lowercaseString] isEqualToString:[quitId lowercaseString]])
        {
            quit_sentence = temp;
        }
    }
    [labIndex removeFromSuperview];
    [pBtn removeFromSuperview];
    [nBtn removeFromSuperview];
    [progressBG removeFromSuperview];
    [progressView removeFromSuperview];
    
    CGRect r = CGRectMake(0, 50, 790, 400);
    quitView = [[UIScrollView alloc] initWithFrame:r];
    CGFloat _height=0;
    if(quit_sentence)
    {
        NSString* tempTitle =[NSString stringWithFormat:@"%@",quit_sentence.title];
        UIFont* myfont = [UIFont fontWithName:@"Helvetica" size:25];
        CGSize textsize = [tempTitle sizeWithFont:myfont constrainedToSize:CGSizeMake(630, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
        UILabel* labTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, textsize.width, textsize.height)];
        labTitle.backgroundColor = [UIColor clearColor];
        labTitle.numberOfLines = textsize.height/20+1;
        _height = textsize.height;
        labTitle.font = myfont;
        labTitle.text =tempTitle;
        [quitView addSubview:labTitle];
        welcomeView.contentSize=CGSizeMake(790, textsize.height); 
    }
    
     btn_stop = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_stop.frame = CGRectMake(307, 460, 175, 40);
    [btn_stop setTitle:@"结  束" forState:UIControlStateNormal];
    [btn_stop addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [btn_stop setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    [btn_stop setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    btn_stop.font = [UIFont fontWithName:@"Helvetica" size:25];
    [btn_stop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:btn_stop];
    [view addSubview:quitView];
}
-(IBAction) star:(id)sender
{
    [welcomeView removeFromSuperview];
    [btn_star removeFromSuperview];
    [self initLoad];
}
-(IBAction)stop:(id)sender
{
    [quitView removeFromSuperview];
    [btn_stop removeFromSuperview];
    [delegate surveyExcuteStatus:YES currentQIndex:-1];
}
-(void) initLoad
{
    if(!mqlist||[mqlist count]==0)
    {
        return ;
    }
    if (view) {
        [view retain];
        UIFont* customFont = [UIFont fontWithName:@"Helvetica" size:25];
        if(type==0)
        {
            answerQuestionList = [[NSMutableArray alloc] init];
        }
        //上一页 下一页
        pBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        pBtn.frame = CGRectMake(10, 555, 165, 40);;
        [pBtn setTitle:@"上一题" forState:UIControlStateNormal];
        [pBtn addTarget:self action:@selector(Previous:) forControlEvents:UIControlEventTouchUpInside];
        nBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [nBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [pBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        progressView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"进程条"]];
        progressView.frame=CGRectMake(190, 560,410, 30);
        progressBG=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"进程条背景"]];
        [view addSubview:progressView];
        [view addSubview:progressBG];
        [nBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        labIndex= [[UILabel alloc] initWithFrame:CGRectMake(355, 565, 100, 25)];
        labIndex.font = customFont;
        labIndex.backgroundColor = [UIColor clearColor];
        labIndex.textAlignment= UITextAlignmentCenter;
        [view addSubview:labIndex];
        nBtn.frame = CGRectMake(613, 555, 165, 40);
        [nBtn setTitle:@"下一题" forState:UIControlStateNormal];
        [nBtn addTarget:self action:@selector(Next:) forControlEvents:UIControlEventTouchUpInside];
        pBtn.font=customFont;
        nBtn.font=customFont;
        [view addSubview:pBtn];
        [view addSubview:nBtn];
        //第一题 最后一题
        //上一页 下一页
        
        index = 0;
        [self viewShow];
    }
}

#pragma mark - 显示
-(IBAction)Next:(id)sender
{
    if(type==0)
    {
        if(isAnswerSettingNull>=0)
        {
            [self funEmpty];
            isAnswerSettingNull=-1;
        }
    }
    if(viewController)
    {
        if(type==0){
            [viewController QuestionBaseNext];
            if(![viewController canskip])
            {
                [[AppDelegate getAppDelegate]alert:@"提示信息" message:@"本题不允许跳过"];
                return;
            }
            [viewController stoppaly];
            [answerQuestionList addObject:[viewController.m_question retain]]; 
        }
    }
    index++;
    [delegate surveyExcuteStatus:NO currentQIndex:index];
    if(index==[mqlist count])
    {
        nBtn.enabled=NO;
        [view addSubview:viewController.view];
         Model_Question* question = [mqlist objectAtIndex:index-1];
        [self initQuit:[question.QuotaFailedExpression lowercaseString]];
        return;
    }
    else {
        nBtn.enabled=YES;
    }
    [self viewShow];
}
-(IBAction)Previous:(id)sender
{
    [quitView removeFromSuperview];
    nBtn.enabled=YES;
    index--;
    [answerQuestionList removeObject:[answerQuestionList objectAtIndex:index]];
    [self viewShow];
}
-(void) viewShow
{
    if(viewController)
    {
        [viewController.view removeFromSuperview];
    }
    if(index==0)
    {
        pBtn.enabled=NO;
    }
    else {
        pBtn.enabled=YES;
    }
    [mqlist retain];
    Model_Question* question = [[mqlist objectAtIndex:index] retain];
    //显示选项
    
    if([question isKindOfClass:[Model_SBlankQuestion class]])
    {
        viewController = [[SBlankQuestionView alloc] initWithQuestion:[(Model_SBlankQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_MBlankQuestion class]])
    {
        viewController = [[MBlankQuestionView alloc] initWithQuestion:[(Model_MBlankQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_SChoiceQuestion class]])
    {
        viewController = [[SChoiceQuestionView alloc] initWithQuestion:[(Model_SChoiceQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_MChoiceQuestion class]])
    {
        viewController = [[MChoiceQuestionView alloc] initWithQuestion:[(Model_MChoiceQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_MChoiceOrderQuestion class]])
    {
        viewController = [[MChoiceOrderQuestionView alloc] initWithQuestion:[(Model_MChoiceOrderQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_SFormQuestion class]])
    {
        viewController = [[SFormQuestionView alloc] initWithQuestion:[(Model_SFormQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_MFormQuestion class]])
    {
        viewController = [[MFormQuestionView alloc] initWithQuestion:[(Model_MFormQuestion*)question retain] list:mqlist];
    }
    if([question isKindOfClass:[Model_BFormQuestion class]])
    {
        viewController = [[BFormQuestionView alloc] initWithQuestion:[(Model_BFormQuestion*)question retain] list:mqlist];
    }
    viewController.type=type;
    viewController.filepath = filepath;
    labIndex.text=[NSString stringWithFormat:@"%d/%d",index+1,[mqlist count]];
    if(index+1==[mqlist count])
    {
       progressBG.frame=CGRectMake(190, 560,410, 30);
    }
    else {
        progressBG.frame=CGRectMake(190, 560,410*((index+1.0)/[mqlist count]), 30);
    }
    [view addSubview:viewController.view];
}
-(void) backQuestion
{
    [welcomeView removeFromSuperview];
    [quitView removeFromSuperview];
    index = isAnswerSettingNull;
    [self viewShow];
}
-(void) funEmpty
{
    NSMutableArray* temp_list = [[NSMutableArray alloc] init];
    for (int i=0;i<[answerQuestionList count];i++) {
        if(i<isAnswerIndex)
        {
            [temp_list addObject:[answerQuestionList objectAtIndex:i]];
        }
    }
    answerQuestionList = temp_list;
    for (int i=0; i<[mqlist count];i++) {
        if(i>isAnswerSettingNull)
        {
            Model_Question* questTemp = [mqlist objectAtIndex:i];
            questTemp.mediaURL=@"";
            questTemp.mediaType=-1;
            for (Model_Item *qitem in questTemp.qItems) {
                [self check:qitem.ItemAnswer];
                for (Model_Item *aitem in qitem.aItems) {
                    [self check:aitem.ItemAnswer];
                    for (Model_Item *citem in aitem.cItems) {
                        [self check:citem.ItemAnswer];
                    }
                }
            }  
        } 
    }
}
-(void) check:(Model_Answer*)item
{
    item.C=@"";
    item.V=@"";
    item.S=@"";
    item.D=@"";
    item.V=@"";
    item.G=@"";
    item.R=@"";
    item.SelectOrder=0;
    item.Tip=@"";
}
@end
