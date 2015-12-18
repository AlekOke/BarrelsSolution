//
//  BSAbstractSearcher.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSAbstractSearcher.h"
#import "BSAbstractSearcher_Private.h"

static NSUInteger kBSSearcherInitialDepthLevel = 0;

@interface BSAbstractSearcher ()

// private
@property (nonatomic, strong) NSSet<BSNode *> *targetNodes;
@property (nonatomic, strong) NSMutableSet<BSNode *> *visitedNodes;
//

@end

@implementation BSAbstractSearcher

@synthesize error = _error;
@synthesize depthLimit = _depthLimit;
@synthesize visitedNodes = _visitedNodes;

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		self.depthLimit = kBSSearcherDefaultDepthLimit;
	}
	return self;
}

- (void)searchSolutionWithRootNode:(BSNode *)rootNode targetNodes:(NSSet<BSNode *> *)targetNodes completionBlock:(BSSolutionSearcherCompletionBlock)completionBlock
{
	self.targetNodes = targetNodes;
	self.visitedNodes = [NSMutableSet new];
	
	NSArray<BSNode *> *solution = [self searchSolutionWithCurrentNode:rootNode depth:kBSSearcherInitialDepthLevel];
	completionBlock(solution, self.error);
}

#pragma mark - Protected

- (NSArray<BSNode *> *)searchSolutionWithCurrentNode:(BSNode *)currentNode depth:(NSUInteger)depth
{
	@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%@ must be overridden", NSStringFromSelector(_cmd)] userInfo:nil];
}

@end
