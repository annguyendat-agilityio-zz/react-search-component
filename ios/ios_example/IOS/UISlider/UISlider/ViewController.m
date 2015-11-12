//
//  ViewController.m
//  UISlider
//
//  Created by Hau Nguyen on 9/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,0.0f,200.0f,23.0f)];
  self.slider.center = self.view.center;
  self.slider.minimumValue = 0.0f;
  self.slider.maximumValue = 100.0f;
  self.slider.value = self.slider.maximumValue / 2.0;
  self.slider.continuous = false;
  [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:self.slider];
  self.slider.minimumTrackTintColor = [UIColor redColor]; /* Set the tint color of the thumb */
  self.slider.maximumTrackTintColor = [UIColor greenColor]; /* Set the tint color of the maximum value */
  self.slider.thumbTintColor = [UIColor blackColor];
  
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)sliderValueChanged:(UISlider *)paramSender{
  if ([paramSender isEqual:self.slider]){
    NSLog(@"New value = %f", paramSender.value);
  }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
