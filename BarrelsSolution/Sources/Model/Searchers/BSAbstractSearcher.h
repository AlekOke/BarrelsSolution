//
//  BSAbstractSearcher.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;
#import "BSSolutionSearcherProtocol.h"

@class BSContainer;

@interface BSAbstractSearcher : NSObject <BSSolutionSearcher>

- (instancetype)initWithContainers:(NSArray<BSContainer *> *)containers;

@end
