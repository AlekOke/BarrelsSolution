//
//  BSDepthFirstSearcher.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSDepthFirstSearcher.h"
#import "BSAbstractSearcher_Private.h"
#import "BSNodesFactory.h"

@interface BSDepthFirstSearcher ()

// empty

@end

@implementation BSDepthFirstSearcher

- (NSArray<BSNode *> *)searchSolutionWithCurrentNode:(BSNode *)currentNode depth:(NSUInteger)depth
{
	NSLog(@"%@, depth: %i", currentNode, depth);
	
	NSArray<BSNode *> *solution = nil;
	
	if (depth < self.depthLimit)
	{
		[self.visitedNodes addObject:currentNode];
		
		if (![self.targetNodes containsObject:currentNode])
		{
			NSSet<BSNode *> *nodes = [self.nodesFactory nodesWithCurrentNode:currentNode];
			for (BSNode *nextNode in nodes)
			{
				if (![self.visitedNodes containsObject:nextNode])
				{
					solution = [self searchSolutionWithCurrentNode:nextNode depth:(depth + 1)];
					if (solution.count > 0)
					{
						solution = [@[nextNode] arrayByAddingObjectsFromArray:solution];
						break;
					}
				}
			}
		}
		else
		{
			NSLog(@"Find solution %@", currentNode);
			solution = @[currentNode];
		}
	}
	
	return solution;
}

@end
