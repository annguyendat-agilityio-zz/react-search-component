//
//  Rectangle.h
//  Chapter9
//
//  Created by Hau Nguyen on 8/12/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle: NSObject

@property int width, height;
-(int) area;
-(int) perimeter;
-(void) setWidth: (int) w andHeight: (int) h;
@end