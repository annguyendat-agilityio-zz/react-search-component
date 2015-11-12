//
//  Rectangle.m
//  Chapter9
//
//  Created by Hau Nguyen on 8/12/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

@synthesize width, height;

-(void) setWidth: (int) w andHeight: (int) h
{
    width = w;
    height = h;
}
-(int) area
{
    return width * height;
}
-(int) perimeter
{
    return (width + height) * 2;
} @end