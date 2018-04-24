//
//  Irregular_Btn.m
//  TestIrregularView
//
//  Created by LuoKI on 2018/4/23.
//  Copyright © 2018年 LuoLi. All rights reserved.
//

#import "IrregularBtn.h"

@interface IrregularBtn()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation IrregularBtn

// pointArray
- (void)setPointArray:(NSArray *)pointArray
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < pointArray.count; i++) {
        
        CGPoint retrievedPoint = CGPointFromString([pointArray objectAtIndex:i]);
        if (i == 0) {
            [path moveToPoint:retrievedPoint];
        }else
            [path addLineToPoint:retrievedPoint];
        
    }
    [path closePath];
    self.path = path;
}

// 绘制图形时添加path遮罩
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = self.path.CGPath;
    self.layer.mask = shapLayer;
}


// 点击的覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL res = [super pointInside:point withEvent:event];
    if (res)
    {
        if ([self.path containsPoint:point])
        {
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
