//
//  BSBreadthFirstSearcher.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSBreadthFirstSearcher.h"
#import "BSAbstractSearcher_Private.h"
#import "BSNodesFactory.h"
#import "BSExtendedNode.h"
#import "BSNode.h"

@interface BSBreadthFirstSearcher ()

// empty

@end

@implementation BSBreadthFirstSearcher

- (NSArray<BSNode *> *)searchSolutionWithNode:(BSNode *)node depth:(NSUInteger)depth
{
	NSArray<BSNode *> *solution = nil;

	NSMutableOrderedSet<BSExtendedNode *> *openedExtendedNodes = [NSMutableOrderedSet orderedSetWithObject:[BSExtendedNode extendedNodeWithViewedNode:node parentNode:nil]];
	NSMutableOrderedSet<BSExtendedNode *> *closedExtendedNodes = [NSMutableOrderedSet new];
	NSUInteger iteration = 1;

	while (solution.count == 0 && openedExtendedNodes.count > 0)
	{
		NSLog(@"%i. Opened nodes: %@", iteration, openedExtendedNodes);
		NSLog(@"%i. Closed nodes: %@", iteration, closedExtendedNodes);
		
		BSExtendedNode *extendedNode = openedExtendedNodes.firstObject;
		if (![self.targetNodes containsObject:extendedNode.viewedNode])
		{
			[closedExtendedNodes addObject:extendedNode];
			[openedExtendedNodes removeObject:extendedNode];
			
			for (BSNode *subnode in [self.nodesFactory nodesWithCurrentNode:extendedNode.viewedNode])
			{
				BSExtendedNode *extendedSubnode = [BSExtendedNode extendedNodeWithViewedNode:subnode parentNode:extendedNode.viewedNode];
				if (![closedExtendedNodes containsObject:extendedSubnode])
				{
					[openedExtendedNodes addObject:extendedSubnode];
				}
			}
		}
		else
		{
			solution = @[extendedNode.viewedNode];
			
			while (extendedNode.parentNode)
			{
				if ([extendedNode.parentNode isEqualToNode:closedExtendedNodes.lastObject.viewedNode])
				{
					solution = [@[extendedNode.parentNode] arrayByAddingObjectsFromArray:solution];
					extendedNode = closedExtendedNodes.lastObject;
				}
				
				[closedExtendedNodes removeObjectAtIndex:(closedExtendedNodes.count - 1)];
			}
		}
		
		++iteration;
	}
	
	return solution;
}

@end
