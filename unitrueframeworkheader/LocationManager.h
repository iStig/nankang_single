

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate> {
	CLLocationManager*  locationManager;
    CLLocation*         location;
    NSTimer*            timer;
	id                  delegate;	
	BOOL				isUpdating;
}

@property (nonatomic, assign) BOOL isUpdating;

- (id)initWithDelegate:(id)delegate;
- (void)getCurrentLocation;
- (void)stopUpdateLocation;

@end
