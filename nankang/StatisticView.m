//
//  SettingsView.m
//  nankang
//
//  Created by xudong jin on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import"RootViewController.h"
#import "StatisticView.h"
#import "Project.h"
@implementation StatisticView
@synthesize rootview,mProject;
- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"StatisticView" owner:nil options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
      self.frame=frame;
    
      lblProjectName=[self viewWithTag:1];
      btnAll=[self viewWithTag:2];
      btnPart=[self viewWithTag:3];
      [btnAll addTarget:self action:@selector(btnAllClicked:) forControlEvents:UIControlEventTouchUpInside];
      [btnPart addTarget:self action:@selector(btnPartClicked:) forControlEvents:UIControlEventTouchUpInside];
      lblTotal=[self viewWithTag:4];
      lblVisit=[self viewWithTag:5];
        lblSuccess=[self viewWithTag:6];
        lblfalse=[self viewWithTag:7];

        
        viewcon = [self viewWithTag:20];
        [viewcon addTarget:self action:@selector(background:) forControlEvents:UIControlEventTouchDown];
    }
    
    //visit=0;
    //successnum=0;
    //losingnum=0;
    
    
    viewtt.hidden=YES;
    btnAll.hidden=YES;
    btnPart.hidden=NO;
    picker1.hidden=YES;
    picker2.hidden=YES;
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
-(void)btnAllClicked:(id)sender
{
    btnAll.hidden=YES;
    btnPart.hidden=NO;
    
    viewtt.hidden= YES;
    picker1.hidden=YES;
    picker2.hidden =YES;
  
  int visit=0;
  int successnum=0;
  int losingnum=0;

    
    for (NKSample*sample in mProject.samples) {
        if (sample.status!=-2) {
            visit++;
        }
        if (sample.status==50) {
            successnum++;
        }
        if (sample.status!=-2&&sample.status!=50) {
            losingnum++;
        }
    }
    
    NSLog(@"====%d",visit);
    NSLog(@"====%d",successnum);
    NSLog(@"====%d",losingnum);
    lblVisit.text=[[NSString alloc]initWithFormat:@"%d",visit];
    lblSuccess.text=[[NSString alloc]initWithFormat:@"%d",successnum];
    lblfalse.text=[[NSString alloc]initWithFormat:@"%d",losingnum];

  
}

-(void)btnPartClicked:(id)sender
{

    btnPart.hidden=YES;
    btnAll.hidden=NO;
    
    viewtt.hidden= NO;
    picker1.hidden=YES;
    picker2.hidden =YES;
  
    

}

-(void)background:(id)sender{
    
    
    if (picker1.hidden == NO) {
        picker1.hidden =YES;
        
        NSDate *select = [picker1 date];  
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
        NSString *dateAndTime =  [dateFormatter stringFromDate:select];  
        
        labe1.text = [NSString stringWithFormat:@"       %@",dateAndTime];
        dateA = [[dateFormatter dateFromString:dateAndTime]retain];

    }
    
    if (picker2.hidden == NO) {
        picker2.hidden =YES;
        
        NSDate *select = [picker2 date];  
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
        NSString *dateAndTime =  [dateFormatter stringFromDate:select]; 
        labe2.text = [NSString stringWithFormat:@"       %@",dateAndTime];
        dateB = [[dateFormatter dateFromString:dateAndTime]retain];
        

    }

    
}

-(IBAction)searchground:(id)sender{
    
    
    if (picker1.hidden == NO) {
        picker1.hidden =YES;
        
        NSDate *select = [picker1 date];  
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
        NSString *dateAndTime =  [dateFormatter stringFromDate:select];  
        
        labe1.text = [NSString stringWithFormat:@"       %@",dateAndTime];
        dateA = [[dateFormatter dateFromString:dateAndTime]retain];
        
    }
    
    if (picker2.hidden == NO) {
        picker2.hidden =YES;
        
        NSDate *select = [picker2 date];  
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
        NSString *dateAndTime =  [dateFormatter stringFromDate:select]; 
        labe2.text = [NSString stringWithFormat:@"       %@",dateAndTime];
        dateB = [[dateFormatter dateFromString:dateAndTime]retain];
        
        
    }
   
    NSComparisonResult result = [dateA compare:dateB];

    if (result == NSOrderedDescending || dateA==nil || dateB == nil) {
        //NSLog(@"Date1  is in the future");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告提示" message:@"您好，你的日期设定有误，请重新设置" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
        
        [alert show];
    }
    
    else {
      int visit1=0;
      int successnum1=0;
      int losingnum1=0;
 
      for (NKSample*sample in mProject.samples) {
        if (sample.status!=-2)
        {
          NSString*visitedate=[sample.sampleVisit.startTime substringToIndex:[sample.sampleVisit.startTime rangeOfString:@" "].location];
          NSString*startdate=[dateA.description substringToIndex:[dateA.description rangeOfString:@" "].location];
          NSString*enddate=[dateB.description substringToIndex:[dateB.description rangeOfString:@" "].location];
          int a=[visitedate compare:startdate];
          a=[visitedate compare:enddate];
          if (([startdate compare:visitedate]==NSOrderedAscending||[visitedate compare:startdate]==NSOrderedSame)&&([enddate compare:visitedate]==NSOrderedDescending||[visitedate compare:enddate]==NSOrderedSame) ) {
              visit1++;
            if (sample.status==50) {
              successnum1++;
            }
            if (sample.status!=-2&&sample.status!=50) {
              losingnum1++;
            }
          } 
          

        }
      }

      lblVisit.text=[[NSString alloc]initWithFormat:@"%d",visit1];
      lblSuccess.text=[[NSString alloc]initWithFormat:@"%d",successnum1];
      lblfalse.text=[[NSString alloc]initWithFormat:@"%d",losingnum1];

       
    }
    
}


-(IBAction)btnhidduen:(id)sender{
    
    
    if (((UIView*)sender).tag == 10) {
        
        if (picker2.hidden == NO) {
            picker2.hidden =YES;
            
            NSDate *select = [picker2 date];  
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
            //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
            NSString *dateAndTime =  [dateFormatter stringFromDate:select]; 
            labe2.text = [NSString stringWithFormat:@"       %@",dateAndTime];
            
            dateB = [[dateFormatter dateFromString:dateAndTime]retain];
            
        }

        
        if (picker1.hidden == NO) {
            picker1.hidden =YES;

        }
        else {
            picker1.hidden =NO;

        }

                
        
        NSDate *select = [picker1 date];  
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
        NSString *dateAndTime =  [dateFormatter stringFromDate:select];  
        
        labe1.text = [NSString stringWithFormat:@"       %@",dateAndTime];
        dateA = [[dateFormatter dateFromString:dateAndTime]retain];
            

}
    
    else {
        
        
        if (picker1.hidden == NO) {
            picker1.hidden =YES;
            
            NSDate *select = [picker1 date];  
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
            //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
            NSString *dateAndTime =  [dateFormatter stringFromDate:select];  
            
            labe1.text = [NSString stringWithFormat:@"       %@",dateAndTime];
            
            dateA = [[dateFormatter dateFromString:dateAndTime]retain];
        }
        
        if (picker2.hidden == NO) {
            picker2.hidden =YES;
            
        }
        else {
            picker2.hidden =NO;
            
        }
        

        NSDate *select = [picker2 date];  
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; 
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];  
        NSString *dateAndTime =  [dateFormatter stringFromDate:select]; 
        labe2.text = [NSString stringWithFormat:@"       %@",dateAndTime];
        dateB = [[dateFormatter dateFromString:dateAndTime]retain];
    }

   
    
}




-(void)refreshView
{
  
  lblProjectName.text=mProject.ProjectName;
  }

-(void)setHidden:(BOOL)hidden
{
  if (!hidden) {
    lblProjectName.text=mProject.ProjectName;
     lblTotal.text=[[NSString alloc]initWithFormat:@"%d",mProject.samples.count];
    if (btnAll.selected) {
     
      int visit=0;
      int successnum1=0;
      int losingnum1=0;
      for (NKSample*sample in mProject.samples) {
        if (sample.status!=-2) {
          visit++;
        }
        if (sample.status==50) {
          successnum1++;
        }
        if (sample.status!=-2&&sample.status!=50) {
          losingnum1++;
        }

      }
      lblVisit.text=[[NSString alloc]initWithFormat:@"%d",visit];
      lblSuccess.text=[[NSString alloc]initWithFormat:@"%d",successnum1];
      lblfalse.text=[[NSString alloc]initWithFormat:@"%d",losingnum1];
    }
    else {
    
      int visit=0;
      int successnum1=0;
      int losingnum1=0;
      for (NKSample*sample in mProject.samples) {
        if (sample.status!=-2)
        {
          NSString*visitedate=[sample.sampleVisit.startTime substringToIndex:[sample.sampleVisit.startTime rangeOfString:@" "].location];
          NSString*startdate=[dateA.description substringToIndex:[dateA.description rangeOfString:@" "].location];
          NSString*enddate=[dateB.description substringToIndex:[dateB.description rangeOfString:@" "].location];
          int a=[visitedate compare:startdate];
          a=[visitedate compare:enddate];
          if (([startdate compare:visitedate]==NSOrderedAscending||[visitedate compare:startdate]==NSOrderedSame)&&([enddate compare:visitedate]==NSOrderedDescending||[visitedate compare:enddate]==NSOrderedSame) ) {
            visit++;
            if (sample.status==50) {
              successnum1++;
            }
            if (sample.status!=-2&&sample.status!=50) {
              losingnum1++;
            }
          } 
          
        }
      }
      lblVisit.text=[[NSString alloc]initWithFormat:@"%d",visit];
      lblSuccess.text=[[NSString alloc]initWithFormat:@"%d",successnum1];
      lblfalse.text=[[NSString alloc]initWithFormat:@"%d",losingnum1];

    }
   
      }
   [super setHidden:hidden];
}
-(UIView*)getQuestionView
{
  return mQuestionView;
}
@end
