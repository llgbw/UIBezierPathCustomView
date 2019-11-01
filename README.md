# UIBezierPathCustomView
 
 
 iOS 贝塞尔曲线自定义图形.    
效果gif图:

![image](https://github.com/llgbw/UIBezierPathCustomView/blob/master/show.gif)


举例: 以效果图左上角梯形为例子: 

/* 所用宏： 
#define kViewWidth(View) CGRectGetWidth(View.frame)
#define kViewHeight(View) CGRectGetHeight(View.frame)
 */

// 1、创建按钮
UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
btn.frame = CGRectMake(20, 100, 120, 50);
btn.backgroundColor = [UIColor orangeColor];
[btn setTitle:@"按钮" forState:UIControlStateNormal];
[btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:btn];
// 2、设置贝塞尔曲线路径

UIBezierPath *path = [UIBezierPath bezierPath];

[path moveToPoint:CGPointMake(0.f, 0.f)];
[path addLineToPoint:CGPointMake(kViewWidth(btn), 0.f)];
[path addLineToPoint:CGPointMake(kViewWidth(btn) *3/4, btn.frame.size.height)];
[path addLineToPoint:CGPointMake(0.f, kViewHeight(btn)];

[path closePath];

// 3、绘制图形时添加path遮罩
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = self.path.CGPath;
    self.layer.mask = shapLayer;
}
至此绘制出左上角的梯形,但是如果 只要我们绘制出来的图形能点击,触发手势 要加以下触发手势判断

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


Done.
