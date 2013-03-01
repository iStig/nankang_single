//
//  Regular.h
//  UnitrueFramework
//
//  Created by 军锋 安 on 12-8-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#define REG_MAX @"MAX[(][\\s]*#Q[0-9]+[(0-9)|(\\.)|,|-]*#[\\s]*[)]"
#define REG_MIN @"MIN[(][\\s]*#Q[0-9]+[(0-9)|(\\.)|,|-]*#[\\s]*[)]"
#define REG_COUNT @"COUNT[(][\\s]*#Q[0-9]+[(L0-9\\x28\\x29)|(\\.)|,|-]*#[\\s]*[)]"
#define REG_L @"L[(][\\s]*[-]{0,1}[\\s]*[\\d]+[\\s]*,[\\s]*[-]{0,1}[\\s]*[\\d]+[\\s]*,[\\s]*[-]{0,1}[\\s]*[\\d]+[\\s]*[)]"
#define REG_NORMSL @"[(][\\s\\S]*[)]"
#define REG_SUM @"SUM[(]#[(A-Za-z0-9)|(\\.)|,|-]+#[\\S]*[)]"
#define REG_LAND @"LAND[(]#[(A-Za-z0-9)|(\\.)|,|-]+#[\\S]*[)]"
#define REG_LOR @"LOR[(]#[(A-Za-z0-9)|(\\.)|,|-]+#[\\S]*[)]"
#define REG_QUEST @"[#][(A-Za-z0-9)|(\\.)|,|-]+[#]"
#define REG_DENG @"[\\S]*[=|!=|>|<|>=|<=][\\S]*"
#define REG_ZF @"[!\\(|!\\)]+['|(A-Za-z)|(\u4E00-\u9FA5)]"
#import "Model_Question.h"
#import "Model_Question+Item.h"
#import <UIKit/UIKit.h>

@interface Regular : NSObject
{
    NSMutableArray* m_list;
}
@property(strong,nonatomic)NSMutableArray* m_list;
-(NSMutableArray*)getIFArray:(NSString*) IF;
-(NSMutableArray*)getTHENArray:(NSString*) THEN;
@end
