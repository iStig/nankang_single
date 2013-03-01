//
//  SFormQuestionView.m
//  nankang
//
//  Created by 军锋 安 on 12-7-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SFormQuestionView.h"

@interface SFormQuestionView ()

@end

@implementation SFormQuestionView

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
    for (Model_Item* item in m_question.qItems) {
        for (Model_Item* selectItem in item.aItems) {
            if(selectItem.ItemAnswer.S==NULL)
            {
                selectItem.ItemAnswer.S=@"false";
            }
        }
    }
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
        UILabel* itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, _height+45, 150, 30)];
        itemTitle.font = selectFont;
        itemTitle.text = item.Title;
        itemTitle.backgroundColor=[UIColor clearColor];
        [scrollView addSubview:itemTitle];
        CGFloat _w=160;
        int jcount=0;
        for (Model_Item* selectItem in item.aItems) {
            jcount++;
            NSString* tempTitle =[NSString stringWithFormat:@"%@",selectItem.Title];
            UIFont* myfont = selectFont;
            CGSize textsize = [tempTitle sizeWithFont:myfont constrainedToSize:CGSizeMake(700, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
            if(count==1)
            {
                UILabel* labTitle = [[UILabel alloc] initWithFrame:CGRectMake(_w-10, _height, textsize.width, textsize.height)];
                labTitle.backgroundColor = [UIColor clearColor];
                labTitle.font = myfont;
                labTitle.text =tempTitle;
                [scrollView addSubview:labTitle];
            }
            UIButton* rbtn = [self getRadioButton];
            rbtn.frame = CGRectMake(_w-25+textsize.width/2, _height+45, 30, 30);
            if([selectItem.ItemAnswer.S isEqualToString:@"true"])
            {
                rbtn.selected=YES;
            }
            else {
                rbtn.selected=NO;
            }
            [rbtn setTitle:[NSString stringWithFormat:@"%d-%d",count-1,jcount-1] forState:UIControlStateNormal];
            [rbtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
            [rbtn setTitleColor:[UIColor clearColor] forState:UIControlStateSelected];
            [scrollView addSubview:rbtn];
            _w=_w+textsize.width+15;
        }
        _height+=60;
    }
    scrollView.contentSize=CGSizeMake(viewwidth, _height+10); 
    [self.view addSubview:scrollView];
}
-(IBAction)checked:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSMutableArray* qItems = m_question.qItems;
    NSArray* textArray = [btn.titleLabel.text componentsSeparatedByString:@"-"];
    Model_Item* qitem = [qItems objectAtIndex:[[textArray objectAtIndex:0] intValue]];
    Model_Item* aitem = [qitem.aItems objectAtIndex:[[textArray objectAtIndex:1] intValue]];
    for (Model_Item* item in qitem.aItems) {
        item.ItemAnswer.S=@"false";
    }
    aitem.ItemAnswer.S=@"true";
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
