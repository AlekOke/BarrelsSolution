//
//  BSNodesFactory.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSNodesFactory.h"
#import "BSContainer.h"
#import "BSNode.h"
#import "BSContainerState.h"

@interface BSNodesFactory ()

@property (nonatomic, strong) NSArray<BSContainer *> *containers;

@end

@implementation BSNodesFactory

- (instancetype)initWithContainers:(NSArray<BSContainer *> *)containers
{
	self = [super init];
	if (self)
	{
		self.containers = containers;
	}
	return self;
}

- (NSSet<BSNode *> *)nodesWithCurrentNode:(BSNode *)node
{
	NSMutableSet<BSNode *> *nodes = [NSMutableSet new];
	
	for (NSUInteger givingContainerIndex = 0; givingContainerIndex < self.containers.count; givingContainerIndex++)
	{
		BSContainer *givingContainer = self.containers[givingContainerIndex];
		BSContainerState *givingContainerState = [node.states objectForKey:givingContainer];
		
		for (NSUInteger takingContainerIndex = 0; takingContainerIndex < self.containers.count; takingContainerIndex++)
		{
			if (takingContainerIndex != givingContainerIndex)
			{
				BSContainer *takingContainer = self.containers[takingContainerIndex];
				BSContainerState *takingContainerState = [node.states objectForKey:takingContainer];
				
				if ([self matchRulesWithGivingContainerState:givingContainerState takingContainerState:takingContainerState])
				{
					NSUInteger balance = takingContainer.capasity - takingContainerState.value;
					NSMapTable<BSContainer *, BSContainerState *> *states = [node.states copy];
					
					NSUInteger gaveContainerStateValue = (balance > givingContainerState.value) ? takingContainerState.value + givingContainerState.value : takingContainer.capasity;
					BSContainerState *gaveContainerState = [self containerStateWithContainer:givingContainer value:gaveContainerStateValue];
					[states setObject:gaveContainerState forKey:givingContainer];
					
					NSUInteger tookContainerStateValue = (balance > givingContainerState.value) ? kBSEmptyStateValue : givingContainerState.value - balance;
					BSContainerState *tookContainerState = [self containerStateWithContainer:takingContainer value:tookContainerStateValue];
					[states setObject:tookContainerState forKey:takingContainer];
					
					[nodes addObject:[[BSNode alloc] initWithStates:states]];
				}
			}
		}
	}
	
	return [nodes copy];
}

- (BOOL)matchRulesWithGivingContainerState:(BSContainerState *)givingContainerState takingContainerState:(BSContainerState *)takingContainerState
{
	return !givingContainerState.isEmpty && !takingContainerState.isFull;
}

#pragma mark - Convenient

- (BSContainerState *)containerStateWithContainer:(BSContainer *)container value:(NSUInteger)value
{
	BSContainerState *containerState = [[BSContainerState alloc] initWithContainer:container];
	containerState.value = value;
	return containerState;
}

@end
