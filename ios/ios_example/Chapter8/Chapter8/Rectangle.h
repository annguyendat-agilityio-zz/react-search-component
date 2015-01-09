//
//  Rectangle.h
//  Chapter8
//
//  Created by Hau Nguyen on 8/7/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"
@class XYPoint;
@interface Rectangle: NSObject
@property int width, height;
-(XYPoint *) origin;
-(void) setOrigin: (XYPoint *) pt;
-(void) setWidth: (int) w andHeight: (int) h;
-(int) area;
-(int) perimeter;
@end
