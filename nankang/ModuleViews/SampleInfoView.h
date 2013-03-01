//
//  SettingsView.h
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class NKSample;

@interface SampleInfoView : UIControl<UITextFieldDelegate,UIPopoverControllerDelegate>
{
  RootViewController*rootview;
    
 
    UIViewController* viewc;
    NKSample*sample;//待显示概况的样本
    IBOutlet UIButton *btn,*btt;
    IBOutlet UILabel *lab1,*lab2;
    IBOutlet UILabel *labwl1,*label2,*label3,*label4,*label5,*label6;
    IBOutlet UITextField *text1,*text2,*text3;
    IBOutlet UIButton *bttt;
    IBOutlet UIView *viewt;
    
    UIPopoverController* popo;
    

    
    UIView *viewback;
}
-(void)refreshView;

@property(retain,nonatomic) RootViewController*rootview;
@property(retain,nonatomic)   NKSample*sample;

@end
