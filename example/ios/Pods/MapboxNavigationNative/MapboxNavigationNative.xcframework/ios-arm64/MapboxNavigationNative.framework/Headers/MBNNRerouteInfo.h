// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRouterOrigin.h>

/** A structure containing route request, response, and origin. */
NS_SWIFT_NAME(RerouteInfo)
__attribute__((visibility ("default")))
@interface MBNNRerouteInfo : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithRouteResponse:(nonnull NSString *)routeResponse
                                 routeRequest:(nonnull NSString *)routeRequest
                                       origin:(MBNNRouterOrigin)origin;

@property (nonatomic, readonly, nonnull, copy) NSString *routeResponse;
@property (nonatomic, readonly, nonnull, copy) NSString *routeRequest;
@property (nonatomic, readonly) MBNNRouterOrigin origin;

@end
