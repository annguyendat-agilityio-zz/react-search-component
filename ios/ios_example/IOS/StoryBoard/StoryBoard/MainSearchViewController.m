//
//  MainSearchViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "MainSearchViewController.h"
#import "MallListTableViewController.h"
#import "Mall.h"

@interface MainSearchViewController ()  <UISearchBarDelegate>
@property (strong, nonatomic) MallListTableViewController *mallListTableViewController;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcons;
@property (weak, nonatomic) IBOutlet UILabel *labelSearchInfo;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation MainSearchViewController

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
    self.searchBar.delegate = self;
}

- (void)didReceiveMemoryWarning;
{
  [super didReceiveMemoryWarning];
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
- (void)searchBarTextDidBeginEditing:(UISearchBar*)searchBar;
{
  self.imageViewIcons.image = [UIImage imageNamed: @"signUpIcons.png"];
  self.imageViewIcons.frame = CGRectMake(51, 160, 215, 37);
  self.labelSearchInfo.frame = CGRectMake(0, 232, self.view.frame.size.width, 21);
  self.searchBar.frame = CGRectMake(31, 259, 251, 60);
}

-(void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event;
{
  NSArray *subviews = [self.view subviews];
  for (id objects in subviews) {
    if ([objects isKindOfClass:[UISearchBar class]]) {
      UISearchBar *searchBar = objects;
      if ([objects isFirstResponder]) {
        [searchBar resignFirstResponder];
        self.imageViewIcons.image = [UIImage imageNamed: @"icons.png"];
        self.imageViewIcons.frame = CGRectMake(51, 165, 223, 90);
        self.labelSearchInfo.frame = CGRectMake(0, 310, self.view.frame.size.width, 21);
        self.searchBar.frame = CGRectMake(31, 338, 251, 60);
      }
    }
  }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
  [self.searchBar resignFirstResponder];
  self.mallListTableViewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"MallListTableViewController"];
  self.mallListTableViewController.malls = [Mall parseData];
  [self.navigationController pushViewController:self.mallListTableViewController animated:YES];
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
