//
//  demoViewController.m
//  Alert
//
//  Created by Hau Nguyen on 9/8/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "demoViewController.h"

@interface demoViewController ()

@end

@implementation demoViewController
- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
  NSString *message = @"Are you sure you want to open this link in Safari?";
  self.view.backgroundColor = [UIColor whiteColor];
  UIAlertView *alertView = [[UIAlertView alloc]
                            initWithTitle:@"Open Link"
                            message:message
                            delegate:self
                            cancelButtonTitle:[self noButtonTitle]
                            otherButtonTitles:[self yesButtonTitle], nil];
  [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
  UITextField *textField = [alertView textFieldAtIndex:0];
  textField.keyboardType = UIKeyboardTypeNumberPad;
  [alertView show];
}
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
  if ([buttonTitle isEqualToString:[self yesButtonTitle]]){
    NSLog(@"User pressed the Yes button.");
  }
  else if ([buttonTitle isEqualToString:[self noButtonTitle]]){
    NSLog(@"User pressed the No button.");
  }
}
- (NSString *) yesButtonTitle{
  return @"Yes";
}
- (NSString *) noButtonTitle{
  return @"No";
}

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

@end
