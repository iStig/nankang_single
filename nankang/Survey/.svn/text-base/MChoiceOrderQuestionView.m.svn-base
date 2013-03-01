//
//  MChoiceOrderQuestionView.m
//  nankang
//
//  Created by 军锋 安 on 12-9-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MChoiceOrderQuestionView.h"

@interface MChoiceOrderQuestionView ()

@end

@implementation MChoiceOrderQuestionView

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
    array = [[NSMutableArray alloc] init];
    NSMutableArray* qItem = m_question.qItems;
    for (Model_Item* item in qItem) {
        if(item.ItemAnswer.S==NULL)
        {
            item.ItemAnswer.S=@"false";
        }
    }
    selectText = [[UITextField alloc] init];
    [selectText setBorderStyle:UITextBorderStyleRoundedRect];
    UILabel* selectLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 160, 30)];
    selectLab.font = selectFont;
    selectLab.text=@"您的选择顺序 ";
    selectLab.textColor = [UIColor blueColor]; 
    selectText.leftView=selectLab;
    selectText.leftViewMode= UITextFieldViewModeAlways;
    [self viewLoad];
    selectText.text = m_question.selectOrder;
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
        UIButton* rbtn = [self getCheckBoxButton];
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
    selectText.font=selectFont;
    selectText.frame = CGRectMake(10, _height+30, viewwidth-20, 40);
    [scrollView addSubview:selectText];
    scrollView.contentSize=CGSizeMake(viewwidth, _height+30+40); 
    [self.view addSubview:scrollView];
    [self setSelectText];
}
-(IBAction)checked:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    NSMutableArray* qItem = m_question.qItems;
    Model_Item* itemTemp =(Model_Item*)[qItem objectAtIndex:btn.tag-1];
    NSString* strTemp = btn.selected==YES?@"false":@"true";
    if([strTemp isEqual:@"true"])
    {
        [array addObject:itemTemp.Index];
    }
    else 
    {
        for (NSString* str in array) {
            if ([str isEqual:itemTemp.Index]) {
                [array removeObject:str];
                break;
            }
        }
    }
    itemTemp.ItemAnswer.S=strTemp;
    [self setSelectText];
    [self viewLoad];
}
-(void) setSelectText
{
    NSString* temp=@"";
    int count=0;
    for (NSString* str in array) {
        count++;
        temp=[NSString stringWithFormat:@"%@,%@",temp,str];
        for (Model_Item *item in m_question.qItems) {
            if([item.Index isEqualToString:str])
            {
                item.ItemAnswer.SelectOrder=count;   
                break;
            }
        }
    }
    if([temp length]>0)
    {
        temp = [[temp substringFromIndex:1] substringToIndex:[temp length]-1];
    }
    selectText.text=temp;
    m_question.selectOrder=temp;
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
