//
//  FilterViewController.h
//  StoryBoard
//
//  Created by Hau Nguyen on 10/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FilterViewDelegate <NSObject>
- (void)filterViewControllerDismissed:(NSMutableArray *)filterResults;
@end

@interface FilterViewController : UIViewController
@property (nonatomic, assign) id <FilterViewDelegate>  filterDelegate;
@property (weak, nonatomic) IBOutlet UIView *gridView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) NSMutableArray *filterResults;
@end

