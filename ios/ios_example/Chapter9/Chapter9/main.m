//
//  main.m
//  Chapter9
//
//  Created by Hau Nguyen on 8/12/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Complex.h"
#import "Square.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Complex *c1 = [[Complex alloc] init];
        id dataValue;
        [c1 setReal: 10.0 andImaginary: 2.5];
        dataValue = c1;
        [dataValue print];
        
        Square *mySquare = [[Square alloc] init];
        // isMemberOf:
        if ( [mySquare isMemberOfClass: [Square class]] == YES ) NSLog (@"mySquare is a member of Square class");
        if ( [mySquare isMemberOfClass: [Rectangle class]] == YES ) NSLog (@"mySquare is a member of Rectangle class");
        if ( [mySquare isMemberOfClass: [NSObject class]] == YES ) NSLog (@"mySquare is a member of NSObject class");
        // isKindOf:
        if ( [mySquare isKindOfClass: [Square class]] == YES ) NSLog (@"mySquare is a kind of Square");
        if ( [mySquare isKindOfClass: [Rectangle class]] == YES ) NSLog (@"mySquare is a kind of Rectangle");
        if ( [mySquare isKindOfClass: [NSObject class]] == YES ) NSLog (@"mySquare is a kind of NSObject");
        // respondsTo:
        if ( [mySquare respondsToSelector: @selector (setSide:)] == YES ) NSLog (@"mySquare responds to setSide: method");
        if ( [mySquare respondsToSelector: @selector (setWidth:andHeight:)] == YES ) NSLog (@"mySquare responds to setWidth:andHeight: method");
        if ( [Square respondsToSelector: @selector (alloc)] == YES ) NSLog (@"Square class responds to alloc method");
        // instancesRespondTo:
        if ([Rectangle instancesRespondToSelector: @selector (setSide:)] == YES) NSLog (@"Instances of Rectangle respond to setSide: method");
        if ([Square instancesRespondToSelector: @selector (setSide:)] == YES) NSLog (@"Instances of Square respond to setSide: method");
        if ([Square isSubclassOfClass: [Rectangle class]] == YES) NSLog (@"Square is a subclass of a rectangle");
        
        NSArray *myArray = [NSArray array];
        @try {
            [myArray objectAtIndex: 2];
        }
        @catch (NSException *exception) {
            NSLog (@"Caught %@%@", exception.name, exception.reason);
        }
        NSLog (@"Execution continues");
        
    }
    return 0;
}

