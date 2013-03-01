//
//  QuestionBase.h
//  nankang
//
//  Created by 军锋 安 on 12-7-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Question.h"
#import "Model_Question+Item.h"
#import "Regular.h"
#import "PublicUtils.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UTSystemHelper.h"
#import "AppDelegate.h"
@interface QuestionBase : UIViewController<UIImagePickerControllerDelegate,AVAudioPlayerDelegate,AVAudioSessionDelegate,AVAudioRecorderDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    Model_Question* m_question;
    CGFloat         topHeight;
    NSMutableArray* answerQuestionList;
    UIFont*         selectFont;
    UIView*         view;
    CGFloat         viewheight;
    CGFloat         viewwidth;
    UIScrollView* scrollView;
    UIImageView* imageView ;
    int type;
    NSString* filpath;
    MPMoviePlayerController* moviePlayer;
    AVAudioPlayer *audioPlayer;
    AVAudioRecorder *audioRecorder;
}
@property(strong,nonatomic) MPMoviePlayerController* moviePlayer;
@property(strong,nonatomic)AVAudioPlayer* audioPlayer;
@property(strong,nonatomic)NSString* filepath;
@property(nonatomic,assign)int type;
@property(strong,nonatomic)Model_Question* m_question;
- (id)initWithQuestion:(Model_Question*)question list:(NSMutableArray*) list;
-(void)QuestionBaseNext;
-(UIButton*) getRadioButton;
-(UIButton*) getCheckBoxButton;
-(IBAction)playMP3:(id)sender;
-(IBAction)checked:(id)sender;
-(BOOL) canskip;
-(void) stoppaly;
@end
