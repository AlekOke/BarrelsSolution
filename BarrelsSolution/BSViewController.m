//
//  ViewController.m
//  BarrelsSolution
//
//  Created by Aleksey Prukhodko on 12/18/15.
//  Copyright © 2015 Aleksey Prykhodko. All rights reserved.
//

#import "BSViewController.h"
#import "BSDepthFirstSearcher.h"
#import "BSNode.h"
#import "BSContainer.h"
#import "BSContainerState.h"

@interface BSViewController ()

@property (nonatomic, strong) NSArray<BSContainer *> *containers;
@property (nonatomic, strong) id<BSSolutionSearcher> solutionSearcher;

@end

@implementation BSViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.containers = @[
	   [[BSContainer alloc] initWithName:@"#1" capasity:6],
	   [[BSContainer alloc] initWithName:@"#2" capasity:3],
	   [[BSContainer alloc] initWithName:@"#3" capasity:7]
	];
	
	self.solutionSearcher = [self solutionSearcher];
	
	NSMutableDictionary<NSString *, BSContainerState *> *rootStates = [NSMutableDictionary dictionaryWithCapacity:self.containers.count];
	[rootStates setObject:[BSContainerState stateWithContainer:self.containers[0] value:4] forKey:self.containers[0].name];
	[rootStates setObject:[BSContainerState stateWithContainer:self.containers[1] value:0] forKey:self.containers[1].name];
	[rootStates setObject:[BSContainerState stateWithContainer:self.containers[2] value:6] forKey:self.containers[2].name];
	BSNode *rootNode = [[BSNode alloc] initWithStates:[rootStates copy]];

	NSMutableDictionary<NSString *, BSContainerState *> *targetStates = [NSMutableDictionary dictionaryWithCapacity:self.containers.count];
	[targetStates setObject:[BSContainerState stateWithContainer:self.containers[0] value:5] forKey:self.containers[0].name];
	[targetStates setObject:[BSContainerState stateWithContainer:self.containers[1] value:0] forKey:self.containers[1].name];
	[targetStates setObject:[BSContainerState stateWithContainer:self.containers[2] value:5] forKey:self.containers[2].name];
	BSNode *targetNode = [[BSNode alloc] initWithStates:[targetStates copy]];
	
	[self.solutionSearcher searchSolutionWithRootNode:rootNode targetNodes:[NSSet setWithObject:targetNode] completionBlock:^(NSArray<BSNode *> *solution, NSError *error)
	{
		NSLog(@"Result: %@", solution);
	}];
}

#pragma mark - 

- (id<BSSolutionSearcher>)solutionSearcher
{
	return [[BSDepthFirstSearcher alloc] initWithContainers:self.containers];
}

@end
