//
//  BSNode.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSNode.h"
#import "BSContainer.h"
#import "BSContainerState.h"

@interface BSNode ()

@property (nonatomic, strong) NSDictionary<NSString *, BSContainerState *> *states;

@end

@implementation BSNode

- (instancetype)initWithStates:(NSDictionary<NSString *, BSContainerState *> *)states
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
	return self == node || [self.states isEqualToDictionary:node.states];
}

- (BOOL)isEqual:(id)object
{
	return [object isKindOfClass:[self class]] && [self isEqualToNode:object];
}

- (NSUInteger)hash
{
	return self.states.hash;
}

- (NSString *)description
{
	NSMutableString *result = [NSMutableString new];
	for (BSContainerState *containerState in self.states.allValues)
	{
		[result appendFormat:@"%i(%i), ", containerState.value, containerState.container.capacity];		
	}
	
	return result;
}

@end
