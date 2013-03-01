//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "LoginViewController.h"
#import "BILayerClient.h"
#import "AppDelegate.h"
#import "AgentLoginResult.h"
#import "SettingsView.h"
#import "UTSystemHelper.h"
#import "Publicdef.h"

@implementation SettingsView
@synthesize rootview;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"SettingsView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
    self.frame=frame;

    UIButton*btnclosed=[self viewWithTag:1];
    [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
    
     
      
  }
    textf.text=[UTSystemHelper getCstSettingsByKey:IPAddress];    
  if (textf.text==nil) {
    textf.text=@"www.nkcai.com.cn";
  }
  
  return self;
}


- (IBAction) textFieldDoneEditing{
    [textf resignFirstResponder];   
    
}

- (IBAction)backgroundTap:(id)sender{
    [textf resignFirstResponder];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */




- (IBAction)sure:(id)sender{
     [textf resignFirstResponder];
 
   [UTSystemHelper saveCstSettingsWithValue:textf.text forKey:IPAddress];

    self.hidden=YES;
    if ([rootview respondsToSelector:@selector(modualViewClosed:)]) {
        [rootview modualViewClosed:self];
    }
    
    
    
    NSLog(@"%@", textf.text);
}





-(void)setHidden:(BOOL)hidden
{
   [textf resignFirstResponder];
  if (!hidden) {
    
  }
    NSLog(@"%@", textf.text);
  [super setHidden:hidden];
}
-(void)closeView:(id)sender{
  
  self.hidden=YES;
 // if ([rootview respondsToSelector:@selector(modualViewClosed:)]) {
 //    [rootview modualViewClosed:self];
 // }
 
  
  
}
@end
