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

@interface BSBreadthFirstSearcher ()

// empty

@end

@implementation BSBreadthFirstSearcher

- (NSArray<BSNode *> *)searchSolutionWithCurrentNode:(BSNode *)currentNode depth:(NSUInteger)depth
{
	NSArray<BSNode *> *solution = nil;
	
//	if (depth < self.depthLimit)
//	{
//		if (![self.targetNodes containsObject:currentNode])
//		{
//			NSSet<BSNode *> *nodes = [self.nodesFactory nodesWithCurrentNode:currentNode];
//			for (BSNode *nextNode in nodes)
//			{
//				if (![self.visitedNodes containsObject:nextNode])
//				{
//					solution = [self searchSolutionWithCurrentNode:currentNode depth:(depth + 1)];
//					if (solution.count > 0)
//					{
//						solution = [@[nextNode] arrayByAddingObjectsFromArray:solution];
//						break;
//					}
//				}
//			}
//		}
//		else
//		{
//			solution = @[currentNode];
//		}
//	}
	
	return solution;
}

@end
