//
//  Mall.m
//  StoryBoard
//
//  Created by Hau Nguyen on 10/9/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import "Mall.h"

@implementation Mall

- (id)initWithJSON:(NSDictionary *)jsonDictionary {
  if(self = [self init]) {
    self.title = [jsonDictionary objectForKey:@"title"];
    self.detail = [jsonDictionary objectForKey:@"detail"];
    self.tips = [jsonDictionary objectForKey:@"tips"];
  }
  return self;
}

+ (id)parseData;
{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"malls" ofType:@"json"];
  NSData *myData = [NSData dataWithContentsOfFile:filePath];
  
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
  NSArray *arrayPromotions = [jsonDictionary objectForKey:@"data"];
  
  NSMutableArray *malls = [[NSMutableArray alloc] init];
  
  for(NSDictionary *dictCategories in arrayPromotions) {
    Mall *mall = [[Mall alloc] initWithJSON:dictCategories];
    [malls  addObject:mall];
  }
  return malls;
}

@end
