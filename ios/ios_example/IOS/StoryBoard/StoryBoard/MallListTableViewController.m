//
//  MallListTableViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "MallListTableViewController.h"
#import "SearchTableViewCell.h"
#import "Mall.h"

@interface MallListTableViewController () <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@end

@implementation MallListTableViewController


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
  self.searchTableView.delegate = self;
  self.searchTableView.dataSource = self;
  [super viewDidLoad];
  self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
  self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillDisappear:(BOOL)animated;
{
  [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated;
{
  [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning;
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
  NSInteger rows = 0;
  
  if([tableView isEqual:self.searchDisplayController.searchResultsTableView])
  {
    rows = [self.searchResults count];
  }
  else
  {
    rows = [self.malls count];
  }
  return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  NSString *TableViewCellIdentifier = @"CustomCell";
  SearchTableViewCell *cell = (SearchTableViewCell *)[self.searchTableView dequeueReusableCellWithIdentifier: TableViewCellIdentifier forIndexPath:indexPath];
  Mall *mall;
  if([tableView isEqual:self.searchDisplayController.searchResultsTableView])
  {
    mall = [self.searchResults objectAtIndex: indexPath.row];
  }
  else
  {
    mall = [self.malls objectAtIndex: indexPath.row];
  }
  
  [cell.title setText: mall.title];
  [cell.detail setText: mall.detail];
  [cell.tips setText: mall.tips];
  
  if (indexPath.row % 2) {
    cell.backgroundColor = [UIColor whiteColor];
  }else {
    cell.backgroundColor = [UIColor colorWithRed:0.95686274509804 green:0.95686274509804 blue:0.95686274509804 alpha:1];
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  return 76;
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;
{
  NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"title contains[c] %@", searchText];
  self.searchResults = [self.malls filteredArrayUsingPredicate:resultPredicate];
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
//{
//  [self filterContentForSearchText:searchString
//                             scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
//                                    objectAtIndex:[self.searchDisplayController.searchBar
//                                                   selectedScopeButtonIndex]]];
//  
//  return YES;
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
