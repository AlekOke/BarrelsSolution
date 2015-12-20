//
//  BSNode.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@class BSContainerState;

@interface BSNode : NSObject

@property (nonatomic, strong, readonly) NSDictionary<NSString *, BSContainerState *> *states;

- (instancetype)initWithStates:(NSDictionary<NSString *, BSContainerState *> *)states;

- (BOOL)isEqualToNode:(BSNode *)node;

@end
