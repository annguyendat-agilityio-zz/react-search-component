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
-(void) setFirstNumber: (int) i;
@end

@implementation Fibonaci
{
    int number;
    int first;
}

-(void) print
{
    NSLog(@"number is : %i", number);
    NSLog(@"first number is : %i", first);
}
-(void) setNumberOfArray: (int) n
{
    number = n;
}
-(void) setFirstNumber: (int) i
{
    first = i;
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int integerVar = 100;
        float floatingVar = 331.79;
        double doubleVar = 8.44e+11;
        char charVar = 'W';
        
        NSLog (@"integerVar = %i", integerVar);
        NSLog (@"floatingVar = %f", floatingVar);
        NSLog (@"doubleVar = %g", doubleVar);
        NSLog (@"doubleVar = %e", doubleVar);
        NSLog (@"charVar = %c", charVar);
    }
    return 0;
}

