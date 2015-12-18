//
//  BSSolutionSearcherProtocol.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@class BSNode;

typedef void(^BSSolutionSearcherCompletionBlock)(NSArray<BSNode *> *solution, NSError *error);

@protocol BSSolutionSearcher <NSObject>

@property (nonatomic, strong) NSError *error;
@property (nonatomic, assign) NSUInteger depthLimit;

- (void)searchSolutionWithRootNode:(BSNode *)rootNode targetNodes:(NSSet<BSNode *> *)targetNodes completionBlock:(BSSolutionSearcherCompletionBlock)completionBlock;

@end
