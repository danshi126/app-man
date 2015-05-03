//
//  WPAppinfo.h
//  app man
//
//  Created by apple on 15/5/1.
//  Copyright (c) 2015年 worldelite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPAppinfo : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *icon;


- (id)initWithDict:(NSDictionary *)dic;
@end
