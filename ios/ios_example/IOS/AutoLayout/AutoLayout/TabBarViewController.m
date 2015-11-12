//
//  TabBarViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/16/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()
@property (weak, nonatomic) IBOutlet UITabBar *tabBarControl;
@end

@implementation TabBarViewController


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
  
//  UITabBarItem *tipsItem = [self.tabBarControl.items objectAtIndex:2];
//  UIImage *tipsItemSelectedImage = [UIImage imageNamed:@"tips-icon"];
//  tipsItem.selectedImage = [tipsItemSelectedImage
//                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//  [tipsItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0.98823529411765f green:0.31372549019608f blue:0.45490196078431f alpha:1]} forState:UIControlStateSelected];
//  
//  UITabBarItem *favoriteItem = [self.tabBarControl.items objectAtIndex:3];
//  UIImage *favoriteItemSelectedImage = [UIImage imageNamed:@"favorite-icon"];
//  favoriteItem.selectedImage = [favoriteItemSelectedImage
//                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//  [favoriteItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0.93725490196078f green:0.56862745098039 blue:0.09019607843137 alpha:1]} forState:UIControlStateSelected];
//  
//  UITabBarItem *settingItem = [self.tabBarControl.items objectAtIndex:4];
//  UIImage *settingItemSelectedImage = [UIImage imageNamed:@"setting-active-icon"];
//  settingItem.selectedImage = [settingItemSelectedImage
//                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//  [settingItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateSelected];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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
