//
//  Mall.h
//  AutoLayout
//
//  Created by Hau Nguyen on 10/27/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mall : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *tips;
- (id)initWithJSON:(NSDictionary *)jsonDictionary;
+ (id)parseData;
@end
