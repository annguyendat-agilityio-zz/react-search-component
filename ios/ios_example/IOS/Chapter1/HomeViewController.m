//
//  HomeViewController.m
//  Chapter1
//
//  Created by Hau Nguyen on 9/8/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize alert;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
  
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  
  if (self) {
    
    // Custom initialization
    
  }
  
  return self;
  
}

- (void)viewDidLoad

{
  
  [super viewDidLoad];
  
  // Do any additional setup after loading the view from its nib.
  
}

- (void)didReceiveMemoryWarning

{
  
  [super didReceiveMemoryWarning];
  
  // Dispose of any resources that can be recreated.
  
}

- (IBAction)alertViewAction:(id)sender

{
  
  if([sender tag] == 0)
    
  {
    
    // Simple Alert View
    
    alert = [[UIAlertView alloc] initWithTitle:@"Simple AlertView" message:nil       delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    alert.tag = 0;
    
    [alert show];
    
  }
  
  else if([sender tag] == 1)
    
  {
    
    // AlertView With Option
    
    alert = [[UIAlertView alloc] initWithTitle:@"AlertView With Option" message:nil delegate:self cancelButtonTitle:@"Got It" otherButtonTitles:@"Not Sure",nil];
    
    alert.tag = 1;
    
    [alert show];
    
  }
  
  else if([sender tag] == 2)
    
  {   // AlertView with User Input
    
    alert = [[UIAlertView alloc] initWithTitle:@"AlertView with User Input" message:@"Enter Username" delegate:self cancelButtonTitle:@"Login" otherButtonTitles:@"Cancel",nil];
    
    alert.tag = 2;
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
  }
  
  else if([sender tag] == 3)
    
  {   // AlertView With Login Form
    
    alert = [[UIAlertView alloc] initWithTitle:@"AlertView With Login Form" message:@"Enter Username and Password" delegate:self cancelButtonTitle:@"Login" otherButtonTitles:@"Cancel",nil];
    
    alert.tag = 3;
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    [alert show];
    
  }
  
  else if([sender tag] == 4)
    
  {
    
    // AlertView With PasswordField
    
    alert = [[UIAlertView alloc] initWithTitle:@"AlertView With PasswordField" message:@"Enter Password" delegate:self cancelButtonTitle:@"Login"              otherButtonTitles:@"Cancel",nil];
    
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    
    alert.tag = 4;
    
    [alert show];
    
  }
  
}

#pragma - mark AlertView Delegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
  
  if(alertView.tag == 0)
    
  {
    
    if(buttonIndex == 0) // Simple AlertView
      
    {
      
      // Ok Button Clicked
      
    }
    
  }
  
  else if(alertView.tag == 1) // AlertView with options
    
  {
    
  }
  
  else if(alertView.tag == 2) // AlertView with user input
    
  {
    
  }
  
  else if(alertView.tag == 3) // AlertView login form
    
  {
    
  }
  
  else if(alertView.tag == 4) // AlertView with password field
    
  {
    
  }
  
}

@end