//
//  ViewController.m
//  UITableView
//
//  Created by Hau Nguyen on 9/30/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"

static NSString *TableViewCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> 
@property(nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
  
  self.myTableView.dataSource = self;
  self.myTableView.delegate = self;
  self.myTableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  [self.view addSubview:self.myTableView];
	// Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 10;
}
- (void) tableView:(UITableView* ) myTable accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
  NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
  UITableViewCell *ownerCell = [myTable cellForRowAtIndexPath:indexPath];
  NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = nil;
  if ([tableView isEqual:self.myTableView]){
    cell = [tableView
            dequeueReusableCellWithIdentifier:TableViewCellIdentifier
            forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:
                           @"Section %ld, Cell %ld",
                           (long)indexPath.section, (long)indexPath.row];
    cell.accessoryType = UITableViewCellEditingStyleInsert;
  }
  return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
