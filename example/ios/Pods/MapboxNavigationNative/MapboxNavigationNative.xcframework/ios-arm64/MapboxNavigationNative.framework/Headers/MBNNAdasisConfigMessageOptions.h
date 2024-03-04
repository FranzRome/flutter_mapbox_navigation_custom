// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(AdasisConfigMessageOptions)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfigMessageOptions : NSObject

- (nonnull instancetype)init;

- (nonnull instancetype)initWithEnable:(BOOL)enable
                          radiusMeters:(uint32_t)radiusMeters
                      repetitionMeters:(uint32_t)repetitionMeters;

@property (nonatomic, readonly, getter=isEnable) BOOL enable;
@property (nonatomic, readonly) uint32_t radiusMeters;
@property (nonatomic, readonly) uint32_t repetitionMeters;

- (BOOL)isEqualToAdasisConfigMessageOptions:(nonnull MBNNAdasisConfigMessageOptions *)other;

@end
