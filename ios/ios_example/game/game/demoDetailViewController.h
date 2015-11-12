//
//  demoDetailViewController.h
//  game
//
//  Created by Hau Nguyen on 8/8/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface demoDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
