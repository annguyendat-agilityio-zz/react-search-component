//
//  demoViewController.m
//  Chapter1
//
//  Created by Hau Nguyen on 9/4/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "demoViewController.h"

@interface demoViewController ()

@end

@implementation demoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewDidAppear:(BOOL)paramAnimated{
    [super viewDidAppear:paramAnimated];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Alert"
                              message:@"You've been delivered an alert"
                              delegate:nil
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Ok", nil];
    [alertView show];
}
@end
