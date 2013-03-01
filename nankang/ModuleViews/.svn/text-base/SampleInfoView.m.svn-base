//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "SampleInfoView.h"
#import "Project.h"
#import "NKSample.h"



@implementation SampleInfoView
@synthesize rootview,sample;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"SampleInfoView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
    self.frame=frame;
   
    UIButton*btnclosed=[self viewWithTag:1];
    [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
    viewback = [self viewWithTag:20];
           
      UIButton *btnsex = [self viewWithTag:33];
      [btnsex addTarget:self action:@selector(showActionSheet:forEvent:) forControlEvents:UIControlEventTouchUpInside];
  }
 
    
   [(UIControl *)viewback addTarget:self action:@selector(backgroundTap:) forControlEvents:UIControlEventTouchDown];
    

    
   
    
    return self;
}



-(void) showActionSheet:(id)sender forEvent:(UIEvent*)event {
    
    
    UIButton *btnsex = [self viewWithTag:33];
    
    UIView* view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    view.backgroundColor = [UIColor  colorWithRed:10.0/255.0 green:28.0/255.0 blue:74.0/255.0 alpha:1.0];
    //view.backgroundColor = [UIColor grayColor];
    
    UIButton *btwom = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 280, 50)];
    btwom.backgroundColor = [UIColor  clearColor];
    [btwom addTarget:self action:@selector(Womsex) forControlEvents:UIControlEventTouchUpInside];
    [btwom setTitle:@"女性" forState:UIControlStateNormal];
    [btwom setBackgroundImage:[UIImage imageNamed:@"按钮.png"] forState:UIControlStateNormal];
    //[btwom.titleLabel setTextColor:[UIColor  colorWithRed:115.0/255.0 green:115.0/255.0 blue:115.0/255.0 alpha:1.0]];
    [btwom.titleLabel setTextColor:[UIColor  grayColor]];
    
    UIButton *btman = [[UIButton alloc] initWithFrame:CGRectMake(10, 70, 280, 50)];
    btman.backgroundColor = [UIColor  clearColor];
    [btman addTarget:self action:@selector(Mansex) forControlEvents:UIControlEventTouchUpInside];
    [btman setTitle:@"男性" forState:UIControlStateNormal];
    [btman setBackgroundImage:[UIImage imageNamed:@"按钮.png"] forState:UIControlStateNormal];
    //[btman.titleLabel setTextColor:[UIColor  colorWithRed:115.0/255.0 green:115.0/255.0 blue:115.0/255.0 alpha:1.0]];
    [btman.titleLabel setTextColor:[UIColor  grayColor]];
    
    UIButton *btback = [[UIButton alloc] initWithFrame:CGRectMake(10, 130, 280, 50)];
    btback.backgroundColor = [UIColor  clearColor];
    [btback addTarget:self action:@selector(closesex) forControlEvents:UIControlEventTouchUpInside];
    [btback setTitle:@"取消" forState:UIControlStateNormal];
    [btback setBackgroundImage:[UIImage imageNamed:@"进程1.png"] forState:UIControlStateNormal];
    [btback.titleLabel setTextColor:[UIColor whiteColor]];
    
    
    viewc = [[UIViewController alloc] init];
    [viewc.view addSubview:view];
    [view addSubview:btwom];
    [view addSubview:btman];
    [view addSubview:btback];
    
    popo = [[UIPopoverController alloc] initWithContentViewController:viewc];
    popo.popoverContentSize = CGSizeMake(300, 200);
    [popo presentPopoverFromRect:CGRectMake(65, 0, 300, 200) inView:btnsex permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    return;
  }

- (void)Womsex{
    sample.sex = [NSString stringWithFormat:@"女性"];
    text3.text = [NSString stringWithFormat:@"%@",sample.sex];
}
- (void)Mansex{
    sample.sex = [NSString stringWithFormat:@"男性"];
    text3.text = [NSString stringWithFormat:@"%@",sample.sex];
}

-(void)closesex{
    [popo dismissPopoverAnimated:YES] ;
}


- (void)textFieldDone:(id)sender
{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.       
    NSTimeInterval animationDuration = 0.30f;       
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];       
    [UIView setAnimationDuration:animationDuration];       
    CGRect rect = CGRectMake(0.0f, 0.0f, viewback.frame.size.width, viewback.frame.size.height);       
     viewback.frame = rect;
    [UIView commitAnimations];
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];

    
}



#pragma mark -
#pragma mark 解决虚拟键盘挡住UITextField的方法
- (void)keyboardWillShow:(NSNotification *)noti
{       
    //键盘输入的界面调整       
    //键盘的高度
    float height = 300.0;               
    CGRect frame = viewback.frame;       
    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);       
    [UIView beginAnimations:@"Curl"context:nil];//动画开始         
    [UIView setAnimationDuration:0.30];          
    [UIView setAnimationDelegate:self];         
    [viewback setFrame:frame];        
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{       
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.       
    NSTimeInterval animationDuration = 0.30f;       
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];       
    [UIView setAnimationDuration:animationDuration];       
    CGRect rect = CGRectMake(0.0f, 100.0f, viewback.frame.size.width, viewback.frame.size.height);       
    viewback.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES;       
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{       
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 200 - (viewback.frame.size.height - 300.0);//键盘高度216
    NSTimeInterval animationDuration = 0.30f;               
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];               
    [UIView setAnimationDuration:animationDuration];
    float width = viewback.frame.size.width;               
    float height = viewback.frame.size.height;   
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0,-offset,width,height);               
        viewback.frame = rect;       
    }       
    [UIView commitAnimations];               
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(IBAction)selec:(id)sender{
    if (lab1.hidden == YES) {
        lab1.hidden=NO;
        lab2.hidden=YES;
    }
    else {
        lab1.hidden=YES;
        lab2.hidden= NO;
    }

}


- (IBAction) textFieldDoneEditing{
    
    sample.mobileTel =text2.text ;
    sample.name = text1.text;
      NSLog(@"====%@",sample.name);
    [text1 resignFirstResponder];   
    [text2 resignFirstResponder]; 
  
}

- (IBAction)backgroundTap:(id)sender{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.       
    NSTimeInterval animationDuration = 0.30f;       
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];       
    [UIView setAnimationDuration:animationDuration];       
    CGRect rect = CGRectMake(0.0f, 0.0f, viewback.frame.size.width, viewback.frame.size.height);       
    viewback.frame = rect;
    [UIView commitAnimations];
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
 
}


- (IBAction)sure:(id)sender{
    
    if (lab1.hidden==YES) {
        sample.sex = @"女";
    }else {
        sample.sex = @"男";
    }
     NSLog(@"====%@",sample.sex);
    sample.mobileTel =text2.text ;
    sample.name = text1.text;
    sample.sex = text3.text;
    NSLog(@"====%@",sample.name);
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
    [text3 resignFirstResponder];
    
    self.hidden=YES;

    [rootview modualViewClosed:self];

}


-(void)setHidden:(BOOL)hidden
{
  if (!hidden) {
      
    //刷新界面
      
      
      labwl1.text = [NSString stringWithFormat:@"  %@", sample.sampleId];
      if (sample.status == -2) {
          label2.text = [NSString stringWithFormat:@"  未接触"];
      }
      if (sample.status == -1) {
          label2.text = [NSString stringWithFormat:@"  访问中"];
      }
      if (sample.status == 50) {
          label2.text = [NSString stringWithFormat:@"  成功"];
      }
      if (sample.status == 52) {
          label2.text = [NSString stringWithFormat:@"  中途退出"];
      }
      if (sample.status == 51) {
          label2.text = [NSString stringWithFormat:@"  不成功"];
      }
      
      
      NSLog(@"%@",sample.sex);
      label3.text = [NSString stringWithFormat:@"  "];
      if (sample.sampleVisit ==nil) {
          label4.text = [NSString stringWithFormat:@"  0"];
      }
      else {
          label4.text = [NSString stringWithFormat:@"  1"];
      }
      
      

      
      //label5.text = [NSString stringWithFormat:@"  %@",sample.sampleVisit];
      //label6.text = [NSString stringWithFormat:@"  %@",sample.mobileTel];
      
      if (sample.mobileTel ==nil) {
          text2.text = [NSString stringWithFormat:@"请输入电话号码"];
          sample.mobileTel = text2.text;
      }
     
          
    
      if (sample.name ==nil) {
          text1.text = [NSString stringWithFormat:@"请输入姓名"];
          sample.name = text1.text;
      }
          
     text1.text = [NSString stringWithFormat:@"%@",sample.name];
     text2.text = [NSString stringWithFormat:@"%@",sample.mobileTel];
     text3.text = [NSString stringWithFormat:@"%@",sample.sex];
      NSLog(@"%@",sample.mobileTel);

      NSLog(@"====%@",sample.name);
     
  }
  [super setHidden:hidden];
}



-(void)closeView:(id)sender{
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
  self.hidden=YES;
  //[rootview modualViewClosed:self];

}
@end
