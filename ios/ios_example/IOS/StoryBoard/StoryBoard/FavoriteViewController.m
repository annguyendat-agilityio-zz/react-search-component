//
//  FavoriteViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/16/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "FavoriteViewController.h"
#import "StoreTableViewCell.h"
#import "Store.h"
@interface FavoriteViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITabBarItem *favoriteTabBarItem;
@property (weak, nonatomic) IBOutlet UITableView *resultTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipsStoreSegmentedControl;
@property (nonatomic, retain) NSMutableArray *stores;
@end

@implementation FavoriteViewController
{
  int _tableType;
  enum {
    TipsTable,
    StoreTable
  } TableType;
};


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
  _tableType = TipsTable;
  self.stores = [Store parseData];
  self.resultTableView.delegate = self;
  self.resultTableView.dataSource = self;
  [self.tipsStoreSegmentedControl addTarget:self
                       action:@selector(segmentAction:)
             forControlEvents:UIControlEventValueChanged];
  [self.tipsStoreSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}
                              forState:UIControlStateNormal];
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
  if (_tableType == TipsTable) {
    return 7;
  }
  else {
    return 1;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  static NSString *TableViewCellIdentifier = @"Cell";
  StoreTableViewCell *cell = (StoreTableViewCell *)[self.resultTableView dequeueReusableCellWithIdentifier: TableViewCellIdentifier forIndexPath:indexPath];
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


//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**

- (IBAction)segmentAction:(id)sender {
  NSLog(@"click");
  switch (self.tipsStoreSegmentedControl.selectedSegmentIndex){
    case 0:
      _tableType = TipsTable;
      NSLog(@"1");
      [self.resultTableView reloadData];
      break;
      
    case 1:
      _tableType = StoreTable;
      NSLog(@"2");
      [self.resultTableView reloadData];
      break;
      
    default:
      break;
  }
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
