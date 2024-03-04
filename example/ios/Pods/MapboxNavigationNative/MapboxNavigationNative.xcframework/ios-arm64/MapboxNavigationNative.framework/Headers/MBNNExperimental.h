// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNADASISv2MessageCallback.h>
#import <MapboxNavigationNative/MBNNGenerateEh360Callback.h>

@class MBNNAdasisConfig;
@class MBNNETCGateInfo;
@class MBNNEdgeAdasAttributes;

/**
 * Contains experimental APIs which might change without any deprecation process.
 * Also note that this interface will be exposed directly to the end user without any additional
 * wrappers from platform side(it is done to speed up delivery of the new features to the end user)
 */
NS_SWIFT_NAME(Experimental)
@protocol MBNNExperimental
/**
 * Generate electronic horizon 360 asynchronously and call the callback
 * NB: callback won't be called on the main thread
 */
- (void)generateEh360ForGraphTraversalRadiusInMeters:(double)graphTraversalRadiusInMeters
                                            callback:(nonnull MBNNGenerateEh360Callback)callback;
/**
 * Should be called as soon as vehicle passed Electronic Toll Collection(ETC) gate which operates in Japan.
 * This information can be used to improve map matching.
 * @see https://www.hanshin-exp.co.jp/english/drive/first-time/etc.html
 * @param etcGateInfo Information about ETC gate which was just passed by vehicle
 */
- (void)updateETCGateInfoForEtcGateInfo:(nonnull MBNNETCGateInfo *)etcGateInfo;
/**
 * Caution: Beta feature for ADAS / ADASIS SDK. Method interface may change soon.
 *
 * Sets a callback for ADASIS messages
 */
- (void)setAdasisMessageCallbackForCallback:(nonnull MBNNADASISv2MessageCallback)callback
                               adasisConfig:(nonnull MBNNAdasisConfig *)adasisConfig;
/** Resets a callback for ADASIS messages */
- (void)resetAdasisMessageCallback;
/**
 * Caution: Beta feature that cat be changed soon.
 *
 * Returns ADAS data for a given Edge.
 * If no ADAS data is available, returns null
 */
- (nullable MBNNEdgeAdasAttributes *)getAdasAttributesForEdgeId:(uint64_t)edgeId;
@end
