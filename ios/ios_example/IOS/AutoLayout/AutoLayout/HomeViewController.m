//
//  HomeViewController.m
//  AutoLayout
//
//  Created by Hau Nguyen on 10/27/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *header;

@end

@implementation HomeViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setHeader];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHeader;
{
  UIGraphicsBeginImageContext(self.header.frame.size);
  [[UIImage imageNamed:@"header-background"] drawInRect:self.header.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self.header.backgroundColor = [UIColor colorWithPatternImage: image];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
