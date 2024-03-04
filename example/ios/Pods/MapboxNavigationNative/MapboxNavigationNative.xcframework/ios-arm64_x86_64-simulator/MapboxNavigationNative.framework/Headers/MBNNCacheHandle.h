// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRoadGraphUpdateAvailabilityCallback.h>

NS_SWIFT_NAME(CacheHandle)
__attribute__((visibility ("default")))
@interface MBNNCacheHandle : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

/**
 * Async check if a road graph data update is available.
 * We determine the road graph version on the cache creation.
 * The next time a cache is created, it will also discover this version
 * and pick it up if automatic version switching is used.
 *
 * The check is guaranteed to take less than 5 seconds (default) and returns false in case of timeout.
 */
- (void)isRoadGraphDataUpdateAvailableForCallback:(nonnull MBNNRoadGraphUpdateAvailabilityCallback)callback;

@end
