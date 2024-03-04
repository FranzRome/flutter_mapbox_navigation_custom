// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRerouteErrorType.h>

NS_SWIFT_NAME(RerouteError)
__attribute__((visibility ("default")))
@interface MBNNRerouteError : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithMessage:(nonnull NSString *)message
                                   type:(MBNNRerouteErrorType)type;

@property (nonatomic, readonly, nonnull, copy) NSString *message;
@property (nonatomic, readonly) MBNNRerouteErrorType type;

- (BOOL)isEqualToRerouteError:(nonnull MBNNRerouteError *)other;

@end
