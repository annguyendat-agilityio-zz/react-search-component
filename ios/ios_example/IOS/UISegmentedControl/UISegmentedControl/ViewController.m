//
//  ViewController.m
//  UISegmentedControl
//
//  Created by Hau Nguyen on 9/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  NSArray *segments = [[NSArray alloc] initWithObjects:
                       @"iPhone",
                       @"iPad",
                       @"iPod",
                       @"iMac", nil];
  self.mySegmentedControl = [[UISegmentedControl alloc]
                             initWithItems:segments];
  
  self.mySegmentedControl.center = self.view.center;
  [self.mySegmentedControl addTarget:self action:@selector(segmentChanged:)
                    forControlEvents:UIControlEventValueChanged];
  self.mySegmentedControl.momentary = YES;
  
  CGRect segmentedFrame = self.mySegmentedControl.frame;
  segmentedFrame.size.height = 128.0f;
  segmentedFrame.size.width = 300.0f;
  self.mySegmentedControl.frame = segmentedFrame;

  [self.view addSubview:self.mySegmentedControl];
  
	// Do any additional setup after loading the view, typically from a nib.
}
- (void) segmentChanged:(UISegmentedControl *)paramSender{
  if ([paramSender isEqual:self.mySegmentedControl])
  {
    NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex];
    NSString  *selectedSegmentText = [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
    NSLog(@"Segment %ld with %@ text is selected", (long)selectedSegmentIndex, selectedSegmentText);
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
