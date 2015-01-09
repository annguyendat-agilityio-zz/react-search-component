//
//  StoreViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "StoreViewController.h"
#import "Store.h"
#import "StoreTableViewCell.h"

@interface StoreViewController () <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
//@property (weak, nonatomic) IBOutlet UIView *mainView;
//@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, retain) NSMutableArray *stores;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
//@property (weak, nonatomic) IBOutlet UIButton *filterButton;
//@property (weak, nonatomic) IBOutlet UIView *filterSearchView;
//@property (weak, nonatomic) IBOutlet UIView *tableView;
@end

@implementation StoreViewController {
  CGFloat categoryOffsetX;
  CGFloat categoryOffsetY;
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
  self.searchTableView.delegate = self;
  self.searchTableView.dataSource = self;
  self.stores = [Store parseData];
  [self.backButton setAction:@selector(perform:)];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated;
{
  [self.navigationController setNavigationBarHidden:YES];
}

//*****************************************************************************
#pragma mark -
#pragma mark **Creating table method**
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
  // Return the number of sections.
  return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
  
  return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  NSString *TableViewCellIdentifier = @"Cell";
  StoreTableViewCell *cell = (StoreTableViewCell *)[self.searchTableView dequeueReusableCellWithIdentifier: TableViewCellIdentifier forIndexPath:indexPath];
  Store *store;
  store = [self.stores objectAtIndex: indexPath.row];
  [cell.title setText: store.title];
  //  [cell.image setImage:[UIImage imageNamed: @"item-icon.png"]];
  [cell.tips setText: store.tips];
  if (indexPath.row % 2) {
    cell.backgroundColor = [UIColor whiteColor];
  }else {
    cell.backgroundColor = [UIColor colorWithRed:0.95686274509804 green:0.95686274509804 blue:0.95686274509804 alpha:1];
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  return 54;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return 17;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.searchTableView.bounds.size.width, 30)];
  [headerView setBackgroundColor:[UIColor colorWithRed:0.06274509803922 green:0.6156862745098 blue:1 alpha:1]];
  UILabel *myLabel = [[UILabel alloc] init];
  myLabel.frame = CGRectMake(16, 5, 320, 9);
  myLabel.font = [UIFont boldSystemFontOfSize:11.32];
  myLabel.text = @"A";
  [headerView addSubview:myLabel];
  return headerView;
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
- (void) perform:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

//- (IBAction)showFilterView:(id)sender {
//  FilterViewController *filterView= [[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"FilterViewController"];
//  filterView.filterDelegate = self;
//  [self presentViewController:filterView animated:YES completion:nil];
//}

//- (void)filterViewControllerDismissed:(NSMutableArray *)filterResults;
//{
//  categoryOffsetX = 10;
//  categoryOffsetY = 10;
//  if (filterResults.count > 0) {
//    UIView *filterView=[[UIView alloc] initWithFrame: CGRectMake(0, 37, 320, 44)];
//    CALayer *topBorder = [CALayer layer];
//    topBorder.frame = CGRectMake(0.0f, 0, filterView.frame.size.width, 1.0f);
//    topBorder.backgroundColor = [UIColor colorWithRed:0.36078431372549 green:0.36078431372549 blue:0.36078431372549 alpha:1].CGColor;
//    [filterView.layer addSublayer:topBorder];
//    [filterView setBackgroundColor:[UIColor whiteColor]];
//    //      [filterView addSubview: [self createFilterItem:item]];
//    [self.filterSearchView setFrame: CGRectMake( self.filterSearchView.frame.origin.x, self.filterSearchView.frame.origin.y, self.filterSearchView.frame.size.width, 80)];
//    NSLog(@"%f", filterView.frame.origin.y);
//    [self.filterSearchView addSubview:filterView];
//    self.tableView.frame = CGRectMake( self.tableView.frame.origin.x, 164, self.tableView.frame.size.width, self.tableView.frame.size.height);
//    
//    for (NSString *item in filterResults) {
//      [filterView addSubview: [self createFilterItem:item]];
//    }
//  }
//}

- (UIButton *)createFilterItem: (NSString *) item;
{
  CGFloat nextOffsetX = 0;
  UIButton *categoryItem = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  categoryItem.layer.cornerRadius = 12;
  [categoryItem setTitle: item forState:UIControlStateNormal];
  [categoryItem setBackgroundColor:[UIColor colorWithRed:0.06274509803922 green:0.6156862745098 blue:1 alpha:1]];
  [categoryItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  float paddingButton                = 3.0f;
  UIEdgeInsets titleInsets            = UIEdgeInsetsMake(3.0f, paddingButton, 3.0f, -paddingButton);
  UIEdgeInsets contentInsets          = UIEdgeInsetsMake(paddingButton, 3.0f, paddingButton, 3.0f);
  CGFloat extraWidthRequiredForTitle  = titleInsets.left - titleInsets.right;
  contentInsets.right += extraWidthRequiredForTitle;
  [categoryItem setTitleEdgeInsets:titleInsets];
  [categoryItem setContentEdgeInsets:contentInsets];
  [categoryItem sizeToFit];
  if (categoryOffsetX == 12 && categoryOffsetY == 0) {
    categoryItem.frame = CGRectMake(categoryOffsetX, categoryOffsetY, categoryItem.frame.size.width, categoryItem.frame.size.height);
    categoryOffsetX = categoryOffsetX + categoryItem.bounds.size.width + 10;
  }
  else
  {
    nextOffsetX = categoryOffsetX + categoryItem.bounds.size.width;
    if (nextOffsetX >= 320) {
      categoryOffsetX = 12;
      categoryOffsetY = categoryOffsetY + 40;
      categoryItem.frame = CGRectMake( categoryOffsetX, categoryOffsetY, categoryItem.frame.size.width, categoryItem.frame.size.height);
    }
    else
    {
      categoryItem.frame = CGRectMake( categoryOffsetX, categoryOffsetY, categoryItem.frame.size.width, categoryItem.frame.size.height);
    }
    categoryOffsetX = categoryOffsetX + categoryItem.bounds.size.width + 10;
  }
  return categoryItem;
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
