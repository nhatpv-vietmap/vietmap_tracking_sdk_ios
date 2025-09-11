#ifndef VietmapAlertBridge_h
#define VietmapAlertBridge_h

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VietmapAlertBridge : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (void)configureWithApiUrl:(NSString *)apiUrl apiKey:(NSString *)apiKey apiID:(NSString *)apiID;

// Alert lifecycle methods
- (void)startAlert;
- (void)stopAlert;

// Main method - returns speed limit text for TTS
- (void)processLocation:(CLLocation *)location
          forSpeedAlert:(double)heading 
                 speed:(double)speed
             vehicleId:(NSString *)vehicleId
           vehicleType:(int)vehicleType
                 seats:(int)seats
               weights:(float)weights
          maxProvision:(int)maxProvision
            completion:(void (^)(BOOL hasSpeedLimit, NSString * _Nullable speedLimitText))completion;

@end

NS_ASSUME_NONNULL_END

#endif /* VietmapAlertBridge_h */
