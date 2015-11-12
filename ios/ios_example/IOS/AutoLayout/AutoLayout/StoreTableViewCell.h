//
//  StoreTableViewCell.h
//  StoryBoard
//
//  Created by Hau Nguyen on 10/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *tips;
@end
