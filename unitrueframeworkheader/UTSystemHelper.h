//
//  CstSystem.h
//  CstWeibo
//
//  Created by xudong jin on 12-1-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UTSystemHelper : NSObject
{
    
}
+ (UIColor *)getCstThemeColor;
+ (NSString*)getSettingsFilePath;
+ (id)getCstSettingsByKey:(NSString*)key;
+(void)saveCstSettingsWithValue:(id)value forKey:(NSString*)key ;
+(NSString*)getDeviceID;
+(NSArray*)unZipFile:(NSString*)filename;
+(BOOL)addFileToZip:(NSString*)filename toZipfile:(NSString*)zipfile withFileName:(NSString*)newfile;
+(long)getFileSize:(NSString*)filePath;
+(NSString*)getCurrentDate;
+(NSString*)getServerAddress;
+(void)saveServerAddress:(NSString*)address;
+(void)saveFiletoLocal:(NSString *)filepath filecontent:(NSString *)filecontent;
+(BOOL)copyfile:(NSString *)srcPath toPath:(NSString *)destPath error:(NSError**)error;
+(NSString*)captureScreen:(UIView*)view;
+(NSString*)getMediaFileName:(int)type index:(int)index;//type:0.voice 1.image 2.media
@end
