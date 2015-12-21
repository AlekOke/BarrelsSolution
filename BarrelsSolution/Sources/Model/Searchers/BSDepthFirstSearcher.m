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

- (NSArray<BSNode *> *)searchSolutionWithNode:(BSNode *)node depth:(NSUInteger)depth
{
	NSArray<BSNode *> *solution = nil;
	
	if (depth < self.depthLimit)
	{
		NSLog(@"%@, depth: %i", node, depth);

		[self.visitedNodes addObject:node];
		
		if (![self.targetNodes containsObject:node])
		{
			BSNode *nextNode = nil;
			NSEnumerator *enumerator = [self.nodesFactory nodesWithCurrentNode:node];
			while (solution.count == 0 && (nextNode = [enumerator nextObject]))
			{
				if (![self.visitedNodes containsObject:nextNode])
				{
					solution = [self searchSolutionWithNode:nextNode depth:(depth + 1)];
				}
			}
			
			if (solution.count > 0)
			{
				solution = [@[node] arrayByAddingObjectsFromArray:solution];
			}
		}
		else
		{
			NSLog(@"Find solution %@, depth: %i", node, depth);
			solution = @[node];
		}
	}
	
	return solution;
}

@end
