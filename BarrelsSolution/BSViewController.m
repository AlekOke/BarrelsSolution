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

// container 1
@property (nonatomic, weak) IBOutlet UILabel *containerNameLabel1;
@property (nonatomic, weak) IBOutlet UILabel *containerCapacityLabel1;
@property (nonatomic, weak) IBOutlet UILabel *containerValueLabel1;

// container 2
@property (nonatomic, weak) IBOutlet UILabel *containerNameLabel2;
@property (nonatomic, weak) IBOutlet UILabel *containerCapacityLabel2;
@property (nonatomic, weak) IBOutlet UILabel *containerValueLabel2;

// container 3
@property (nonatomic, weak) IBOutlet UILabel *containerNameLabel3;
@property (nonatomic, weak) IBOutlet UILabel *containerCapacityLabel3;
@property (nonatomic, weak) IBOutlet UILabel *containerValueLabel3;

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
	
	// update controls
	self.nextButton.enabled = self.currentNodeIndex != (self.solution.count - 1);
	self.previousButton.enabled = self.currentNodeIndex != 0;
	self.pageLabel.text = [NSString stringWithFormat:@"%i of %i", self.currentNodeIndex + 1, self.solution.count];
	
	// update container 1
	BSContainerState *containerState1 = node.states[self.containers[0].name];
	self.containerNameLabel1.text = self.containers[0].name;
	self.containerCapacityLabel1.text = [NSString stringWithFormat:@"%i", self.containers[0].capasity];
	self.containerValueLabel1.text = [NSString stringWithFormat:@"%i", containerState1.value];
	
	// update container 2
	BSContainerState *containerState2 = node.states[self.containers[1].name];
	self.containerNameLabel2.text = self.containers[1].name;
	self.containerCapacityLabel2.text = [NSString stringWithFormat:@"%i", self.containers[1].capasity];
	self.containerValueLabel2.text = [NSString stringWithFormat:@"%i", containerState2.value];
	
	// update container 3
	BSContainerState *containerState3 = node.states[self.containers[2].name];
	self.containerNameLabel3.text = self.containers[2].name;
	self.containerCapacityLabel3.text = [NSString stringWithFormat:@"%i", self.containers[2].capasity];
	self.containerValueLabel3.text = [NSString stringWithFormat:@"%i", containerState3.value];
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
