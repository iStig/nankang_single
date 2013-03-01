//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "ExportView.h"
#import "UTSystemHelper.h"
#import "Publicdef.h"
@implementation ExportView
@synthesize rootview,boolmes,boolima,boolvoi;
- (id)initWithFrame:(CGRect)frame
{
  self = [[[NSBundle mainBundle] loadNibNamed:@"ExportView" owner:nil options:nil] objectAtIndex:0];
  if (self) {
    // Initialization code
    self.frame=frame;
  
    UIButton*btnclosed=[self viewWithTag:1];
    [btnclosed addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
    
      
          
      
  }

  return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (IBAction) selectbtn:(id)sender{
    
    
    
    if ([sender tag] == 1){
        if (btn1.selected !=YES) {
            [btn1 setSelected:YES];
            [btn2 setSelected:YES];
            [btn3 setSelected:YES];
            [btn4 setSelected:YES];
            boolall=YES;
          boolima=YES;
          boolmes=YES;
          boolvoi=YES;
        }
        else {
            [btn1 setSelected:NO];
            [btn2 setSelected:NO];
            [btn3 setSelected:NO];
            [btn4 setSelected:NO];
            boolall=NO;
          boolima=NO;
          boolmes=NO;
          boolvoi=NO;
        }
    }
    if ([sender tag] == 2){
        if (btn1.selected ==YES) {
            [btn1 setSelected:NO];
            
        }
        if (btn2.selected ==YES) {
             [btn2 setSelected:NO];
            boolmes=NO;
        }
        else {
            [btn2 setSelected:YES];
            boolmes=YES;
        }
    }
    if ([sender tag] == 3){
        if (btn1.selected ==YES) {
            [btn1 setSelected:NO];
        }

        if (btn3.selected ==YES) {
            [btn3 setSelected:NO];
            boolima=NO;
        }
        else {
            [btn3 setSelected:YES];
            boolima=YES;
        }   
    }
    
    if ([sender tag] == 4){
        if (btn1.selected ==YES) {
            [btn1 setSelected:NO];
        }

        if (btn4.selected ==YES) {
            [btn4 setSelected:NO];
            boolvoi=NO;
        }
        else {
            [btn4 setSelected:YES];
            boolvoi=YES;
        }
    }
    
    if (btn2.selected ==YES && btn3.selected ==YES && btn4.selected ==YES) {
        [btn1 setSelected:YES];
    }
    
    
    
    
}

- (IBAction)sure:(id)sender{
    if (boolima==NO && boolmes==NO && boolvoi==NO && boolall ==NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告提示" message:@"请选择需要导出/传输的数据" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
        
        [alert show];
    }
    else {
        self.hidden=YES;
      [UTSystemHelper saveCstSettingsWithValue:(boolima?@"Y":@"N") forKey:Export_Image];
      [UTSystemHelper saveCstSettingsWithValue:(boolvoi?@"Y":@"N") forKey:Export_Media];
    
      [UTSystemHelper saveCstSettingsWithValue:(boolmes?@"Y":@"N") forKey:Export_Survey];
      
        [rootview modualViewClosed:self];

    }
       
    
}



-(void)setHidden:(BOOL)hidden
{
  if (!hidden) {
   
  }
  [super setHidden:hidden];
}
#pragma mark-
#pragma  mark TableView delegate
-(void)closeView:(id)sender{
  
  self.hidden=YES;
  //[rootview modualViewClosed:self];
  
  
}
@end
