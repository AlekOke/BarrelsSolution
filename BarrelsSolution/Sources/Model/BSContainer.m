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
@property (nonatomic, assign) NSUInteger capasity;

@end

@implementation BSContainer

- (instancetype)initWithName:(NSString *)name capasity:(NSUInteger)capasity
{
	self = [super init];
	if (self)
	{
		self.name = name;
		self.capasity = capasity;
	}
	return self;
}

- (BOOL)isEqualToContainer:(BSContainer *)container
{
	return [self.name isEqualToString:container.name];
}

- (BOOL)isEqual:(id)object
{
	return self == object || ([self isKindOfClass:object] && [self isEqualToContainer:object]);
}

- (NSUInteger)hash
{
	return self.name.hash;
}

@end
