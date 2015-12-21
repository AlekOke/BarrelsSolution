//
//  BSExtendedNode.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/21/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSExtendedNode.h"
#import "BSNode.h"

@interface BSExtendedNode ()

// empty

@end

@implementation BSExtendedNode

+ (instancetype)extendedNodeWithViewedNode:(BSNode *)viewedNode parentNode:(BSNode *)parentNode
{
	return [[self alloc] initWithViewedNode:viewedNode parentNode:parentNode];
}

- (instancetype)initWithViewedNode:(BSNode *)viewedNode parentNode:(BSNode *)parentNode
{
	self = [super init];
	if (self)
	{
		self.viewedNode = viewedNode;
		self.parentNode = parentNode;
	}
	return self;
}

- (BOOL)isEqualToExtendedNode:(BSExtendedNode *)extendedNode
{
	return [self.viewedNode isEqualToNode:extendedNode.viewedNode];
}

- (BOOL)isEqual:(id)object
{
	return [object isKindOfClass:[self class]] && [self isEqualToExtendedNode:object];
}

- (NSString *)description
{
	return [self.viewedNode description];
}

@end
