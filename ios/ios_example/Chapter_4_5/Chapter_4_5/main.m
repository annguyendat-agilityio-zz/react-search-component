//
//  main.m
//  Chapter3
//
//  Created by Hau Nguyen on 8/4/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fibonaci: NSObject
-(void) print;
-(void) setNumberOfArray: (int) n;
@end

@implementation Fibonaci
{
    int number;
}

-(void) print
{
    NSLog(@"Fibo n: ");
    
    int first = 0, second = 1, temp, i = 0 ;
    
    for (; i < number; i++) {
        NSLog(@" %i", first + second);
        temp = first;
        first = second;
        second = temp + second;
    }
    
    NSLog(@"\n");
    first = 0;
    second = 1;
    i = 0;
    while (i < number) {
        NSLog(@" %i", first + second);
        temp = first;
        first = second;
        second = temp + second;
        i++;
    }
}
-(void) setNumberOfArray: (int) n
{
    number = n;
}
@end

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        int n;
        Fibonaci *fibo = [[Fibonaci alloc] init];
        NSLog(@"n = ");
        scanf("%i", &n);
        [fibo setNumberOfArray: n];
        [fibo print];
    }
    return 0;
}

