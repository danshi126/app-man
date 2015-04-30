//
//  ViewController.m
//  app man
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 worldelite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


#define VIEWH   80
#define VIEWW   90

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    UIView *ui1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, VIEWH, VIEWW)];
//    [ui1 setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:ui1];
    
    // 搭建界面，九宫格
#define kAppViewW 80
#define kAppViewH 90
#define kColCount 4
#define kStartY   20
    
    // 320 - 3 * 80 = 80 / 4 = 20
    CGFloat marginX = (self.view.bounds.size.width - kColCount * kAppViewW) / (kColCount + 1);
    CGFloat marginY = 10;
    
    for (int i = 0; i < 24; i++)
    {
        int row = i / kColCount;
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + marginY + row * (marginY + kAppViewH);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kAppViewW, kAppViewH)];
        appView.backgroundColor = [UIColor redColor];
        [self.view addSubview:appView];
        
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kAppViewW, 50)];
        [image setBackgroundColor:[UIColor blueColor]];
        [appView addSubview:image];
        
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), kAppViewW, 20)];
        [label setBackgroundColor:[UIColor yellowColor]];
        [appView addSubview:label];
        

        UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), kAppViewW, 20)];
        [but setBackgroundColor:[UIColor blackColor]];
        [appView addSubview:but];
        // 实现视图内部细节
        //        NSDictionary *dict = self.appList[i];
  //      HMAppInfo *appInfo = self.appList[i];
        
        // 1> UIImageView
      //  UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kAppViewW, 50)];

    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
