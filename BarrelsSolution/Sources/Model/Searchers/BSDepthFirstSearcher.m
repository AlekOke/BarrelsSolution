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
	NSArray<BSNode *> *solution = nil;
	
	if (depth < self.depthLimit)
	{
		NSLog(@"%@, depth: %i", currentNode, depth);

		[self.visitedNodes addObject:currentNode];
		
		if (![self.targetNodes containsObject:currentNode])
		{
			BSNode *nextNode = nil;
			NSEnumerator *enumerator = [self.nodesFactory nodesWithCurrentNode:currentNode];
			while (solution.count == 0 && (nextNode = [enumerator nextObject]))
			{
				if (![self.visitedNodes containsObject:nextNode])
				{
					solution = [self searchSolutionWithCurrentNode:nextNode depth:(depth + 1)];
				}
			}
			
			if (solution.count > 0)
			{
				solution = [@[currentNode] arrayByAddingObjectsFromArray:solution];
			}
		}
		else
		{
			NSLog(@"Find solution %@, depth: %i", currentNode, depth);
			solution = @[currentNode];
		}
	}
	
	return solution;
}

@end
