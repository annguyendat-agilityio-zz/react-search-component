//
//  Store.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/14/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "Store.h"

@implementation Store

- (id)initWithJSON:(NSDictionary *)jsonDictionary {
  if(self = [self init]) {
    self.title = [jsonDictionary objectForKey:@"title"];
    self.tips = [jsonDictionary objectForKey:@"tips"];
  }
  return self;
}

+ (id)parseData;
{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"stores" ofType:@"json"];
  NSData *myData = [NSData dataWithContentsOfFile:filePath];
  
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
  NSArray *arrayPromotions = [jsonDictionary objectForKey:@"data"];
  
  NSMutableArray *malls = [[NSMutableArray alloc] init];
  
  for(NSDictionary *dictCategories in arrayPromotions) {
    Store *store = [[Store alloc] initWithJSON:dictCategories];
    [malls  addObject:store];
  }
  return malls;
}

@end
