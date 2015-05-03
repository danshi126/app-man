//
//  WPAppinfo.m
//  app man
//
//  Created by apple on 15/5/1.
//  Copyright (c) 2015年 worldelite. All rights reserved.
//

#import "WPAppinfo.h"

@implementation WPAppinfo

- (id) initWithDict:(NSDictionary *)dic
{
    self = [super init];
    if(self)
    {
//        self.name = dic[@"name"];
//        self.icon = dic[@"icon"];
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
