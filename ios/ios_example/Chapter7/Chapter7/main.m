//
//  main.m
//  Chapter7
//
//  Created by Hau Nguyen on 8/6/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "Fraction.h"
int main (int argc, char * argv[]) {
    @autoreleasepool {
        Fraction *firstFraction = [[Fraction alloc] init];
        Fraction *secondFraction = [[Fraction alloc] init];
        [firstFraction setTo: 100 : 200];

        NSLog (@"The value of myFraction is:");
        [firstFraction reduce];
        
        int page = [firstFraction showPage];
        NSLog(@"%i", page);
        
        [firstFraction print];
        
        [secondFraction setTo: 100 : 300];
        
        Fraction *threeFraction = [firstFraction add: secondFraction];
        
        [threeFraction print];
        
    }
    return 0;
}
