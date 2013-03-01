//
//  UnitrueLabel.h
//  ZhiWeibo
//
//  Created by junmin liu on 10-11-21.
//  Copyright 2010 Openlab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol UnitrueLabelDelegate <NSObject>
@required
- (void)touchUpInside;
@end
@interface UnitrueLabel : UILabel {
    id <UnitrueLabelDelegate> delegate;
}
@property (nonatomic, assign) id <UnitrueLabelDelegate> delegate;
- (id)initWithFrame:(CGRect)frame;
@end
