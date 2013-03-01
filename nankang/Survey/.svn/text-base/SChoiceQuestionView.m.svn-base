//
//  SChoiceQuestionView.m
//  nankang
//
//  Created by 军锋 安 on 12-7-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SChoiceQuestionView.h"

@interface SChoiceQuestionView ()

@end

@implementation SChoiceQuestionView

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
    [self viewLoad];
	// Do any additional setup after loading the view.
}

-(void) viewLoad
{
    CGFloat _height = topHeight;
    NSMutableArray* qItem = m_question.qItems;
    int count = 0;
    for (Model_Item* item in qItem) {
        count++;
        UILabel* itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(45, _height, viewwidth-45, 40)];
        itemTitle.backgroundColor = [UIColor clearColor];
        itemTitle.font = selectFont;
        itemTitle.text = item.Title;
        UIButton* rbtn = [self getRadioButton];
        rbtn.frame = CGRectMake(10, _height+5, 30, 30);
        if([item.ItemAnswer.S isEqualToString:@"true"])
        {
            rbtn.selected=YES;
        }
        else {
            rbtn.selected=NO;
        }
        [rbtn setTag:count];
        [scrollView addSubview:rbtn];
        [scrollView addSubview:itemTitle];
        _height+=60;
    }
    scrollView.contentSize=CGSizeMake(viewwidth, _height+10); 
    [self.view addSubview:scrollView];
}
-(IBAction)checked:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSMutableArray* qItem = m_question.qItems;
    int count =0;
    for (Model_Item* item in qItem) {
        count++;
        item.ItemAnswer.S=@"false";
    }
    Model_Item* itemTemp =(Model_Item*)[qItem objectAtIndex:btn.tag-1];
    itemTemp.ItemAnswer.S=@"true";
    [self viewLoad];
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

@end
