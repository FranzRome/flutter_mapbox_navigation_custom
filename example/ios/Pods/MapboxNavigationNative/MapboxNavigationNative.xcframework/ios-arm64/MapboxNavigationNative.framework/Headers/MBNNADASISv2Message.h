// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/**
 * ADASISv2Message describes a class holding methods for ADASISv2 messages.
 * Experimental feature that might change in next releases.
 */
NS_SWIFT_NAME(ADASISv2Message)
__attribute__((visibility ("default")))
@interface MBNNADASISv2Message : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

+ (nullable MBNNADASISv2Message *)fromBigEndianForBytes:(uint64_t)bytes __attribute((ns_returns_retained));
+ (nullable MBNNADASISv2Message *)fromLittleEndianForBytes:(uint64_t)bytes __attribute((ns_returns_retained));
+ (nullable MBNNADASISv2Message *)fromJsonForJson:(nonnull NSString *)json __attribute((ns_returns_retained));
- (nonnull NSArray<NSNumber *> *)toFlatBuffer __attribute((ns_returns_retained));
- (nonnull NSString *)toJson __attribute((ns_returns_retained));
- (nonnull NSString *)toHex __attribute((ns_returns_retained));
- (uint64_t)toBigEndian;
- (uint64_t)toLittleEndian;

@end
