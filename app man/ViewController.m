//
//  ViewController.m
//  app man
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 worldelite. All rights reserved.
//

#import "ViewController.h"
#import "WPAppinfo.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *PicList;

@end


#define VIEWH   80
#define VIEWW   90

@implementation ViewController


- (NSArray *)PicList
{
    if(_PicList == nil)
    {
//        _PicList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        
        NSMutableArray *mutable = [NSMutableArray array];
        
        for(NSDictionary *dict in array)
        {
            WPAppinfo *appinfo = [[WPAppinfo alloc] initWithDict:dict];
//            appinfo.icon = dict[@"icon"];
//            appinfo.name = dict[@"name"];
            [mutable addObject:appinfo];
        }
        _PicList = mutable;
        
        
    }
    return _PicList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//
//    UIView *ui1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, VIEWH, VIEWW)];
//    [ui1 setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:ui1];
    
    // 搭建界面，九宫格
#define kAppViewW 80
#define kAppViewH 90
#define kColCount 3
#define kStartY   20
    
    // 320 - 3 * 80 = 80 / 4 = 20
    CGFloat marginX = (self.view.bounds.size.width - kColCount * kAppViewW) / (kColCount + 1);
    CGFloat marginY = 10;
    
    for (int i = 0; i < 12; i++)
    {
        int row = i / kColCount;
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + marginY + row * (marginY + kAppViewH);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kAppViewW, kAppViewH)];
        appView.backgroundColor = [UIColor redColor];
        [self.view addSubview:appView];
        
        WPAppinfo *info = self.PicList[i];
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kAppViewW, 50)];
        image.image = [UIImage imageNamed:info.icon];
        
        [image setContentMode:UIViewContentModeScaleAspectFit];
        
        [appView addSubview:image];
      
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), kAppViewW, 20)];
//        [label setBackgroundColor:[UIColor yellowColor]];
        
        label.text = info.icon;
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setFont:[UIFont systemFontOfSize:12.0]];
        [appView addSubview:label];
        
        
        UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), kAppViewW, 20)];
        [but setBackgroundColor:[UIColor blackColor]];
        [but setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:(UIControlStateNormal)];
        [but setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:(UIControlStateNormal)];
        [but setTitle:@"下载" forState:(UIControlStateNormal)];
        [but setTitle:@"下载" forState:(UIControlStateHighlighted)];
        but.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [appView addSubview:but];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
