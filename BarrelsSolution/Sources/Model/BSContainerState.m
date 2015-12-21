//
//  BSContainerState.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSContainerState.h"
#import "BSContainer.h"

@interface BSContainerState ()

@property (nonatomic, strong) BSContainer *container;

@end

@implementation BSContainerState

+ (instancetype)stateWithContainer:(BSContainer *)container value:(NSUInteger)value
{
	BSContainerState *containerState = [[BSContainerState alloc] initWithContainer:container];
	containerState.value = value;
	return containerState;
}

- (instancetype)initWithContainer:(BSContainer *)container;
{
	self = [super init];
	if (self)
	{
		self.container = container;
	}
	return self;
}

- (BOOL)isEmpty
{
	return self.value == kBSEmptyStateValue;
}

- (BOOL)isFull
{
	return self.container.capacity == self.value;
}

- (BOOL)isEqualToState:(BSContainerState *)state;
{
	return self == state || ([self.container isEqual:state.container] && self.value == state.value);
}

- (BOOL)isEqual:(id)object
{
	return [object isKindOfClass:[self class]] && [self isEqualToState:object];
}

- (NSUInteger)hash
{
	return self.container.hash + self.value;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%i - %@", self.value, self.container];
}

@end
