//
//  LoginViewController.m
//  nankang
//
//  Created by xudong jin on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "BILayerClient.h"
#import "AppDelegate.h"
#import "AgentLoginResult.h"
#import "SettingsView.h"
#import "UTSystemHelper.h"
#import "Publicdef.h"
#import "ThemeView.h"
#import "StringResult.h"
#import "PathHelper.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
  
  // Do any additional setup after loading the view from its nib.
  
  
  mUsername.text=[UTSystemHelper getCstSettingsByKey:UserName];
  mPassword.text=[UTSystemHelper getCstSettingsByKey:Password];
  mOrgn.text=[UTSystemHelper getCstSettingsByKey:OrgName];
  
  
  progress.frame=CGRectMake(500, 300, 100, 60);
  progress.backgroundColor=[UIColor darkGrayColor];
  progress.contentMode=UIViewContentModeCenter;
  
  
  [(UIControl *)self.view addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventTouchDown];
  //mUsername.text=@"";
  //  mPassword.text=@"";
  //mOrgn.text=@"";
  
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationLandscapeRight==interfaceOrientation;
}



- (IBAction) checkbox:(id)sender{
  
  if (sece.selected == NO) {
    [sece setSelected:YES];
    
  }
  else {
    [sece setSelected:NO];        
  }
  
  [AppDelegate getAppDelegate].isLocalLogin=!sece.selected;
}

-(IBAction)login:(id)sender
{
  
 
  [mUsername resignFirstResponder];
  [mPassword resignFirstResponder];
  [mOrgn resignFirstResponder];
  
  
  if ([mUsername.text isEqualToString:@""]||[mUsername.text isEqualToString:nil]){
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请检查" message:@"用户名不能为空！请输入用户名" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [alert release];
    return;
  }
  //    [mUsername becomeFirstResponder];
  if ([mOrgn.text isEqualToString:@""] ||[mOrgn.text isEqualToString:nil]) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请检查" message:@"公司名不能为空！请输入公司名" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [alert release];
    //  [mOrgn becomeFirstResponder];
    return;
  }
  BOOL appkai=NO;
  
  [progress startAnimating];
  
  if (sece.selected == NO) {
    if ([AppDelegate getAppDelegate].users != nil) {
      for (int i =0; i<[AppDelegate getAppDelegate].users.count;i++) {
        
        
        // User *user=[[User alloc]init];
        User *user1=(User *)[[AppDelegate getAppDelegate].users objectAtIndex:i];
        
        
        if ([user1.username isEqualToString: mUsername.text] && [user1.companyCode isEqualToString: mOrgn.text]) {
          
          User *user=[[User alloc]init];
          user.username=[[NSString alloc]initWithFormat:@"%@", mUsername.text] ;
          user.password=[[NSString alloc]initWithFormat:@"%@", mPassword.text] ;
          user.companyCode=[[NSString alloc]initWithFormat:@"%@", mOrgn.text] ;
          
          [UTSystemHelper saveCstSettingsWithValue:mUsername.text forKey:UserName];
          [UTSystemHelper saveCstSettingsWithValue:mPassword.text forKey:Password];
          [UTSystemHelper saveCstSettingsWithValue:mOrgn.text forKey:OrgName];
          [[AppDelegate getAppDelegate]loginSucess:user];
          appkai = YES;
          [AppDelegate getAppDelegate].isLocalLogin=YES;
          [user release];
        }
      }
    }
    if (appkai) {
      return;
    }
    else {
      [progress stopAnimating];
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录失败" message: @"账号第一次登陆，请选择在线登陆" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
      [alert show];
      return;
      
    }
    
  }
  else {
    BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                             action:@selector(getRegisterClientDidReceive:obj:)];
    [advClient getRegisterClient];
    
  }
  
  
  
}


- (void)agentLoginDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  [progress stopAnimating];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  AgentLoginResult*resutl= [[AgentLoginResult alloc]initWithJsonDictionary:obj];
  
  
  
  if (resutl.result!=0) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录失败" message:resutl.msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    return;
  }   
  
  User *user=[[User alloc]init];
  user.username=[[NSString alloc]initWithFormat:@"%@", mUsername.text] ;
  user.password=[[NSString alloc]initWithFormat:@"%@", mPassword.text] ;
  user.companyCode=[[NSString alloc]initWithFormat:@"%@", mOrgn.text] ;
  user.uploadPath=[[NSString alloc]initWithFormat:@"%@", resutl.uploadPath] ;
  user.downloadPath=[[NSString alloc]initWithFormat:@"%@", resutl.downloadPath] ;
  user.inspectPath=[[NSString alloc]initWithFormat:@"%@", resutl.inspectPath] ;
  
  [UTSystemHelper saveCstSettingsWithValue:mUsername.text forKey:UserName];
  [UTSystemHelper saveCstSettingsWithValue:mPassword.text forKey:Password];
  [UTSystemHelper saveCstSettingsWithValue:mOrgn.text forKey:OrgName];
  [[AppDelegate getAppDelegate]loginSucess:user];
  [user release];
  
//  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
//                                                           action:@selector(getInspectStatusDidReceive:obj:)];
//  [advClient getInspectStatus:user.username companyCode:user.companyCode deviceType:@"2"];
//
  
}
//- (void)getInspectStatusDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
//{
//  if ([obj isKindOfClass:NSError .class]) {
//    return;
//  } 
//  NSString*result=obj;
//  [UTSystemHelper saveCstSettingsWithValue:[result isEqualToString:@"success"]?@"1":@"0" forKey:Monitor];
//  
//}
- (IBAction)backgroundTap:(id)sender{
  
  // When the user presses return, take focus away from the text field so that the keyboard is dismissed.       
  NSTimeInterval animationDuration = 0.30f;       
  [UIView beginAnimations:@"ResizeForKeyboard" context:nil];       
  [UIView setAnimationDuration:animationDuration];       
  CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);       
  self.view.frame = rect;
  [UIView commitAnimations];
  
  
  [mUsername resignFirstResponder];
  [mPassword resignFirstResponder];
  [mOrgn resignFirstResponder];

  
}



/*
 
 - (IBAction) textFieldDoneEditing:(id)sender{
 
 
 if (((UIView*)sender).tag==1000) {
 [mUsername resignFirstResponder];
 [mPassword becomeFirstResponder];
 }
 else if (((UIView*)sender).tag==1001) {
 [mPassword resignFirstResponder];
 [mOrgn becomeFirstResponder];
 }
 else
 {
 [sender resignFirstResponder];
 
 }
 
 
 }
 
 */

- (void)textFieldDone:(id)sender
{
  // When the user presses return, take focus away from the text field so that the keyboard is dismissed.       
  NSTimeInterval animationDuration = 0.30f;       
  [UIView beginAnimations:@"ResizeForKeyboard" context:nil];       
  [UIView setAnimationDuration:animationDuration];       
  CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);       
  self.view.frame = rect;
  [UIView commitAnimations];
  [mUsername resignFirstResponder];
  [mPassword resignFirstResponder];
  [mOrgn resignFirstResponder];
  
}



#pragma mark -
#pragma mark 解决虚拟键盘挡住UITextField的方法
- (void)keyboardWillShow:(NSNotification *)noti
{       
  //键盘输入的界面调整       
  //键盘的高度
  float height = 300.0;               
  CGRect frame = self.view.frame;       
  frame.size = CGSizeMake(frame.size.width, frame.size.height - height);       
  [UIView beginAnimations:@"Curl"context:nil];//动画开始         
  [UIView setAnimationDuration:0.30];          
  [UIView setAnimationDelegate:self];         
  [self.view setFrame:frame];        
  [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{       
  // When the user presses return, take focus away from the text field so that the keyboard is dismissed.       
  NSTimeInterval animationDuration = 0.30f;       
  [UIView beginAnimations:@"ResizeForKeyboard" context:nil];       
  [UIView setAnimationDuration:animationDuration];       
  CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);       
  self.view.frame = rect;
  [UIView commitAnimations];
  [textField resignFirstResponder];
  return YES;       
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{       
  CGRect frame = textField.frame;
  int offset = frame.origin.y + 850 - (self.view.frame.size.height - 300.0);//键盘高度216
  NSTimeInterval animationDuration = 0.30f;               
  [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];               
  [UIView setAnimationDuration:animationDuration];
  float width = self.view.frame.size.width;               
  float height = self.view.frame.size.height;   
  if(offset > 0)
  {
    CGRect rect = CGRectMake(offset, 0,width,height);               
    self.view.frame = rect;       
  }       
  [UIView commitAnimations];               
}




-(IBAction)settingsClicked:(id)sender
{
  SettingsView*mImportView=[[SettingsView alloc]initWithFrame:self.view.frame];
  mImportView.rootview=self;
  mImportView.hidden=NO;
  [self.view addSubview:mImportView];
}


-(IBAction)themesClicked:(id)sender
{
  ThemeView*mImportView=[[ThemeView alloc]initWithFrame:self.view.frame];
  mImportView.rootview=self;
  mImportView.hidden=NO;
  [self.view addSubview:mImportView];
}
- (void)getRegisterClientDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  [progress stopAnimating];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  NSString*result=obj;
  
  
  if ([result isEqualToString:@"1"]) {//
    [progress startAnimating];
    BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                             action:@selector(agentLoginDidReceive:obj:)];
    [advClient agentLogin:mUsername.text passWord:mPassword.text companyCode:mOrgn.text  deviceType:@"2"];
    
  }
  else {
    if ([result isEqualToString:@"-1"])
    {
      [[AppDelegate getAppDelegate]alert:@"获取设备注册情况失败，请重试" message:@""];
    }
    if ([result isEqualToString:@"0"])
    {
      [[AppDelegate getAppDelegate]alert:@"设备未注册，登陆失败" message:@""];
    }
    if ([result isEqualToString:@"2"])
    {
      [[AppDelegate getAppDelegate]alert:@"注册未审核，登陆失败" message:@""];
    }
    if ([result isEqualToString:@"3"])
    {
      [[AppDelegate getAppDelegate]alert:@"设备取消注册，登陆失败" message:@""];
    }
    if ([result isEqualToString:@"4"])
    {
      [[AppDelegate getAppDelegate]alert:@"设备注册已过期，登陆失败" message:@""];
    }
    
  }
  
}


-(IBAction)registClicked:(id)sender
{
  if ([mUsername.text isEqualToString:@""]||[mOrgn.text isEqualToString:@""]) {
    [[AppDelegate getAppDelegate]alert:@"请先输入用户名和公司名" message:@""];
    return;
  }
  //  [progress startAnimating];
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:nil];
  [advClient createRegisterClient:mUsername.text companyCode:mOrgn.text];
  [[AppDelegate getAppDelegate]alert:@"" message:@"已提交注册请求"];
  
}
-(IBAction)aboutClicked:(id)sender
{
  
}
-(void)clientVersionInfoDidReceive:(BILayerClient*)sender obj:(NSObject*)obj
{
  [progress stopAnimating];
  if ([obj isKindOfClass:NSError .class]) {
    NSError*error=obj;
    [[AppDelegate getAppDelegate]alert:@"出错提示！" message: [[error userInfo]valueForKey:@"NSLocalizedDescription"]];
    return;
  }
  StringResult*result=[[StringResult alloc]initWithJsonDictionary:obj];
  if (result.result==-1) {
    [[AppDelegate getAppDelegate]alert:@"" message:result.msg];
  }
  else {
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示消息" message:@"有新版本，是否要更新?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil] autorelease];
    // optional - add more buttons:
    alert.tag=2;
    [alert show];
  }
}
-(IBAction)updateClicked:(id)sender
{
  [progress startAnimating];
  progress.hidden=NO;
  BILayerClient*advClient = [[BILayerClient alloc] initWithTarget:self 
                                                           action:@selector(clientVersionInfoDidReceive:obj:)];
  
  [advClient getClientVersionInfo:@"2" resolutionType:0]; 
}
#pragma mark-
#pragma  mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
  if (buttonIndex==1) {
    
  }
}


@end
