//
//  Complex.h
//  Chapter9
//
//  Created by Hau Nguyen on 8/12/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

// Interface file for Complex class
#import <Foundation/Foundation.h>
@interface Complex: NSObject
@property double real, imaginary;
-(void) print;
-(void) setReal: (double) a andImaginary: (double) b;
-(Complex *) add: (Complex *) f;
@end
