//
//  ListVC.m
//  OCFlutter
//
//  Created by yaliang on 2020/5/13.
//  Copyright © 2020 yaliang. All rights reserved.
//

#import "ListVC.h"
#import <Flutter/Flutter.h>

@interface ListVC ()
@property(nonatomic, strong) FlutterMethodChannel *methodChannel;
@property(nonatomic, assign) BOOL isFlutter;

@end

@implementation ListVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (!self.isFlutter) {
        [self.methodChannel setMethodCallHandler:nil];
        self.methodChannel = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.isFlutter = NO;
    [self test];
}

- (void)test {
    UILabel * label = [[UILabel alloc]init];
    label.text = @"List VC";
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
}

- (void)dealloc {
    NSLog(@"你猜猜我释放了吗");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touched began");
    [self pushFlutter];
}

- (void)pushFlutter {
    FlutterViewController *fVC = [[FlutterViewController alloc]init];
    [fVC setInitialRoute:@"home"];
    NSString *eventChannelName = @"wg/native_post";
    NSString *methodChannelName = @"wg/native_get";
    
    /*---------FlutterEventChannel是IOS主动与flutter交互-----------*/
       FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:eventChannelName binaryMessenger:fVC];
       
       // 代理FlutterStreamHandler
       [eventChannel setStreamHandler:self];
       /*---------FlutterEventChannel是IOS主动与flutter交互-----------*/

       
       /*---------FlutterMethodChannel是flutter主动与IOS交互-----------*/
       self.methodChannel = [FlutterMethodChannel methodChannelWithName:methodChannelName binaryMessenger:fVC];
       [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
           
           if ([call.method isEqualToString:@"changeNavStatus"]) {
               NSString *arguments = call.arguments;
               if ([arguments containsString:@"show"]) {
                   self.navigationController.navigationBarHidden = NO;
               }else{
                   self.navigationController.navigationBarHidden = YES;
               }
           }
           
           if ([call.method isEqualToString:@"backToViewController"]) {
               [self dismissViewControllerAnimated:YES completion:nil];
               self.isFlutter = NO;
           }
       }];
    
    self.isFlutter = YES;
    [self presentViewController:fVC animated:YES completion:nil];
}


@end
