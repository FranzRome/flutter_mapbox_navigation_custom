// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_SWIFT_NAME(PolygonLocationReference)
__attribute__((visibility ("default")))
@interface MBNNPolygonLocationReference : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithCorners:(nonnull NSArray<CLLocation *> *)corners;

@property (nonatomic, readonly, nonnull, copy) NSArray<CLLocation *> *corners;

@end
