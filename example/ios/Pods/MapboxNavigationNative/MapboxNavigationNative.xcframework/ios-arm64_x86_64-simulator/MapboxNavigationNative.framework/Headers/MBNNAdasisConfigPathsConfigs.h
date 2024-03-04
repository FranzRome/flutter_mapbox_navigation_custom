// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNAdasisConfigPathLevelOptions;

NS_SWIFT_NAME(AdasisConfigPathsConfigs)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfigPathsConfigs : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithMpp:(nonnull MBNNAdasisConfigPathLevelOptions *)mpp
                             level1:(nonnull MBNNAdasisConfigPathLevelOptions *)level1
                             level2:(nonnull MBNNAdasisConfigPathLevelOptions *)level2;

@property (nonatomic, readonly, nonnull) MBNNAdasisConfigPathLevelOptions *mpp;
@property (nonatomic, readonly, nonnull) MBNNAdasisConfigPathLevelOptions *level1;
@property (nonatomic, readonly, nonnull) MBNNAdasisConfigPathLevelOptions *level2;

- (BOOL)isEqualToAdasisConfigPathsConfigs:(nonnull MBNNAdasisConfigPathsConfigs *)other;

@end
