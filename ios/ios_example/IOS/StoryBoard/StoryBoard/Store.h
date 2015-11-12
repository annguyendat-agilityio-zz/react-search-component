//
//  Store.h
//  StoryBoard
//
//  Created by Hau Nguyen on 10/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *tips;
- (id)initWithJSON:(NSDictionary *)jsonDictionary;
+ (id)parseData;
@end
