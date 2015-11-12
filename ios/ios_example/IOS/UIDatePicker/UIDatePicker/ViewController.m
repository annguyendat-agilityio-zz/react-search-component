//
//  ViewController.m
//  UIDatePicker
//
//  Created by Hau Nguyen on 9/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDatePicker *myDatePicker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.myDatePicker = [[UIDatePicker alloc] init];
  self.myDatePicker.center = self.view.center;
  [self.myDatePicker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
  self.myDatePicker.datePickerMode = UIDatePickerModeDate;
  
  NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
  NSDate *todayDate = [NSDate date];
  NSDate *oneYearFromToday = [todayDate
                              dateByAddingTimeInterval:oneYearTime];
  NSDate *twoYearsFromToday = [todayDate
                               dateByAddingTimeInterval:2 * oneYearTime];
  self.myDatePicker.minimumDate = oneYearFromToday;
  self.myDatePicker.maximumDate = twoYearsFromToday;
  
  [self.view addSubview:self.myDatePicker];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) datePickerDateChanged:(UIDatePicker *)paramDatePicker{
  if ([paramDatePicker isEqual:self.myDatePicker]){
    NSLog(@"Selected date = %@", paramDatePicker.date);
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
