//
//  Fraction.m
//  Chapter7
//
//  Created by Hau Nguyen on 8/6/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

//
// Fraction.m
// FractionTest //
// Created by Steve Kochan on 9/29/11.
// Copyright (c) ClassroomM, Inc. All rights reserved. //
#import "Fraction.h"

@implementation Fraction
@synthesize numerator, denominator;
-(void) print {
    NSLog (@"%i/%i", numerator, denominator);
}

-(int) showPage {
    static int pageCount = 0;
    ++pageCount;
    return pageCount;
}

-(double) convertToNum {
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}
-(void) setTo: (int) n : (int) d {
    numerator = n;
    denominator = d;
}
- (void) reduce {
    int u = numerator;
    int v = denominator;
    int temp;
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    numerator /= u;
    denominator /= u;
}

-(Fraction *) add: (Fraction *) f {
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}
@end