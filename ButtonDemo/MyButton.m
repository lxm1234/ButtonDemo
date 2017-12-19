//
//  MyButton.m
//  ButtonDemo
//
//  Created by lxm on 2017/12/19.
//  Copyright © 2017年 lixiaomeng. All rights reserved.
//

#import "MyButton.h"
# define kArrorHeight 10
@implementation MyButton

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context,[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8].CGColor);
    CGFloat radius = 10.0;
    CGFloat minX = CGRectGetMinX(rect);
    CGFloat midX = CGRectGetMidX(rect);
    CGFloat maxX = CGRectGetMaxX(rect);
    CGFloat minY = CGRectGetMinY(rect);
    CGFloat maxY = CGRectGetMaxY(rect) - kArrorHeight;
    CGContextMoveToPoint(context, midX + kArrorHeight, maxY);
    CGContextAddLineToPoint(context, midX, maxY + kArrorHeight);
    CGContextAddLineToPoint(context, midX - kArrorHeight, maxY);

    CGContextAddArcToPoint(context, midX, maxY, minX, maxY, radius);
    CGContextAddArcToPoint(context, minX, maxY, minX, minY, radius);
    CGContextAddArcToPoint(context, minX, minY, maxX, minY, radius);
    CGContextAddArcToPoint(context, maxX, minY, maxX, maxY, radius);
    CGContextAddArcToPoint(context, maxX, maxY, midX, maxY, radius);

    CGContextFillPath(context);
    
    
    
}


@end
