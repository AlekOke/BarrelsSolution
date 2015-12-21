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

- (NSEnumerator<BSNode *> *)nodesWithCurrentNode:(BSNode *)node
{
	NSMutableSet<BSNode *> *nodes = [NSMutableSet new];
	
	for (NSUInteger givingContainerIndex = 0; givingContainerIndex < self.containers.count; givingContainerIndex++)
	{
		BSContainer *givingContainer = self.containers[givingContainerIndex];
		BSContainerState *givingContainerState = node.states[givingContainer.name];
		
		for (NSUInteger takingContainerIndex = 0; takingContainerIndex < self.containers.count; takingContainerIndex++)
		{
			if (takingContainerIndex != givingContainerIndex)
			{
				BSContainer *takingContainer = self.containers[takingContainerIndex];
				BSContainerState *takingContainerState = node.states[takingContainer.name];
				
				if ([self matchRulesWithGivingContainerState:givingContainerState takingContainerState:takingContainerState])
				{
					NSUInteger balance = takingContainer.capacity - takingContainerState.value;
					NSMutableDictionary<NSString *, BSContainerState *> *states = [node.states mutableCopy];
					
					NSUInteger gaveContainerStateValue = (balance > givingContainerState.value) ? kBSEmptyStateValue : givingContainerState.value - balance;
					BSContainerState *gaveContainerState = [BSContainerState stateWithContainer:givingContainer value:gaveContainerStateValue];
					states[givingContainer.name] = gaveContainerState;
					
					NSUInteger tookContainerStateValue = (balance > givingContainerState.value) ? takingContainerState.value + givingContainerState.value : takingContainer.capacity;
					BSContainerState *tookContainerState = [BSContainerState stateWithContainer:takingContainer value:tookContainerStateValue];
					states[takingContainer.name] = tookContainerState;
					
					[nodes addObject:[[BSNode alloc] initWithStates:[states copy]]];
				}
			}
		}
	}
	
	return [nodes objectEnumerator];
}

- (BOOL)matchRulesWithGivingContainerState:(BSContainerState *)givingContainerState takingContainerState:(BSContainerState *)takingContainerState
{
	return !givingContainerState.isEmpty && !takingContainerState.isFull;
}

@end
