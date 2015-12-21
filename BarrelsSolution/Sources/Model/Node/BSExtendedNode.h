//
//  BSExtendedNode.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/21/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@class BSNode;

@interface BSExtendedNode : NSObject

@property (nonatomic, strong) BSNode *viewedNode;
@property (nonatomic, strong) BSNode *parentNode;

+ (instancetype)extendedNodeWithViewedNode:(BSNode *)viewedNode parentNode:(BSNode *)parentNode;
- (instancetype)initWithViewedNode:(BSNode *)viewedNode parentNode:(BSNode *)parentNode;

- (BOOL)isEqualToExtendedNode:(BSExtendedNode *)extendedNode;

@end
