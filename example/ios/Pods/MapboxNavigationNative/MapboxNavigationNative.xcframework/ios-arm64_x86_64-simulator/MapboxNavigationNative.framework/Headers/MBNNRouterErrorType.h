// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

// NOLINTNEXTLINE(modernize-use-using)
typedef NS_ENUM(NSInteger, MBNNRouterErrorType)
{
    MBNNRouterErrorTypeUnknown,
    MBNNRouterErrorTypeRequestCancelled,
    /** Error caused by too many requests to router. */
    MBNNRouterErrorTypeThrottlingError,
    /** Errors from DirectionsAPI. Fallback to onboard router is supported. (e.g. RateLimit) */
    MBNNRouterErrorTypeDirectionsError,
    /** Critical errors from DirectionsAPI. Fallback to onboard router unsupported. (NoRoute, NoSegment, Forbidden, ProfileNotFound, InvalidInput, NoChargersNearby) */
    MBNNRouterErrorTypeDirectionsCriticalError,
    /** Error which happened on network transport side. (Connection error, SSL error, Time out, etc.). */
    MBNNRouterErrorTypeNetworkError
} NS_SWIFT_NAME(RouterErrorType);

NSString* MBNNRouterErrorTypeToString(MBNNRouterErrorType router_error_type);
