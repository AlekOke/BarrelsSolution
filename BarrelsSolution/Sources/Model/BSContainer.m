//
//  BSContainer.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSContainer.h"

@interface BSContainer ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSUInteger capacity;

@end

@implementation BSContainer

- (instancetype)initWithName:(NSString *)name capasity:(NSUInteger)capasity
{
	self = [super init];
	if (self)
	{
		self.name = name;
		self.capacity = capasity;
	}
	return self;
}

- (BOOL)isEqualToContainer:(BSContainer *)container
{
	return self == container || [self.name isEqualToString:container.name];
}

- (BOOL)isEqual:(id)object
{
	return [object isKindOfClass:[self class]] && [self isEqualToContainer:object];
}

- (NSUInteger)hash
{
	return self.name.hash;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ (%i)", self.name, self.capacity];
}

@end
