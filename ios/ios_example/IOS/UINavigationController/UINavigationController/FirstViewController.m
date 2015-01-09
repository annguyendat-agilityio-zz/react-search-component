//
//  FirstViewController.m
//  UINavigationController
//
//  Created by Hau Nguyen on 9/11/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()
@property (nonatomic, strong) UIButton *displaySecondViewController;
@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) performDisplaySecondViewController:(id)paramSender{
  SecondViewController *secondController = [[SecondViewController alloc]initWithNibName:nil bundle:NULL];
  [self.navigationController pushViewController:secondController animated:YES];
}

- (void) performAdd:(id)paramSender{
  NSLog(@"Action method got called.");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
  self.title = @"First Controller";
  
  self.displaySecondViewController = [UIButton buttonWithType:UIButtonTypeSystem];
  [self.displaySecondViewController setTitle:@"Display Second View Controller" forState: UIControlStateNormal];
  [self.displaySecondViewController sizeToFit];
  self.displaySecondViewController.center = self.view.center;
  [self.displaySecondViewController
   addTarget:self action:@selector(performDisplaySecondViewController:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.displaySecondViewController];
  
  // create navigation button
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemStop target:self action:@selector(performAdd:)];
  
//  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(95, 95, 100, 100)];
//  NSString *text = @"First View";
//  label.text = text;
//  [self.view addSubview:label];
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
