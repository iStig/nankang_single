//
//  PublicUtils.h
//  UnitrueFramework
//
//  Created by 军锋 安 on 12-9-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathHelper.h"
@interface PublicUtils : NSObject


//获取缓存路径
+ (NSString*)getCurrentUserStoreagePath:(NSString *)filename;
+(void) save:(id) obj name:(NSString*)name;
+(id)get:(NSString*)name;
+(NSData*)loadFileFromLocal:(NSString*)filename;
+(BOOL)saveFileToLocal:(NSString*)filename file:(NSData*)file;
+(int) getIndex;
+(void)setIndexInit;
+(void)setIndexCancel;
@end
