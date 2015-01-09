//
//  ViewController.m
//  UIActivityViewController
//
//  Created by Hau Nguyen on 9/10/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"
#import "StringReverserActivity.h"

@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *buttonShare;
@property (nonatomic, strong) UIActivityViewController *activityViewController;
@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self createTextField];
  [self createButton];

//  NSArray *itemsToShare = @[
//                            @"Item 1",
//                            @"Item 2",
//                            @"Item 3",
//                            ];
//  UIActivityViewController *activity =
//  [[UIActivityViewController alloc]
//   initWithActivityItems:itemsToShare
//   applicationActivities:@[[StringReverserActivity new]]];
//  [self presentViewController:activity animated:YES completion:nil];
  
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}

- (void) handleShare:(id)paramSender{
  if ([self.textField.text length] == 0){
    NSString *message = @"Please enter a text and then press Share";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                           message:message
                           delegate:nil
                           cancelButtonTitle:@"OK"
                           otherButtonTitles:nil];
    [alertView show];
    return;
  }
//  self.activityViewController = [[UIActivityViewController alloc]
//                                 initWithActivityItems:@[self.textField.text]
//                                 applicationActivities:nil];
//  [self presentViewController:self.activityViewController animated:YES completion:^{}];
  NSArray *itemsToShare = @[
                            @"Item 1",
                            @"Item 2",
                            @"Item 3",
                            ];
  UIActivityViewController *activity =
  [[UIActivityViewController alloc]
   initWithActivityItems:itemsToShare
   applicationActivities:@[[StringReverserActivity new]]];
  [self presentViewController:activity animated:YES completion:nil];
}


- (void) createTextField{
  self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f,
                                                                 35.0f,
                                                                 280.0f,
                                                                 30.0f)];
  self.textField.translatesAutoresizingMaskIntoConstraints = NO;
  self.textField.borderStyle = UITextBorderStyleRoundedRect;
  self.textField.placeholder = @"Enter text to share...";
  self.textField.delegate = self;
  [self.view addSubview:self.textField];
}
- (void) createButton{
  self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.buttonShare.translatesAutoresizingMaskIntoConstraints = NO;
  self.buttonShare.frame = CGRectMake(20.0f, 80.0f, 280.0f, 44.0f);
  [self.buttonShare setTitle:@"Share" forState:UIControlStateNormal];
  [self.buttonShare addTarget:self action:@selector(handleShare:)
             forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.buttonShare];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
