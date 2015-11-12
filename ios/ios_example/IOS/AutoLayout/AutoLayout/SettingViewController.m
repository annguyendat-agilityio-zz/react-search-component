//
//  SettingViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/17/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;

@end

@implementation SettingViewController
{
  NSArray *titleArray;
  NSArray *iconsArray;
}

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
  self.settingTableView.dataSource = self;
  self.settingTableView.delegate = self;
  titleArray = [NSArray arrayWithObjects: @"Change Mall", @"Get Directions", @"FeedBack", @"Saved Stores Notification", @"Edit Profile", @"Change Password", @"Sign Out", nil];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//*****************************************************************************
#pragma mark -
#pragma mark **Creating table method**
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
  return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  SettingTableViewCell *cell;
  switch (indexPath.row) {
    case 0:
      cell = (SettingTableViewCell *)[self.settingTableView dequeueReusableCellWithIdentifier: @"SettingChangeMallCell" forIndexPath:indexPath];
      break;
    case 1:
      cell = (SettingTableViewCell *)[self.settingTableView dequeueReusableCellWithIdentifier: @"SettingGetDirectionsCell" forIndexPath:indexPath];
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      cell = (SettingTableViewCell *)[self.settingTableView dequeueReusableCellWithIdentifier: @"SettingFeedbackCell" forIndexPath:indexPath];
      [cell.settingTitle setText: [titleArray objectAtIndex:indexPath.row]];
      break;
    case 6:
      cell = (SettingTableViewCell *)[self.settingTableView dequeueReusableCellWithIdentifier: @"SettingSignOutCell" forIndexPath:indexPath];
      break;
    default:
      break;
  }
  
  //  SearchTableViewCell *cell = (SearchTableViewCell *)[self.searchTableView dequeueReusableCellWithIdentifier: TableViewCellIdentifier forIndexPath:indexPath];
  
  //  Mall *mall;
  //  if([tableView isEqual:self.searchDisplayController.searchResultsTableView])
  //  {
  //    mall = [self.searchResults objectAtIndex: indexPath.row];
  //  }
  //  else
  //  {
  //    mall = [self.malls objectAtIndex: indexPath.row];
  //  }
  //
  //  [cell.title setText: mall.title];
  //  [cell.detail setText: mall.detail];
  //  [cell.tips setText: mall.tips];
  
  if (indexPath.row % 2) {
    cell.backgroundColor = [UIColor colorWithHue:0.240 saturation:0.04 brightness:0.29 alpha:1];
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  return 54;
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
