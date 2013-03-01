//
//  LoginViewController.h
//  nankang
//
//  Created by xudong jin on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
  IBOutlet UIButton *mLoginBtn;
  IBOutlet UITextField*mUsername;
  IBOutlet UITextField*mPassword;
  IBOutlet UITextField*mOrgn;
  IBOutlet UIButton *bnow;
  IBOutlet UIActivityIndicatorView*progress;
  IBOutlet  UIButton *sece,*btnnow;
    

}
-(IBAction)login:(id)sender;
- (IBAction) textFieldDoneEditing:(id)sender;
// 保存用户名、密码选项
- (IBAction) checkbox:(id)sender;
// 背景点击收键盘
- (IBAction) backgroundTap:(id)sender;


-(IBAction)settingsClicked:(id)sender;
-(IBAction)themesClicked:(id)sender;
-(IBAction)registClicked:(id)sender;
-(IBAction)aboutClicked:(id)sender;
-(IBAction)updateClicked:(id)sender;
@end
