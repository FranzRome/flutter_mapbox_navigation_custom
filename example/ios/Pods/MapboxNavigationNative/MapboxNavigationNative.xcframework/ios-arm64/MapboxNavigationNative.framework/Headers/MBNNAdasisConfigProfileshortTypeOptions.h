// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(AdasisConfigProfileshortTypeOptions)
__attribute__((visibility ("default")))
@interface MBNNAdasisConfigProfileshortTypeOptions : NSObject

- (nonnull instancetype)init;

- (nonnull instancetype)initWithSlopeStep:(BOOL)slopeStep
                              slopeLinear:(BOOL)slopeLinear
                                curvature:(BOOL)curvature
                            routeNumTypes:(BOOL)routeNumTypes
                            roadCondition:(BOOL)roadCondition
                        roadAccessibility:(BOOL)roadAccessibility
                        variableSpeedSign:(BOOL)variableSpeedSign
                            headingChange:(BOOL)headingChange;

@property (nonatomic, readonly, getter=isSlopeStep) BOOL slopeStep;
@property (nonatomic, readonly, getter=isSlopeLinear) BOOL slopeLinear;
@property (nonatomic, readonly, getter=isCurvature) BOOL curvature;
@property (nonatomic, readonly, getter=isRouteNumTypes) BOOL routeNumTypes;
@property (nonatomic, readonly, getter=isRoadCondition) BOOL roadCondition;
@property (nonatomic, readonly, getter=isRoadAccessibility) BOOL roadAccessibility;
@property (nonatomic, readonly, getter=isVariableSpeedSign) BOOL variableSpeedSign;
@property (nonatomic, readonly, getter=isHeadingChange) BOOL headingChange;

- (BOOL)isEqualToAdasisConfigProfileshortTypeOptions:(nonnull MBNNAdasisConfigProfileshortTypeOptions *)other;

@end
