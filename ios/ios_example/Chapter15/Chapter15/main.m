//
//  main.m
//  Chapter15
//
//  Created by Hau Nguyen on 8/22/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSNumber *myNumber, *floatNumber, *intNumber; NSInteger myInt;
        // integer value
        intNumber = [NSNumber numberWithInteger: 100];
        myInt = [intNumber integerValue];
        NSLog (@"%li", (long) (myInt + 1));
        
        myNumber = [NSNumber numberWithLong: 0xabcdef];
        NSLog (@"%lx", [myNumber longValue]);

        myNumber = [NSNumber numberWithChar: 'X'];
        NSLog (@"%c", [myNumber charValue]);

        floatNumber = [NSNumber numberWithFloat: 100.00];
        NSLog (@"%g", [floatNumber floatValue]);

        myNumber = [NSNumber numberWithDouble: 12345e+15];
        NSLog (@"%lg", [myNumber doubleValue]);

        NSLog (@"%li", (long) [myNumber integerValue]);
        
        if ([intNumber isEqualToNumber: floatNumber] == YES)
            NSLog (@"Numbers are equal");
        else
            NSLog (@"Numbers are not equal");

        if ([intNumber compare: myNumber] == NSOrderedAscending)
            NSLog (@"First number is less than second");
        
        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res;
        NSComparisonResult compareResult;
        

        NSLog (@"Length of str1: %lu", [str1 length]);
        res = [NSString stringWithString: str1];
        NSLog (@"copy: %@", res);
        
        str2 = [str1 stringByAppendingString: str2];
        NSLog (@"Concatentation: %@", str2);
        if ([str1 isEqualToString: res] == YES)
            NSLog (@"str1 == res");
        else
            NSLog (@"str1 != res");
        compareResult = [str1 compare: str2];
        if (compareResult == NSOrderedAscending)
            NSLog (@"str1 < str2");
        else if (compareResult == NSOrderedSame)
            NSLog (@"str1 == str2");
        else
            res = [str1 uppercaseString];
        NSLog (@"Uppercase conversion: %s", [res UTF8String]);
        res = [str1 lowercaseString];
        NSLog (@"Lowercase conversion: %@", res);
        NSLog (@"Original string: %@", str1);
        
        str1 = @"This is a string";
        str1 = [str1 substringFromIndex: 5];
        NSLog (@"Original string: %@", str1);
    }
    return 0;
}

