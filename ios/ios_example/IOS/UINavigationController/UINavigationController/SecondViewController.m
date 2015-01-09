//
//  SecondViewController.m
//  UINavigationController
//
//  Created by Hau Nguyen on 9/11/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) goBack{
  /* Get the current array of View Controllers */
  NSArray *currentControllers = self.navigationController.viewControllers;
  /* Create a mutable array out of this array */
  NSMutableArray *newControllers = [NSMutableArray
                                    arrayWithArray:currentControllers];
  /* Remove the last object from the array */
  [newControllers removeLastObject];
  /* Assign this array to the Navigation Controller */
  [self.navigationController setViewControllers:newControllers
                                       animated:YES];
//  self.navigationController.viewControllers = newControllers;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.title = @"Second View";
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(95, 95, 100, 100)];
  NSString *text = @"Second View";
  label.text = text;
  [self.view addSubview:label];
  [self performSelector:@selector(goBack) withObject:nil afterDelay:5.0f];

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
