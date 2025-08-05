#ifndef VietmapAlertBridge_h
#define VietmapAlertBridge_h

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VietmapAlertBridge : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (void)configureWithApiUrl:(NSString *)apiUrl apiKey:(NSString *)apiKey;

- (void)requestAlertsWithLocation:(CLLocation *)location 
                          heading:(double)heading 
                            speed:(double)speed 
                       completion:(void (^)(BOOL success, NSDictionary * _Nullable response, NSString * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END

#endif /* VietmapAlertBridge_h */
