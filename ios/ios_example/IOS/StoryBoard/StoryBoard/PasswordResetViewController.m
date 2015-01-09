//
//  PasswordResetViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/7/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "PasswordResetViewController.h"

@interface PasswordResetViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;

@end

@implementation PasswordResetViewController

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
}

- (void)didReceiveMemoryWarning;
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
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
