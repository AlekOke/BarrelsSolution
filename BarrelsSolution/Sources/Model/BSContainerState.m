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

- (instancetype)initWithContainer:(BSContainer *)container;
{
	self = [super init];
	if (self)
	{
		self.container = container;
	}
	return self;
}

- (BOOL)isEqualToState:(BSContainerState *)state;
{
	return [self.container isEqualToContainer:state.container] && self.value == state.value;
}

- (BOOL)isEqual:(id)object
{
	return self == object || ([self isKindOfClass:object] && [self isEqualToState:object]);
}

- (NSUInteger)hash
{
	return self.container.hash + self.value;
}

@end
