// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(AdasisConfigProfilelongTypeOptions)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfigProfilelongTypeOptions : NSObject

- (nonnull instancetype)init;

- (nonnull instancetype)initWithLat:(BOOL)lat
                                lon:(BOOL)lon
                                alt:(BOOL)alt
                        trafficSign:(BOOL)trafficSign
                       extendedLane:(BOOL)extendedLane;

@property (nonatomic, readonly, getter=isLat) BOOL lat;
@property (nonatomic, readonly, getter=isLon) BOOL lon;
@property (nonatomic, readonly, getter=isAlt) BOOL alt;
@property (nonatomic, readonly, getter=isTrafficSign) BOOL trafficSign;
@property (nonatomic, readonly, getter=isExtendedLane) BOOL extendedLane;

- (BOOL)isEqualToAdasisConfigProfilelongTypeOptions:(nonnull MBNNAdasisConfigProfilelongTypeOptions *)other;

@end
