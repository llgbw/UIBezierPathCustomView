//
//  ViewController.m
//  TestIrregularView
//
//  Created by LuoKI on 2018/4/23.
//  Copyright © 2018年 LuoLi. All rights reserved.
//

#import "ViewController.h"
#import "IrregularBtn.h"

#define kViewWidth(View) CGRectGetWidth(View.frame)
#define kViewHeight(View) CGRectGetHeight(View.frame)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self view1]; //右斜边梯形
    [self view2]; //平行四边形
    [self view3]; //左斜边梯形

    [self view4]; //六角形
    [self view5]; //对折形状

    [self view6]; //箭头
    
}


//右斜边梯形
- (void)view1
{
    //
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 100, 120, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 添加路径关键点array
    NSMutableArray *pointArray = [NSMutableArray array];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn) *3/4, btn.frame.size.height))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, kViewHeight(btn)))];
    
    //
    btn.pointArray = [pointArray mutableCopy];
    
}


//平行四边形
- (void)view2
{
    //
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(120, 100, 120, 50);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 添加路径关键点array
    NSMutableArray *pointArray = [NSMutableArray array];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, kViewHeight(btn)))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn)/4, 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn) *3/4, btn.frame.size.height))];
    
    //
    btn.pointArray = [pointArray mutableCopy];
    
}


//左斜边梯形
- (void)view3
{
    //
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(220, 100, 120, 50);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 添加路径关键点array
    NSMutableArray *pointArray = [NSMutableArray array];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn)/4, 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), btn.frame.size.height))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, kViewHeight(btn)))];
    
    //
    btn.pointArray = [pointArray mutableCopy];
}


//六角形
- (void)view4
{
    //
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 200, 150, 150);
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 添加路径关键点array
    float viewWidth = btn.frame.size.width;
    NSMutableArray *pointArray = [NSMutableArray array];
    
    CGPoint point1 = CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2), (viewWidth / 4));
    CGPoint point2 = CGPointMake((viewWidth / 2), 0);
    CGPoint point3 = CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                 (viewWidth / 4));
    CGPoint point4 = CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                 (viewWidth / 2) + (viewWidth / 4));
    CGPoint point5 = CGPointMake((viewWidth / 2), viewWidth);
    CGPoint point6 = CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2),
                                 (viewWidth / 2) + (viewWidth / 4));
    
    [pointArray addObject:NSStringFromCGPoint(point1)];
    [pointArray addObject:NSStringFromCGPoint(point2)];
    [pointArray addObject:NSStringFromCGPoint(point3)];
    [pointArray addObject:NSStringFromCGPoint(point4)];
    [pointArray addObject:NSStringFromCGPoint(point5)];
    [pointArray addObject:NSStringFromCGPoint(point6)];
    
    //
    btn.pointArray = [pointArray mutableCopy];
    
}


//对折形状
- (void)view5
{
    //
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 200, 150, 150);
    btn.backgroundColor = [UIColor brownColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 添加路径关键点array
    NSMutableArray *pointArray = [NSMutableArray array];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, kViewHeight(btn)))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), kViewHeight(btn)))];
    
    
    //
    btn.pointArray = [pointArray mutableCopy];
    
}

//箭头
- (void)view6 {
    
    //
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 380, 330, 150);
    btn.backgroundColor = [UIColor magentaColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    // 添加路径关键点array
    NSMutableArray *pointArray = [NSMutableArray array];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, kViewHeight(btn)/3))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn) *2/3, kViewHeight(btn)/3))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn) *2/3, 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn), kViewHeight(btn)/2))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn) *2/3, kViewHeight(btn)))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(btn) *2/3, kViewHeight(btn) *2/3))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, kViewHeight(btn) *2/3))];
    
    
    //
    btn.pointArray = [pointArray mutableCopy];
    
}



//
- (void)btnAction:(UIButton *)btn{
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    [btn setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
