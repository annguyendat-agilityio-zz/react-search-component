//
//  ViewController.m
//  AutoLayout
//
//  Created by Hau Nguyen on 10/20/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
@interface ViewController ()
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (nonatomic, strong) NSTimer *animationTimer;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewWelcome;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcons;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUp;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOr;
@property (weak, nonatomic) IBOutlet UIButton *buttonSkip;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LogoConstraintTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconsConstraintTop;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated ;
{
  self.animationTimer = [NSTimer
                         scheduledTimerWithTimeInterval:2.0f
                         target:self
                         selector:@selector(animation:)
                         userInfo:nil
                         repeats:NO];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) animation:(NSTimer *)animationTimer{
  [UIView beginAnimations:@"animation" context:nil];
  [UIView setAnimationDuration:2.0f];
  [UIView setAnimationCurve:UIViewAnimationCurveLinear];
  [UIView setAnimationBeginsFromCurrentState:YES];
  self.imageViewWelcome.alpha = 0;
  self.LogoConstraintTop.constant = 62;
  self.iconsConstraintTop.constant = 193;
  self.buttonSignUp.alpha = 1;
  self.buttonLogin.alpha = 1;
  self.imageViewOr.alpha = 1;
  self.buttonSkip.alpha = 1;
  [self.view layoutIfNeeded];
  [UIView commitAnimations];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//  NSLog(@"%@", self.navigationController);
//}
@end
