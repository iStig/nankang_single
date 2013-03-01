//
//  SBlankQuestionView.m
//  nankang
//
//  Created by 军锋 安 on 12-7-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SBlankQuestionView.h"

@interface SBlankQuestionView ()

@end

@implementation SBlankQuestionView

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
    Model_Item* item = [qItem objectAtIndex:0];
    int prpo = [item.Prop intValue];
    if(prpo!=1)
    {
        UITextField* valueText = [[UITextField alloc]initWithFrame:CGRectMake(10, _height, viewwidth-20, 40)];
        [valueText setBorderStyle:UITextBorderStyleRoundedRect];
        [valueText setTag:1];
        valueText.text=item.ItemAnswer.V;
        [scrollView addSubview:valueText];
    }
    else {
        UITextView* valueText = [[UITextView alloc]initWithFrame:CGRectMake(10, _height, viewwidth-20, 300)];
        [valueText setTag:1];
        valueText.text=item.ItemAnswer.V;
        [scrollView addSubview:valueText];
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
    Model_Item* item = [qItem objectAtIndex:0];
    int prpo = [item.Prop intValue];
    if(prpo!=1)
    {
        UITextField* text = (UITextField*)[self.view viewWithTag:1];
        item.ItemAnswer.V=text.text;
    }
    for (Model_Item* item in qItem) {
        UITextView* text = (UITextView*)[self.view viewWithTag:1];
        item.ItemAnswer.V=text.text;
    }
}
@end
