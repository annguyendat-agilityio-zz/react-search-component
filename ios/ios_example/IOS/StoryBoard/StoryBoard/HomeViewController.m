//
//  HomeViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/8/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation HomeViewController

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
    [self setHeader];
    [super viewDidLoad];
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning;
{
  [super didReceiveMemoryWarning];
}

- (void)setHeader;
{
  UIGraphicsBeginImageContext(self.header.frame.size);
  [[UIImage imageNamed:@"header-background.png"] drawInRect:self.header.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self.header.backgroundColor = [UIColor colorWithPatternImage: image];
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
