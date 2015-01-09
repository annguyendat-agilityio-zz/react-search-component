//
//  Complex.m
//  Chapter9
//
//  Created by Hau Nguyen on 8/12/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

// Implementation file for Complex class
#import "Complex.h"
@implementation Complex
@synthesize real, imaginary;
-(void) print {
    NSLog (@" %g + %gi ", real, imaginary); }
-(void) setReal: (double) a andImaginary: (double) b {
    real = a;
    imaginary = b; }
-(Complex *) add: (Complex *) f {
    Complex *result = [[Complex alloc] init];
    result.real = real + f.real;
    result.imaginary = imaginary + f.imaginary;
    return result; }
@end
