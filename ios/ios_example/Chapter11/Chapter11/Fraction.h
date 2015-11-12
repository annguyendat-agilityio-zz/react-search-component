//
//  Fraction.h
//  Chapter11
//
//  Created by Hau Nguyen on 8/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property int numerator, denominator;
-(void) setTo: (int) n over: (int) d;
-(void) reduce;
-(double) convertToNum;
-(void) print;
@end
