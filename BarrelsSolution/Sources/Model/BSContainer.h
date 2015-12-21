//
//  BSContainer.h
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

@import Foundation;

@interface BSContainer : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign, readonly) NSUInteger capacity;

- (instancetype)initWithName:(NSString *)name capasity:(NSUInteger)capasity;

- (BOOL)isEqualToContainer:(BSContainer *)container;

@end
