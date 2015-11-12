//
//  MallListTableViewController.h
//  StoryBoard
//
//  Created by Hau Nguyen on 10/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallListTableViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (nonatomic, retain) NSMutableArray *malls;
@property (weak, nonatomic) NSArray *searchResults;
@end
