//
//  ViewController.m
//  OCFlutter
//
//  Created by yaliang on 2020/5/12.
//  Copyright © 2020 yaliang. All rights reserved.
//

#import "ViewController.h"
#import "ListVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self test];
}

- (void)test {
    UILabel * label = [[UILabel alloc]init];
    label.text = @"Hello, world!";
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touched began");
    [self pushListVC];
}

- (void)pushListVC {
    ListVC *vc = [[ListVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
