//
//  demoViewController.m
//  Switch
//
//  Created by Hau Nguyen on 9/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "demoViewController.h"

@interface demoViewController ()
@property (nonatomic, strong) UISwitch *mainSwitch;
@end

@implementation demoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  self.mainSwitch = [[UISwitch alloc] initWithFrame:
                     CGRectMake(100, 100, 0, 0)];
  
  [self.mainSwitch setOn:YES];
  [self.mainSwitch addTarget:self action:@selector(switchIssChanged:)
            forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:self.mainSwitch];
  
  self.mainSwitch.tintColor = [UIColor redColor];
  self.mainSwitch.onTintColor = [UIColor brownColor];
  self.mainSwitch.thumbTintColor = [UIColor greenColor];
  
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) switchIssChanged:(UISwitch *)paramSender{
  NSLog(@"Sender is = %@", paramSender);
  if ([paramSender isOn]){
    NSLog(@"The switch is turned on.");
  }else{
    NSLog(@"The switch is turned off.");
  }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
