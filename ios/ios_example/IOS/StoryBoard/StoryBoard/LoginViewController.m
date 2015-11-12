//
//  SignUpViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/6/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonResetPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcons;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;

- (IBAction)close:(id)sender;
@end

@implementation LoginViewController

//*****************************************************************************
#pragma mark -
#pragma mark **Life Cicle of View**
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
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
    // Do any additional setup after loading the view.
  [self.buttonResetPassword.titleLabel setFont:[UIFont fontWithName:@"Proxima Nova Alt" size:13.575f]];
}

- (void)didReceiveMemoryWarning;
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
- (IBAction)tfFocus:(id)sender {
  [self.imageViewLogo setFrame:CGRectMake(112,56,96,42)];
  self.imageViewIcons.alpha = 0;
  [self.textFieldUsername setFrame:CGRectMake(42, 142, 234, 40)];
  [self.textFieldPassword setFrame:CGRectMake(42, 194, 234, 40)];
  [self.buttonLogin setFrame:CGRectMake(42, 247, 234, 40)];
  [self.buttonResetPassword setFrame:CGRectMake(110, 302, 99, 23)];
}

- (IBAction)close:(id)sender;
{
  [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event;
{
  NSArray *subviews = [self.view subviews];
  for (id objects in subviews) {
    if ([objects isKindOfClass:[UITextField class]]) {
      UITextField *theTextField = objects;
      if ([objects isFirstResponder]) {
        [theTextField resignFirstResponder];
        [self.imageViewLogo setFrame:CGRectMake(92,60,136,60)];
        self.imageViewIcons.alpha = 1;
        [self.textFieldUsername setFrame:CGRectMake(42, 249, 234, 40)];
        [self.textFieldPassword setFrame:CGRectMake(42, 301, 234, 40)];
        [self.buttonLogin setFrame:CGRectMake(42, 355, 234, 40)];
        [self.buttonResetPassword setFrame:CGRectMake(110, 410, 99, 23)];
      }
    }
  }
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
