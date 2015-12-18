//
//  BSDepthFirstSearcher.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSDepthFirstSearcher.h"
#import "BSAbstractSearcher_Private.h"

@interface BSDepthFirstSearcher ()

// empty

@end

@implementation BSDepthFirstSearcher

- (NSArray<BSNode *> *)searchSolutionWithCurrentNode:(BSNode *)rootNode depth:(NSUInteger)depth
{
	NSArray<BSNode *> *solution = nil;
	
	if (depth < self.depthLimit)
	{
		
	}
	
	return solution;
}

@end
