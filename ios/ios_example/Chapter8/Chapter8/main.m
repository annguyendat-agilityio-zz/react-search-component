//
//  main.m
//  Chapter8
//
//  Created by Hau Nguyen on 8/7/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h" 
#import "XYPoint.h"

@interface ClassA: NSObject
{
    int x;
}
-(void) initVar;
@end

@implementation ClassA
-(void) initVar
{
    x = 100;
}
@end


@interface ClassB : ClassA
-(void) printVar;
@end

@implementation ClassB
-(void) printVar
{
    NSLog (@"x = %i", x);
}
@end

@interface Square : Rectangle
-(void) setSide: (int) s;
-(int) side;
@end

@implementation Square

-(void) setSide:(int)s
{
    [self setWidth:s andHeight:s];
}
-(int) side
{
    return self.width;
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        ClassB *b = [[ClassB alloc] init];
        [b initVar];
        [b printVar];
        
        Square  *square = [[Square alloc] init];
        [square setSide:10];
        NSLog(@"Square = %i", [square area]);
        NSLog(@"side = %i", [square side]);
        
        Rectangle *myRect = [[Rectangle alloc] init]; XYPoint *myPoint = [[XYPoint alloc] init];
        [myPoint setX: 100 andY: 200];
        [myRect setWidth: 5 andHeight: 8];
        myRect.origin = myPoint;
        NSLog (@"Rectangle w = %i, h = %i", myRect.width, myRect.height);
        NSLog (@"Origin at (%i, %i)", myRect.origin.x, myRect.origin.y);
        NSLog (@"Area = %i, Perimeter = %i", [myRect area], [myRect perimeter]);
    }
    return 0;
}

