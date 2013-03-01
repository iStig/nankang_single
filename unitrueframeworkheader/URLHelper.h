

#import <Foundation/Foundation.h>


@interface URLHelper : NSObject {
    
}

+ (NSString *)getURL:(NSString *)baseUrl 
	 queryParameters:(NSMutableDictionary*)params;



@end
