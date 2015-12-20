//
//  BSAbstractSearcher.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSAbstractSearcher.h"
#import "BSAbstractSearcher_Private.h"
#import "BSNodesFactory.h"

static NSUInteger kBSSearcherInitialDepthLevel = 0;

@interface BSAbstractSearcher ()

// private
@property (nonatomic, strong) NSSet<BSNode *> *targetNodes;
@property (nonatomic, strong) NSMutableSet<BSNode *> *visitedNodes;
@property (nonatomic, strong) BSNodesFactory *nodesFactory;
//

@end

@implementation BSAbstractSearcher

@synthesize containers = _containers;
@synthesize error = _error;
@synthesize depthLimit = _depthLimit;
@synthesize visitedNodes = _visitedNodes;
@synthesize nodesFactory = _nodesFactory;

- (instancetype)initWithContainers:(NSArray<BSContainer *> *)containers
{
	self = [super init];
	if (self)
	{
		self.nodesFactory = [[BSNodesFactory alloc] initWithContainers:containers];
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

+ (NSError *)solutionNotFoundErrorWithUserInfo:(NSDictionary *)userInfo
{
	return [NSError errorWithDomain:kBSSolutionSearcherErrorDomain code:kBSSolutionSearcherErrorSolutionNotFound userInfo:userInfo];
}

+ (NSError *)depthLimitOutErrorWithUserInfo:(NSDictionary *)userInfo
{
	return [NSError errorWithDomain:kBSSolutionSearcherErrorDomain code:kBSSolutionSearcherErrorDepthLimitOut userInfo:userInfo];
}

- (NSArray<BSNode *> *)searchSolutionWithCurrentNode:(BSNode *)currentNode depth:(NSUInteger)depth
{
	@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%@ must be overridden", NSStringFromSelector(_cmd)] userInfo:nil];
}

@end
