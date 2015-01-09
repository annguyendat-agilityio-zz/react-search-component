//
//  ViewController.m
//  UIPicker
//
//  Created by Hau Nguyen on 9/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *myPicker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.myPicker = [[UIPickerView alloc] init];
  self.myPicker.dataSource = self;
  self.myPicker.delegate = self;
  self.myPicker.showsSelectionIndicator = YES;
  self.myPicker.center = self.view.center;
  [self.view addSubview:self.myPicker];
	// Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  if ([pickerView isEqual:self.myPicker]){
    return 1;
  }
  return 0;
}
-(NSInteger) pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
  if ([pickerView isEqual:self.myPicker]){
    return 10;
  }
  return 0;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
  NSLog(@"%d", [self.myPicker selectedRowInComponent:0]);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
  if ([pickerView isEqual:self.myPicker]){
  /* Row is zero-based and we want the first row (with index 0) to be rendered as Row 1, so we have to +1 every row index */
  return [NSString stringWithFormat:@"Row %ld", (long)row + 1];
  }
  return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
