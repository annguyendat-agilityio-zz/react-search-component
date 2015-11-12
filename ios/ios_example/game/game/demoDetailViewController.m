//
//  demoDetailViewController.m
//  game
//
//  Created by Hau Nguyen on 8/8/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "demoDetailViewController.h"

@interface demoDetailViewController ()
- (void)configureView;
@end

@implementation demoDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
