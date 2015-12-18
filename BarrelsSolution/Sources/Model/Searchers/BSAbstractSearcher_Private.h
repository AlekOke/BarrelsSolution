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

@interface BSAbstractSearcher (Private)

@property (nonatomic, strong) NSSet<BSNode *> *targetNodes;
@property (nonatomic, strong) NSMutableSet<BSNode *> *visitedNodes;

- (NSArray<BSNode *> *)searchSolutionWithCurrentNode:(BSNode *)currentNode depth:(NSUInteger)depth;

@end

