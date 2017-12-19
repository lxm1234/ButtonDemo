//
//  MyButton1.h
//  ButtonDemo
//
//  Created by lxm on 2017/12/19.
//  Copyright © 2017年 lixiaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnClick)();

@interface MyButton1 : UIView

- (instancetype)initWithLength:(CGFloat)reallength point:(CGPoint)realPoint;
@property (nonatomic,copy) btnClick click;
@end
