//
//  BSContainerState.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@class BSContainer;

static NSUInteger kBSEmptyStateValue = 0;

@interface BSContainerState : NSObject

@property (nonatomic, strong, readonly) BSContainer *container;
@property (nonatomic, assign, readonly, getter=isEmpty) BOOL empty;
@property (nonatomic, assign, readonly, getter=isFull) BOOL full;
@property (nonatomic, assign) NSUInteger value;

- (instancetype)initWithContainer:(BSContainer *)container;

- (BOOL)isEqualToState:(BSContainerState *)state;

@end
