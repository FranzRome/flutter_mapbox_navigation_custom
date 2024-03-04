// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(AdasisConfigDataSending)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfigDataSending : NSObject

- (nonnull instancetype)init;

- (nonnull instancetype)initWithMessageIntervalMs:(uint32_t)messageIntervalMs
                                messagesInPackage:(uint32_t)messagesInPackage
                        sortProfileshortsByOffset:(BOOL)sortProfileshortsByOffset
                         sortProfilelongsByOffset:(BOOL)sortProfilelongsByOffset
                             enableRetransmission:(BOOL)enableRetransmission;

@property (nonatomic, readonly) uint32_t messageIntervalMs;
@property (nonatomic, readonly) uint32_t messagesInPackage;
@property (nonatomic, readonly, getter=isSortProfileshortsByOffset) BOOL sortProfileshortsByOffset;
@property (nonatomic, readonly, getter=isSortProfilelongsByOffset) BOOL sortProfilelongsByOffset;
@property (nonatomic, readonly, getter=isEnableRetransmission) BOOL enableRetransmission;

- (BOOL)isEqualToAdasisConfigDataSending:(nonnull MBNNAdasisConfigDataSending *)other;

@end
