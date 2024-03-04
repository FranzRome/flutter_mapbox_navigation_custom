// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNAdasisConfigCycleTimes;
@class MBNNAdasisConfigDataSending;
@class MBNNAdasisConfigPathsConfigs;

/** Configuration of ADASISv2 feature. Can be created with AdasisConfigBuilder. */
NS_SWIFT_NAME(AdasisConfig)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfig : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithCycleTimes:(nonnull MBNNAdasisConfigCycleTimes *)cycleTimes
                               dataSending:(nonnull MBNNAdasisConfigDataSending *)dataSending
                              pathsOptions:(nonnull MBNNAdasisConfigPathsConfigs *)pathsOptions;

@property (nonatomic, readonly, nonnull) MBNNAdasisConfigCycleTimes *cycleTimes;
@property (nonatomic, readonly, nonnull) MBNNAdasisConfigDataSending *dataSending;
@property (nonatomic, readonly, nonnull) MBNNAdasisConfigPathsConfigs *pathsOptions;

- (BOOL)isEqualToAdasisConfig:(nonnull MBNNAdasisConfig *)other;

@end
