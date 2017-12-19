//
//  MyButton1.m
//  ButtonDemo
//
//  Created by lxm on 2017/12/19.
//  Copyright © 2017年 lixiaomeng. All rights reserved.
//

#import "MyButton1.h"

@interface MyButton1(){
    CGFloat length;
    CGPoint point;
    BOOL isChoose;
}
@end
@implementation MyButton1

- (instancetype)initWithLength:(CGFloat)reallength point:(CGPoint)realPoint{
    if ([super init]) {
        isChoose = NO;
        length = reallength;
        point = realPoint;
        self.frame = CGRectMake(point.x, point.y,length * 2, length * sqrtf(3));
    }
    return  self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat midX = CGRectGetMidX(rect);
    CGFloat midY = CGRectGetMidY(rect);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    if (isChoose) {
        CGContextSetFillColorWithColor(context,[UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.8].CGColor);
    } else {
        CGContextSetFillColorWithColor(context,[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8].CGColor);
    }


    CGContextMoveToPoint(context, midX - length/2, 0);
    CGContextAddLineToPoint(context,midX + length/2,0);
    CGContextAddLineToPoint(context,midX + length, midY);
    CGContextAddLineToPoint(context,midX + length/2, length * sqrtf(3));
    CGContextAddLineToPoint(context,midX - length/2, length * sqrtf(3));
    CGContextAddLineToPoint(context,0, midY);
    CGContextFillPath(context);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    CGFloat x0 = length/2;
    CGFloat x1 = length * 3/2;
    CGFloat l = length * sinf(60);
    if ((point.x < x0 && point.y <  l - point.x * tanf(30))
        ||(point.x < x0 && point.y >l + point.x * tanf(30))
        ||(point.x > x1 && point.y < (point.x - x1) * tanf(60))
        ||(point.x > x1 && point.y > l + (point.x-x1) * tanf(60))) {
    } else {
        isChoose = YES;
        [self setNeedsDisplay];
    }
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    UITouch * touch = touches.anyObject;
    isChoose = NO;
    [self setNeedsDisplay];
    CGPoint point = [touch locationInView:self];
    CGFloat x0 = length/2;
    CGFloat x1 = length * 3/2;
    CGFloat l = length * sinf(60);
    if ((point.x < x0 && point.y <  l - point.x * tanf(30))
        ||(point.x < x0 && point.y >l + point.x * tanf(30))
        ||(point.x > x1 && point.y < (point.x - x1) * tanf(60))
        ||(point.x > x1 && point.y > l + (point.x-x1) * tanf(60))) {
    } else {
        if(touch.tapCount == 1){
            if(_click){
                self.click();
            }
        }
    }
}


@end
