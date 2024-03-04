// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRouterOrigin.h>
@class MBXExpected<__covariant Value, __covariant Error>;

@class MBNNRouterError;

NS_SWIFT_NAME(RouterRefreshCallback)
typedef void (^MBNNRouterRefreshCallback)(MBXExpected<NSString *, MBNNRouterError *> * _Nonnull annotationsResponse, MBNNRouterOrigin origin, NSDictionary<NSString *, NSString *> * _Nonnull responseHeaders); // NOLINT(modernize-use-using)
