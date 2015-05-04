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
        _PicList = [WPAppinfo applist];
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
//        image.image = [UIImage imageNamed:info.icon];
        image.image = info.image;
        
        [image setContentMode:UIViewContentModeScaleAspectFit];
        
        [appView addSubview:image];
      
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), kAppViewW, 20)];
//        [label setBackgroundColor:[UIColor yellowColor]];
        
        label.text = info.name;
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
        
        but.tag = i;
        [appView addSubview:but];
        
        [but addTarget:nil action:@selector(click:)forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)click:(UIButton *)button
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 500, 160, 40)];
    WPAppinfo *info = self.PicList[button.tag];
                        //第一个参数，0表示黑，1表示白
                        //第二个参数，表示透明度
    [label setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.3]];
    
    label.text = info.name;
    label.textAlignment = NSTextAlignmentCenter;
    //透明度
    label.alpha = 0.0;
    
    [self.view addSubview:label];
    button.enabled = NO;
    
    [UIView animateWithDuration:1.0f animations:^{
        label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
           [label removeFromSuperview];
        }];
    }];
}

@end
