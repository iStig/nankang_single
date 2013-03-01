//
//  BFormQuestionView.m
//  nankang
//
//  Created by 军锋 安 on 12-9-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BFormQuestionView.h"

@interface BFormQuestionView ()

@end

@implementation BFormQuestionView

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
    CGFloat _w=160;
    for (Model_Item* item in qItem) {
        count++;
        UILabel* itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, _height+35, 150, 30)];
        itemTitle.font = selectFont;
        itemTitle.text = item.Title;
        itemTitle.backgroundColor=[UIColor clearColor];
        [scrollView addSubview:itemTitle];
        _w=160;
        int jcount=0;
        for (Model_Item* selectItem in item.aItems) {
            jcount++;
            NSString* tempTitle =[NSString stringWithFormat:@"%@",selectItem.Title];
            UIFont* myfont = selectFont;
            CGSize textsize = [tempTitle sizeWithFont:myfont constrainedToSize:CGSizeMake(700, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
            if(count==1)
            {
                UILabel* labTitle = [[UILabel alloc] initWithFrame:CGRectMake(_w, topHeight, textsize.width, textsize.height)];
                labTitle.backgroundColor = [UIColor clearColor];
                labTitle.font = myfont;
                labTitle.text =tempTitle;
                [scrollView addSubview:labTitle];
            }
            UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(_w, _height+35, 100, 30)];
            [textField setTag:[[NSString stringWithFormat:@"%d%d",count,jcount] intValue]];
            textField.text=selectItem.ItemAnswer.V;
            [textField setBorderStyle:UITextBorderStyleRoundedRect];
            [scrollView addSubview:textField];
            
            _w=_w+textsize.width+15;
        }
        _height+=60;
    }
    scrollView.contentSize=CGSizeMake(_w, _height+10); 
    [self.view addSubview:scrollView];
}
-(void) QuestionBaseNext
{
    NSMutableArray* qItem = m_question.qItems;
    int count = 0;
    for (Model_Item* item in qItem) {
        count++;
        int jcount=0;
        for (Model_Item* selectItem in item.aItems) {
            jcount++;
            UITextField* textField = (UITextField*)[self.view viewWithTag:[[NSString stringWithFormat:@"%d%d",count,jcount] intValue]];
            selectItem.ItemAnswer.V =  textField.text.copy;
        }
    }
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
