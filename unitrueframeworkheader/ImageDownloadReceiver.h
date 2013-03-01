

#import <Foundation/Foundation.h>


@interface ImageDownloadReceiver : NSObject {
    id      imageContainer;
	CGRect displayRect;
	int failedCount;
	float progress;
	float max;
}

@property (nonatomic, assign) id imageContainer;
@property (nonatomic, assign) CGRect displayRect;
@property (nonatomic, assign) int failedCount; 

@property (nonatomic, assign) float progress;
@property (nonatomic, assign) float max;

@end
