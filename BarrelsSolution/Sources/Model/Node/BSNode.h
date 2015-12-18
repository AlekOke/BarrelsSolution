//
//  BSNode.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@class BSContainer;
@class BSContainerState;

@interface BSNode : NSObject

@property (nonatomic, strong, readonly) NSMapTable<BSContainer *, BSContainerState *> *states;

- (instancetype)initWithStates:(NSMapTable<BSContainer *, BSContainerState *> *)states;

- (BOOL)isEqualToNode:(BSNode *)node;

@end
