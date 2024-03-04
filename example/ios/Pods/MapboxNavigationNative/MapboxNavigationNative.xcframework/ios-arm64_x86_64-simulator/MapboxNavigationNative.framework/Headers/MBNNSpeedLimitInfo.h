// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNSpeedLimitType.h>
#import <MapboxNavigationNative/MBNNSpeedLimitUnit.h>

@class MBNNSpeedLimitRestriction;

NS_SWIFT_NAME(SpeedLimitInfo)
__attribute__((visibility ("default")))
@interface MBNNSpeedLimitInfo : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithValue:(uint8_t)value
                                 unit:(MBNNSpeedLimitUnit)unit
                                 type:(MBNNSpeedLimitType)type
                          restriction:(nonnull MBNNSpeedLimitRestriction *)restriction;

@property (nonatomic, readonly) uint8_t value;
@property (nonatomic, readonly) MBNNSpeedLimitUnit unit;
@property (nonatomic, readonly) MBNNSpeedLimitType type;
@property (nonatomic, readonly, nonnull) MBNNSpeedLimitRestriction *restriction;

- (BOOL)isEqualToSpeedLimitInfo:(nonnull MBNNSpeedLimitInfo *)other;

@end
