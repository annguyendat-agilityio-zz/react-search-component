//
//  main.m
//  Chapter_6
//
//  Created by Hau Nguyen on 8/6/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

//Write a program that asks the user to type in two integer values.Test these two numbers to determine whether the first is evenly divisible by the second and then display an appropriate message at the terminal.

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int i, j;
        
        NSLog(@"Input: ");
        NSLog(@"i = ");
        scanf("%d", &i);
        NSLog(@"j = ");
        scanf("%d", &j);
        
        if (i % j ==0 ) {
            NSLog(@"the first is evenly divisible by the second");
        } else {
            NSLog(@"the first is not evenly divisible by the second");
        }
        
    }
    return 0;
}

