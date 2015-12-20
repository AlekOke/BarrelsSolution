//
//  BSNodesFactory.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@class BSNode;
@class BSContainer;

@interface BSNodesFactory : NSObject

- (instancetype)initWithContainers:(NSArray<BSContainer *> *)containers;

- (NSEnumerator<BSNode *> *)nodesWithCurrentNode:(BSNode *)node;

@end
