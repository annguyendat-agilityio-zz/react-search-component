//
//  WelcomeViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/6/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "WelcomeViewController.h"
#import "Mall.h"

@interface WelcomeViewController ()
@property (nonatomic, strong) NSTimer *animationTimer;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewWelcome;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcons;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUp;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOr;
@property (weak, nonatomic) IBOutlet UIButton *buttonSkip;
@end

@implementation WelcomeViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.animationTimer = [NSTimer
                        scheduledTimerWithTimeInterval:2.0f
                        target:self
                        selector:@selector(animation:)
                        userInfo:nil
                         repeats:NO];
  
  NSMutableArray *malls = [Mall parseData];
  Mall *mall = [malls objectAtIndex:1];
  NSLog(@"name %@", mall.title);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) animation:(NSTimer *)animationTimer{
  [UIView beginAnimations:@"animation" context:nil];
  [UIView setAnimationDuration:1.0f];
  [UIView setAnimationCurve:UIViewAnimationCurveLinear];
  [UIView setAnimationBeginsFromCurrentState:YES];
  CGRect endRect;
  endRect.origin.x = 65;
  endRect.origin.y = 62;
  endRect.size = CGSizeMake(190, 83);
  [self.imageViewLogo setFrame:endRect];
  self.imageViewWelcome.alpha = 0;
  endRect.origin.x = 49;
  endRect.origin.y = 193;
  endRect.size = CGSizeMake(222, 90);
  [self.imageViewIcons setFrame:endRect];
  self.buttonSignUp.alpha = 1;
  self.buttonLogin.alpha = 1;
  self.imageViewOr.alpha = 1;
  self.buttonSkip.alpha = 1;
  [UIView commitAnimations];
}
@end
