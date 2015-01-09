//
//  Fraction.h
//  Chapter7
//
//  Created by Hau Nguyen on 8/6/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

// Created by Steve Kochan on 9/29/11.
// Copyright (c) ClassroomM, Inc. All rights reserved. //
#import <Foundation/Foundation.h> // The Fraction class

@interface Fraction : NSObject
@property int numerator, denominator;
-(void) print;
-(double) convertToNum;
-(void) setTo: (int) n : (int) d;
-(void) reduce;
-(int) showPage;
-(Fraction *) add: (Fraction *) f;
@end