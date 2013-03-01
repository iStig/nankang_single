//
//  Model_Answer.h
//  UnitrueFramework
//
//  Created by 军锋 安 on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model_Answer : NSObject<NSCopying>
{
    NSString* V;
    NSString* G;
    NSString* S;
    NSString* R;
    NSString* D;
    NSString* C;
    NSString* Tip;
    NSData*   AImage;
    int SelectOrder;
}
@property(nonatomic,assign)int SelectOrder;
@property(strong,nonatomic)NSString* G;
@property(strong,nonatomic)NSString* V;
@property(strong,nonatomic)NSString* S;
@property(strong,nonatomic)NSString* R;
@property(strong,nonatomic)NSString* D;
@property(strong,nonatomic)NSString* C;
@property(strong,nonatomic)NSString* Tip;
@property(strong,nonatomic)NSData*   AImage;
@end
