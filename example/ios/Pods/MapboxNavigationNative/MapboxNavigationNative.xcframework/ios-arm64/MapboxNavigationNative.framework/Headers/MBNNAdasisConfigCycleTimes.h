// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** Below this line are definitions of ADASIS provider configuration structures */
NS_SWIFT_NAME(AdasisConfigCycleTimes)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfigCycleTimes : NSObject

- (nonnull instancetype)init;

- (nonnull instancetype)initWithMetadataCycleOnStartMs:(uint32_t)metadataCycleOnStartMs
                                  metadataCycleSeconds:(uint32_t)metadataCycleSeconds
                                       positionCycleMs:(uint32_t)positionCycleMs;

@property (nonatomic, readonly) uint32_t metadataCycleOnStartMs;
@property (nonatomic, readonly) uint32_t metadataCycleSeconds;
@property (nonatomic, readonly) uint32_t positionCycleMs;

- (BOOL)isEqualToAdasisConfigCycleTimes:(nonnull MBNNAdasisConfigCycleTimes *)other;

@end
