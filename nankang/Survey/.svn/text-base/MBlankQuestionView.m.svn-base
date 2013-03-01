//
//  MBlankQuestionView.m
//  nankang
//
//  Created by 军锋 安 on 12-9-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MBlankQuestionView.h"

@interface MBlankQuestionView ()

@end

@implementation MBlankQuestionView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat _height = topHeight;
    NSMutableArray* qItem = m_question.qItems;
    int count = 0;

    for (Model_Item* item in qItem) {
        count++;
        UILabel* itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, _height, viewwidth, 30)];
        itemTitle.backgroundColor = [UIColor clearColor];
        itemTitle.font = selectFont;
        itemTitle.text = item.Title;
        int prpo = [item.Prop intValue];
        [scrollView addSubview:itemTitle];
        if(prpo!=1)
        {
            UITextField* valueText = [[UITextField alloc]initWithFrame:CGRectMake(10, _height+30, viewwidth-20, 40)];
            [valueText setBorderStyle:UITextBorderStyleRoundedRect];
            [valueText setTag:count];
            valueText.text=item.ItemAnswer.V;
            [scrollView addSubview:valueText];
            _height+=90;
        }
        else {
            UITextView* valueText = [[UITextView alloc]initWithFrame:CGRectMake(10, _height+30, viewwidth-20, 300)];
            [valueText setTag:count];
            valueText.text=item.ItemAnswer.V;
            [scrollView addSubview:valueText];
            _height+=350;
        }
    }
    scrollView.contentSize=CGSizeMake(viewwidth, _height+10); 
    [self.view addSubview:scrollView];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void) QuestionBaseNext
{
    NSMutableArray* qItem = m_question.qItems;
    int count = 0;
    for (Model_Item* item in qItem) {
        count++;
        int prpo = [item.Prop intValue];
        if(prpo!=1)
        {
            UITextField* text = (UITextField*)[self.view viewWithTag:count];
            item.ItemAnswer.V=text.text;
        }
        else {
            UITextView* text = (UITextView*)[self.view viewWithTag:count];
            item.ItemAnswer.V=text.text;
        }
    }
}
@end
