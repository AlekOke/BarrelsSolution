//
//  BSAbstractSearcher.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;
#import "BSSolutionSearcherProtocol.h"

static NSUInteger kBSSearcherDefaultDepthLimit = 500;

@interface BSAbstractSearcher : NSObject <BSSolutionSearcher>

// 

@end
