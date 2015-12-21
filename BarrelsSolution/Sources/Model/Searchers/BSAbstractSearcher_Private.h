//
//  BSAbstractSearcher_Private.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;
#import "BSAbstractSearcher.h"

@class BSNode;
@class BSContainer;
@class BSNodesFactory;

@interface BSAbstractSearcher (Private)

@property (nonatomic, strong) NSSet<BSNode *> *targetNodes;
@property (nonatomic, strong) NSMutableSet<BSNode *> *visitedNodes;
@property (nonatomic, strong) BSNodesFactory *nodesFactory;

+ (NSError *)solutionNotFoundErrorWithUserInfo:(NSDictionary *)userInfo;
+ (NSError *)depthLimitOutErrorWithUserInfo:(NSDictionary *)userInfo;

- (NSArray<BSNode *> *)searchSolutionWithNode:(BSNode *)node depth:(NSUInteger)depth;

@end

