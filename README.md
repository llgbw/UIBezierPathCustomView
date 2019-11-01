# UIBezierPathCustomView
 
 
 iOS 贝塞尔曲线自定义图形.    

效果gif图:
![image](https://github.com/llgbw/UIBezierPathCustomView/blob/master/show.gif)


一.贝塞尔基本使用：
1.创建贝塞尔曲线路径path对象.
UIBezierPath *path = [UIBezierPath bezierPath];
2.设置绘制图形的路径起点.
CGPoint point = CGPointMake(<#CGFloat x#>, <#CGFloat y#>);
[path moveToPoint:point];
3.设置绘制图形的路径的其他点（简单理解为转折点、转向点）.
CGPoint point = CGPointMake(<#CGFloat x#>, <#CGFloat y#>);
[path addLineToPoint:point];


二、举例: 以效果图左上角梯形为例子: 

// 1、创建按钮
UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
btn.frame = CGRectMake(20, 100, 120, 50);
btn.backgroundColor = [UIColor orangeColor];
[btn setTitle:@"按钮" forState:UIControlStateNormal];
[btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:btn];
// 2、设置贝塞尔曲线路径

/* 所用宏： 
#define kViewWidth(View) CGRectGetWidth(View.frame)
#define kViewHeight(View) CGRectGetHeight(View.frame)
 */

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
至此绘制出左上角的梯形：


