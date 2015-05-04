//
//  WPAppinfo.m
//  app man
//
//  Created by apple on 15/5/1.
//  Copyright (c) 2015年 worldelite. All rights reserved.
//

#import "WPAppinfo.h"

@implementation WPAppinfo

- (instancetype) initWithDict:(NSDictionary *)dic
{
    self = [super init];
    if(self)
    {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


- (UIImage *)image
{
    if(_image == nil)
        _image = [UIImage imageNamed:self.icon];
    return _image;
}

+ (NSArray *)applist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    
    NSMutableArray *mutable = [NSMutableArray array];
    
    for(NSDictionary *dict in array)
    {
        WPAppinfo *appinfo = [[WPAppinfo alloc] initWithDict:dict];
        [mutable addObject:appinfo];
    }
    return mutable;
}

@end
