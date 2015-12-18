//
//  BSNode.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSNode.h"
#import "BSContainerState.h"

@interface BSNode ()

@property (nonatomic, strong) NSMapTable<BSContainer *, BSContainerState *> *states;

@end

@implementation BSNode

- (instancetype)initWithStates:(NSMapTable<BSContainer *, BSContainerState *> *)states
{
	self = [super init];
	if (self)
	{
		self.states = states;
	}
	return self;
}

- (BOOL)isEqualToNode:(BSNode *)node
{
	return [self.states isEqual:node.states];
}

- (NSUInteger)hash
{
	return self.states.hash;
}

@end
