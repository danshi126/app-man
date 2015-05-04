//
//  WPAppinfo.h
//  app man
//
//  Created by apple on 15/5/1.
//  Copyright (c) 2015年 worldelite. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKitDefines.h>
#import <UIKit/UIImage.h>
//#import <UIKit/UIStateRestoration.h>
//#import <UIKit/UITraitCollection.h>


@interface WPAppinfo : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *icon;
//@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) UIImage *image;


- (instancetype)initWithDict:(NSDictionary *)dic;
+ (NSArray *)applist;
@end
