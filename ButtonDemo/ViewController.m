//
//  ViewController.m
//  ButtonDemo
//
//  Created by lxm on 2017/12/19.
//  Copyright © 2017年 lixiaomeng. All rights reserved.
//

#import "ViewController.h"
#import "MyButton1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyButton1 *btn = [[MyButton1 alloc] initWithLength:100 point:CGPointMake(self.view.center.x - 100, self.view.center.y - 100 * sqrtf(3))];
    [btn setBackgroundColor:UIColor.clearColor];
    [self.view addSubview:btn];
    btn.click = ^{
        NSLog(@"click");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
