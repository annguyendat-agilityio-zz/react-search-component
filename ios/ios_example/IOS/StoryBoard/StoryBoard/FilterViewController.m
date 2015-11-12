//
//  FilterViewController.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController {
  CGFloat offsetX;
  CGFloat offsetY;
  CGFloat nextOffsetX;
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
  NSArray *category = [NSArray arrayWithObjects: @"Accessories", @"Bath & Beauty", @"Books", @"Electronics", @"Food", @"Gifts", @"Handbags", @"Home & Furniture", @"Jewelry", nil];
  offsetX = 12;
  offsetY = 0;
  nextOffsetX = 0;
  self.filterResults = [[NSMutableArray alloc] init];
  for (NSString *type in category) {
    UIButton *categoryItem = [self createCategoryItem: type];
    [self.gridView addSubview:categoryItem];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*****************************************************************************
#pragma mark -
#pragma mark **Handle Control**
- (UIButton *)createCategoryItem: (NSString *) item;
{
  UIButton *categoryItem = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  categoryItem.layer.borderWidth = 1;
  categoryItem.layer.borderColor = [UIColor lightGrayColor].CGColor;
  categoryItem.layer.cornerRadius = 16;
  [categoryItem setTitle: item forState:UIControlStateNormal];
  [categoryItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [categoryItem setBackgroundColor:[UIColor whiteColor]];
  float padding_button                = 6.0f;
  UIEdgeInsets titleInsets            = UIEdgeInsetsMake(0.0f, padding_button, 0.0f, -padding_button);
  UIEdgeInsets contentInsets          = UIEdgeInsetsMake(padding_button, 0.0f, padding_button, 0.0f);
  CGFloat extraWidthRequiredForTitle  = titleInsets.left - titleInsets.right;
  contentInsets.right += extraWidthRequiredForTitle;
  [categoryItem setTitleEdgeInsets:titleInsets];
  [categoryItem setContentEdgeInsets:contentInsets];
  [categoryItem sizeToFit];
  if (offsetX == 12 && offsetY == 0) {
    categoryItem.frame = CGRectMake( offsetX, offsetY, categoryItem.frame.size.width, categoryItem.frame.size.height);
    offsetX = offsetX + categoryItem.bounds.size.width + 10;
  } else {
    nextOffsetX = offsetX + categoryItem.bounds.size.width;
    if (nextOffsetX >= 320) {
      offsetX = 12;
      offsetY = offsetY + 40;
      categoryItem.frame = CGRectMake( offsetX, offsetY, categoryItem.frame.size.width, categoryItem.frame.size.height);
    }
    else
    {
      categoryItem.frame = CGRectMake( offsetX, offsetY, categoryItem.frame.size.width, categoryItem.frame.size.height);
    }
    offsetX = offsetX + categoryItem.bounds.size.width + 10;
  }
  [categoryItem addTarget:self action:@selector(selectCategory:) forControlEvents:UIControlEventTouchUpInside];
  return categoryItem;
}

- (IBAction)dismissModalView:(id)sender {
  [self.filterDelegate filterViewControllerDismissed:self.filterResults];
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selectCategory:(id)sender {
  UIButton *button = (UIButton *)sender;
  if (button.backgroundColor == [UIColor whiteColor]) {
    NSLog(@"active");
    [button setBackgroundColor:[UIColor colorWithRed:0.06274509803922 green:0.6156862745098 blue:1 alpha:1]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.filterResults addObject:button.titleLabel.text];
  }
  else
  {
    NSLog(@"Deactive");
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.filterResults removeObject:button.titleLabel.text];
  }
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