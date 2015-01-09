//
//  SignUpViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/7/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcons;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUp;
@property (weak, nonatomic) IBOutlet UITextField *textFieldConfirmPassword;
@end

@implementation SignUpViewController

//*****************************************************************************
#pragma mark -
#pragma mark **Life Cicle of View**
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad;
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning;
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
- (IBAction)closeModal:(id)sender;
{
  [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)textFieldFocus:(id)sender;
{
  [self.imageViewLogo setFrame:CGRectMake(112, 56, 96, 42)];
  self.imageViewIcons.alpha = 0;
  [self.textFieldEmail setFrame:CGRectMake(42, 125, 234, 40)];
  [self.textFieldPassword setFrame:CGRectMake(42, 177, 234, 40)];
  [self.textFieldConfirmPassword setFrame:CGRectMake(42, 230, 234, 40)];
  [self.buttonSignUp setFrame:CGRectMake(42, 284, 234, 40)];
}

-(void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
  NSArray *subviews = [self.view subviews];
  for (id objects in subviews) {
    if ([objects isKindOfClass:[UITextField class]]) {
      UITextField *theTextField = objects;
      if ([objects isFirstResponder]) {
        [theTextField resignFirstResponder];
        [self.imageViewLogo setFrame:CGRectMake(92, 60, 136, 60)];
        self.imageViewIcons.alpha = 1;
        [self.textFieldEmail setFrame:CGRectMake(42, 235, 234, 40)];
        [self.textFieldPassword setFrame:CGRectMake(42, 287, 234, 40)];
        [self.textFieldConfirmPassword setFrame:CGRectMake(42, 340, 234, 40)];
        [self.buttonSignUp setFrame:CGRectMake(42, 394, 234, 40)];
      }
    }
  }
}

@end
