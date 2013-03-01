//
//  QuestionBase.m
//  nankang
//
//  Created by 军锋 安 on 12-7-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "QuestionBase.h"

@interface QuestionBase ()

@end

@implementation QuestionBase
@synthesize m_question,type,filepath,audioPlayer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithQuestion:(Model_Question*)question list:(NSMutableArray*) list
{
    if(self= [super init])
    {
        selectFont = [UIFont fontWithName:@"Helvetica" size:25];
        answerQuestionList = list;
        m_question =[question copy] ;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self InitExpression];
    self.view.frame = CGRectMake(0, 0, 789, 550);
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];
    viewheight=550;
    viewwidth=789;
    m_question = [m_question retain];
    NSString* tempTitle =[NSString stringWithFormat:@"%@  %@:",m_question.Identity,m_question.Title];
    UIFont* myfont = [UIFont fontWithName:@"Helvetica" size:25];
    CGSize textsize = [tempTitle sizeWithFont:myfont constrainedToSize:CGSizeMake(viewwidth, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    UILabel* labTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, textsize.width, textsize.height)];
    labTitle.backgroundColor = [UIColor clearColor];
    labTitle.numberOfLines = textsize.height/20+1;
    labTitle.font = myfont;
    labTitle.text =tempTitle;
    topHeight = textsize.height+10;
    [scrollView addSubview:labTitle];
    
    
    BOOL isMediaOrAudio = NO;
    //添加录音按钮
    if([[m_question.NeedRecord lowercaseString] isEqualToString:@"true"])
    {
        UIButton* btn_audio = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_audio setTag:30000];
        btn_audio.frame = CGRectMake(110,topHeight, 175, 40);
        [btn_audio setTitle:@"录音" forState:UIControlStateNormal];
        [btn_audio setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_audio setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        btn_audio.font = [UIFont fontWithName:@"Helvetica" size:25];
        [btn_audio setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn_audio addTarget:self action:@selector(audioCopy:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn_audio];
        isMediaOrAudio = YES;
    }
    //添加录制视频按钮
    if([[m_question.QuestionMediaRecordPolicy lowercaseString] isEqualToString:@"true"])
  {
        UIButton* btn_media = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_media setTag:40000];
        btn_media.frame = CGRectMake(300,topHeight, 175, 40);
        [btn_media setTitle:@"录视频" forState:UIControlStateNormal];
        [btn_media setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_media setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        btn_media.font = [UIFont fontWithName:@"Helvetica" size:25];
        [btn_media setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn_media addTarget:self action:@selector(mediaCopy:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn_media];
        isMediaOrAudio = YES;
    }
    if(isMediaOrAudio)
    {
        topHeight+=45;
    }
    
    if([m_question.QuestionPhotoPolicy intValue]==1)
    {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"照片占位图片"]];
        imageView.frame = CGRectMake(10, topHeight, 500, 350);
        topHeight+=370;
        [scrollView addSubview:imageView];
        
        UIButton* photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        photoBtn.frame = CGRectMake(600, (topHeight-10)*0.5-40, 160, 160);
        [photoBtn setBackgroundImage:[UIImage imageNamed:@"拍照图标"] forState:UIControlStateNormal];
        UILabel* labPhoto = [[UILabel alloc] initWithFrame:CGRectMake(660, (topHeight-10)*0.5+120, 60, 30)];
        labPhoto.font = selectFont;
        labPhoto.backgroundColor=[UIColor clearColor];
        labPhoto.text=@"拍照";
        labPhoto.textColor=[UIColor blackColor];
        [scrollView addSubview:labPhoto];
        if(type==0)
        {
            [photoBtn addTarget:self action:@selector(addPicEvent) forControlEvents:UIControlEventTouchUpInside];
        }
        [scrollView addSubview:photoBtn];
    }
    if([m_question.questionMedia.FilePath length]>0 && [m_question.questionMedia.MediaFormat isEqualToString:@"1"])
    {
        UIImage* img = [UIImage imageNamed:@"影片占位图片"];
        UIImageView* image_temp = [[UIImageView alloc] initWithImage:img];
        image_temp.frame = CGRectMake(10, topHeight, 500, 350);
        topHeight+=350;
        [scrollView addSubview:image_temp];

        UIButton* btn_star = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_star setTag:10000];
        btn_star.frame = CGRectMake(150,topHeight, 50, 30);
        [btn_star setTitle:@"播放" forState:UIButtonTypeCustom];
        [btn_star addTarget:self action:@selector(playMP3:) forControlEvents:UIControlEventTouchUpInside];
        [btn_star setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_star setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIButton* btn_pause = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_pause setTag:10001];
        btn_pause.frame = CGRectMake(240,topHeight, 50, 30);
        [btn_pause setTitle:@"暂停" forState:UIControlStateNormal];
        [btn_pause addTarget:self action:@selector(playMP3:) forControlEvents:UIControlEventTouchUpInside];
        [btn_pause setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_pause setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIButton* btn_stop = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_stop setTag:10002];
        btn_stop.frame = CGRectMake(340,topHeight, 50, 30);
        [btn_stop setTitle:@"停止" forState:UIControlStateNormal];
        [btn_stop addTarget:self action:@selector(playMP3:) forControlEvents:UIControlEventTouchUpInside];
        [btn_stop setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_stop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        topHeight +=30;
        [scrollView addSubview:btn_star];
        [scrollView addSubview:btn_pause];
        [scrollView addSubview:btn_stop];
    }
    else if([m_question.questionMedia.FilePath length]>0 && [m_question.questionMedia.MediaFormat isEqualToString:@"2"])
    {
        UIImage* img = [UIImage imageNamed:@"影片占位图片"];
        UIImageView* image_temp = [[UIImageView alloc] initWithImage:img];
        image_temp.frame = CGRectMake(10, topHeight, 500, 350);
        topHeight+=350;
        [scrollView addSubview:image_temp];
        UIButton* btn_star = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_star setTag:20000];
        btn_star.frame = CGRectMake(150,topHeight, 50, 30);
        [btn_star setTitle:@"播放" forState:UIControlStateNormal];
        [btn_star addTarget:self action:@selector(playMP3:) forControlEvents:UIControlEventTouchUpInside];
        [btn_star setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_star setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIButton* btn_pause = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_pause setTag:20001];
        btn_pause.frame = CGRectMake(240,topHeight, 50, 30);
        [btn_pause setTitle:@"暂停" forState:UIControlStateNormal];
        [btn_pause addTarget:self action:@selector(playMP3:) forControlEvents:UIControlEventTouchUpInside];
        [btn_pause setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_pause setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIButton* btn_stop = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_stop setTag:20002];
        btn_stop.frame = CGRectMake(340,topHeight, 50, 30);
        [btn_stop setTitle:@"停止" forState:UIControlStateNormal];
        [btn_stop addTarget:self action:@selector(playMP3:) forControlEvents:UIControlEventTouchUpInside];
        [btn_stop setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [btn_stop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        topHeight +=30;
        [scrollView addSubview:btn_star];
        [scrollView addSubview:btn_pause];
        [scrollView addSubview:btn_stop];
    }
    else if([m_question.questionMedia.FilePath length]>0 && [m_question.questionMedia.MediaFormat isEqualToString:@"0"])
    {
        NSString* filepath_temp = filepath.copy;
        NSArray* oldarr = [filepath_temp componentsSeparatedByString:@"/"];
        NSArray* newarr = [m_question.questionMedia.FilePath.copy componentsSeparatedByString:@"\\"];
        filepath_temp = [filepath_temp stringByReplacingOccurrencesOfString:[oldarr objectAtIndex:[oldarr count]-1] withString:@""];
        NSString* filename =[NSString stringWithFormat:@"%@%@",filepath_temp,[newarr objectAtIndex:[newarr count]-1]];
        UIImage* img = [[UIImage alloc] initWithContentsOfFile:filename];
        UIImageView* image_temp = [[UIImageView alloc] initWithImage:img];
        image_temp.frame = CGRectMake(10, topHeight, 500, 350);
        topHeight+=350;
        [scrollView addSubview:image_temp];
    }
	// Do any additional setup after loading the view.
}
-(IBAction)audioCopy:(id)sender
{
    UIButton* btn_audio = (UIButton*)sender;
    if(btn_audio.tag==30000)
    {
        [btn_audio setTitle:@"停止" forState:UIControlStateNormal];
        NSString* file_name = [UTSystemHelper getMediaFileName:0 index:0];//[self gen_uuid];
        NSString* path = [PublicUtils getCurrentUserStoreagePath:@""];
        NSString* url = [NSString stringWithFormat:@"%@/%@.caf",path,file_name];
        btn_audio.tag=30001;
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        audioSession.delegate = self;
        [audioSession setActive: YES error: nil];
        audioRecorder.delegate = self;
		NSError *error;
        NSURL *fullurl = [NSURL fileURLWithPath:url];
        audioRecorder = [[AVAudioRecorder alloc] initWithURL:fullurl settings:nil error:&error];
        //开始录音
		if (audioRecorder) {        
			[audioRecorder prepareToRecord];        
			audioRecorder.meteringEnabled = YES;        
            [audioRecorder peakPowerForChannel:0];
			[audioRecorder record]; 
        }
        m_question.mediaURL=url;
        m_question.mediaType = 0;
    }
    else 
    {
        [btn_audio setTitle:@"录音" forState:UIControlStateNormal];
        [audioRecorder stop];
        btn_audio.tag=30000;
    }
}
-(IBAction)mediaCopy:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.mediaTypes = temp_MediaTypes;
        picker.delegate = self;
        picker.allowsImageEditing = YES;    
    }
    
    [self presentModalViewController:picker animated:YES];
    [picker release];
}

//录制视频


//下面两个函数是遵守 UIImagePickerControllerDelegate这个协议所实现的类.这样就能够完整的实现,获取照片或者视频,然后写入文件的过程.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    if([mediaType isEqualToString:@"public.image"])
    {
        UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        imageView.image=image;
        NSData* imgData = UIImagePNGRepresentation(image);
        NSString* img_name =[UTSystemHelper getMediaFileName:1 index:0] ;//[self gen_uuid];
        NSString* path = [PublicUtils getCurrentUserStoreagePath:@""];
        NSString* videoFile = [NSString stringWithFormat:@"%@/%@.jpg",path,img_name];
        [PublicUtils saveFileToLocal:[NSString stringWithFormat:@"%@.jpg",img_name] file:imgData];
        m_question.mediaType = 1;
        m_question.mediaURL = videoFile;
    }
    if([mediaType isEqualToString:@"public.movie"]){
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        NSData *videoData = [NSData dataWithContentsOfURL:videoURL];
        
        NSString* file_name =[UTSystemHelper getMediaFileName:2 index:[PublicUtils getIndex]] ;//[self gen_uuid];
        NSString* path = [PublicUtils getCurrentUserStoreagePath:@""];
        NSString* videoFile = [NSString stringWithFormat:@"%@/%@.mp4",path,file_name];

        success = [fileManager fileExistsAtPath:videoFile];
        if(success) {
            success = [fileManager removeItemAtPath:videoFile error:&error];
        }
        [videoData writeToFile:videoFile atomically:YES];
        m_question.mediaType = 2;
        m_question.mediaURL = videoFile;
    }
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}
//录制视频结束

-(IBAction)playMP3:(id)sender 
{
    UIButton* btn_temp = (UIButton*)sender;
    if(btn_temp.tag==10000)
    {
        NSString* filepath_temp = filepath.copy;
        NSArray* oldarr = [filepath_temp componentsSeparatedByString:@"/"];
        NSArray* newarr = [m_question.questionMedia.FilePath.copy componentsSeparatedByString:@"\\"];
        filepath_temp = [filepath_temp stringByReplacingOccurrencesOfString:[oldarr objectAtIndex:[oldarr count]-1] withString:@""];
        NSString* filename =[NSString stringWithFormat:@"%@%@",filepath,[newarr objectAtIndex:[newarr count]-1]];
        //NSString* filename =[NSString stringWithFormat:@"%@%@",filepath_temp,@"搁浅.mp3"];
        NSLog(@"%@",filename);
        NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:filename];
        NSData* data = [NSData dataWithContentsOfURL:fileURL];
        if(data&&!audioPlayer)
        {
            [self playBackgroundSoundEffect:data];
        }
    }
    if(btn_temp.tag==10001)
    {
        [audioPlayer pause];
    }
    if(btn_temp.tag==10002)
    {
        [audioPlayer stop];
    }
    
    if(btn_temp.tag==20000)
    {
        NSString* filepath_temp = filepath.copy;
        NSArray* oldarr = [filepath_temp componentsSeparatedByString:@"/"];
        NSArray* newarr = [m_question.questionMedia.FilePath.copy componentsSeparatedByString:@"\\"];
        filepath_temp = [filepath_temp stringByReplacingOccurrencesOfString:[oldarr objectAtIndex:[oldarr count]-1] withString:@""];
        NSString* filename =[NSString stringWithFormat:@"%@%@",filepath_temp,[newarr objectAtIndex:[newarr count]-1]];
        NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:filename];
        moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
        moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        [[moviePlayer view] setFrame:CGRectMake(10, topHeight-380, 500, 350)];
        [scrollView addSubview:moviePlayer.view];
    }
    if(btn_temp.tag==20001)
    {
        [moviePlayer pause];
    }
    if(btn_temp.tag==20002)
    {
        [moviePlayer stop];
    }
    
}
- (void) playBackgroundSoundEffect:(NSData*)sound {
    [[AVAudioSession sharedInstance]
     setCategory:AVAudioSessionCategoryPlayback error:nil];
    // audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL  error:nil];
    audioPlayer = [[AVAudioPlayer alloc] initWithData:sound   error:nil];
    [audioPlayer setDelegate:self];
    [audioPlayer play];
}

- (void) addPicEvent 
{ 
    //先设定sourceType为相机，然后判断相机是否可用（ipod）没相机，不可用将sourceType设定为相片库 
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera; 
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) { 
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary; 
    }   
    UIImagePickerController *picker = [[UIImagePickerController alloc] init]; 
    picker.delegate = self; 
    picker.allowsEditing = YES; 
    picker.sourceType = sourceType; 
    [self presentModalViewController:picker animated:YES]; 
    [picker release]; 
} 
#pragma mark – 


-(NSString*) gen_uuid
{
    CFUUIDRef uuid_ref=CFUUIDCreate(NULL);
    CFStringRef uuid_string = CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString* uuid= [NSString stringWithString:(NSString*)uuid_string];
    CFRelease(uuid_string);
    return uuid;
}

-(void) InitExpression
{
    Regular* r = [[Regular alloc] init];
    r.m_list=answerQuestionList;
    for (Model_Expression* expression in m_question.InitExpressions) {
        NSString* temp_if = expression.Condition;
        NSMutableArray* arr = [r getIFBaiFen:temp_if];
        for (NSString* temp in arr) {
            NSString* str=[NSString stringWithFormat:@"%@", [[[AppDelegate getAppDelegate] getSampleValueForKey:@"city"] retain]];
            NSString* temp_sample = [[AppDelegate getAppDelegate] getSampleValueForKey:[temp stringByReplacingOccurrencesOfString:@"%" withString:@""]];
            temp_if = [temp_if stringByReplacingOccurrencesOfString:temp withString:temp_sample];
        }
        [r getIFArray:temp_if];
        NSLog(@"IF:%@",temp_if);
        NSLog(@"THEN:%@",expression.Statement);
    }
}
-(BOOL) canskip
{
    BOOL b_temp = false;
    if([[m_question.CanSkip lowercaseString] isEqualToString:@"true"])
    {
        m_question.mediaURL=@"";
        m_question.mediaType=-1;
        for (Model_Item *qitem in m_question.qItems) {
            b_temp = [self check:qitem.ItemAnswer];
            if(b_temp)
            {
                return b_temp;
            }
            
            for (Model_Item *aitem in qitem.aItems) {
                b_temp = [self check:aitem.ItemAnswer];
                if(b_temp)
                {
                    return b_temp;
                } 
                for (Model_Item *citem in aitem.cItems) {
                    b_temp = [self check:citem.ItemAnswer];
                    if(b_temp)
                    {
                        return b_temp;
                    } 
                }
            }
        } 
        return b_temp;
    }
    return true;
}
-(BOOL) check:(Model_Answer*)item
{
    if(item.V&&![@"" isEqualToString:item.V])
    {
        return true;
    }
    if(item.S&&[@"true" isEqualToString:item.S])
    {
        return true;
    }
    if(item.D&&[@"true" isEqualToString:item.D])
    {
        return true;
    }
    if(item.G&&[@"true" isEqualToString:item.G])
    {
        return true;
    }
    if(item.C&&![@"" isEqualToString:item.C])
    {
        return true;
    }
    if(item.R&&[@"true" isEqualToString:item.R])
    {
        return true;
    }
    if(item.SelectOrder>0)
    {
        return true;
    }
    return false;
}
-(void)QuestionBaseNext
{
    if(audioPlayer)
    {
        [audioPlayer stop];
    }
    if(moviePlayer)
    {
        [moviePlayer stop];
    }
}
-(IBAction)checked:(id)sender
{
    
}
-(UIButton*) getRadioButton
{
    UIButton* rbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rbutton setBackgroundImage:[UIImage imageNamed:@"单选框背景"] forState:UIControlStateNormal];
    [rbutton setBackgroundImage:[UIImage imageNamed:@"单选框点"] forState:UIControlStateSelected];
    if(type==0)
    {
        [rbutton addTarget:self action:@selector(checked:) forControlEvents:UIControlEventTouchUpInside];
    }
    //set the frame of the button to the size of the image (see note below)
    return rbutton;
}

-(UIButton*) getCheckBoxButton
{
    UIButton* rbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rbutton setBackgroundImage:[UIImage imageNamed:@"复选框背景"] forState:UIControlStateNormal];
    [rbutton setBackgroundImage:[UIImage imageNamed:@"复选框勾"] forState:UIControlStateSelected];
    if(type==0)
    {
        [rbutton addTarget:self action:@selector(checked:) forControlEvents:UIControlEventTouchUpInside];
    }
    //set the frame of the button to the size of the image (see note below)
    return rbutton;
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
-(void) stoppaly
{
    if(moviePlayer)
    {
        [moviePlayer stop];
    }
    if(audioPlayer)
    {
        [audioPlayer stop];
    }
}
-(void)dealloc
{
    [super dealloc];
    [moviePlayer release];
}
@end
