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

@property (nonatomic, strong) id<BSSolutionSearcher> solutionSearcher;
@property (nonatomic, strong) NSArray<BSContainer *> *containers;
@property (nonatomic, strong) NSArray<BSNode *> *solution;
@property (nonatomic, assign) NSUInteger currentNodeIndex;

@property (nonatomic, strong) IBOutletCollection(UILabel) NSArray<UILabel *> *containerValuesLabels;
@property (nonatomic, strong) IBOutletCollection(UILabel) NSArray<UILabel *> *containerCapacityLabels;

// controls
@property (nonatomic, weak) IBOutlet UILabel *pageLabel;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;
@property (nonatomic, weak) IBOutlet UIButton *previousButton;

@end

@implementation BSViewController

- (void)updateWithCurrentNodeIndex:(NSUInteger)nodeIndex;
{
	self.currentNodeIndex = nodeIndex;
	BSNode *node = self.solution[nodeIndex];
	
	self.nextButton.enabled = self.currentNodeIndex != (self.solution.count - 1);
	self.previousButton.enabled = self.currentNodeIndex != 0;
	self.pageLabel.text = [NSString stringWithFormat:@"%i of %i", self.currentNodeIndex + 1, self.solution.count];
	
	for (NSUInteger containerIndex = 0; containerIndex < self.containers.count; containerIndex++)
	{
		BSContainer *container = self.containers[containerIndex];
		BSContainerState *containerState = node.states[container.name];
		
		self.containerValuesLabels[containerIndex].text = [NSString stringWithFormat:@"%i", containerState.value];
		self.containerCapacityLabels[containerIndex].text = [NSString stringWithFormat:@"(%i)", container.capasity];
	}
}

#pragma mark - Factory Methods

- (id<BSSolutionSearcher>)solutionSearcher
{
	return [[BSDepthFirstSearcher alloc] initWithContainers:self.containers];
}

#pragma mark - UIViewController

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
	
	BSViewController __weak *weakSelf = self;
	
	[self.solutionSearcher searchSolutionWithRootNode:rootNode targetNodes:[NSSet setWithObject:targetNode] completionBlock:^(NSArray<BSNode *> *solution, NSError *error)
	{
		BSViewController __strong *strongSelf = weakSelf;
		
		dispatch_async(dispatch_get_main_queue(), ^
		{
			strongSelf.solution = solution;
			[strongSelf updateWithCurrentNodeIndex:0];
		});
	}];
}

#pragma mark - IBAction

- (IBAction)onPrevious:(UIButton *)button
{
	[self updateWithCurrentNodeIndex:self.currentNodeIndex - 1];
}

- (IBAction)onNext:(UIButton *)button
{
	[self updateWithCurrentNodeIndex:self.currentNodeIndex + 1];
}

@end
