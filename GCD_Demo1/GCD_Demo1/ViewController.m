//
//  ViewController.m
//  GCD_Demo1
//
//  Created by 马天野 on 2018/10/29.
//  Copyright © 2018 Maty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"执行任务1");
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue = dispatch_queue_create("MyQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("MyQueue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_queue_create("MyQueue3", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue2, ^{
       
        NSLog(@"执行任务2");
        dispatch_sync(queue2, ^{
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
        
        
    });
    
    NSLog(@"执行任务5");
    
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"执行任务1---在%@线程",[NSThread currentThread]);
//        }
//    });
//
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"执行任务2---在%@线程",[NSThread currentThread]);
//        }
//    });
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"1");
//    [self performSelector:@selector(test) withObject:nil afterDelay:.0];
//    NSLog(@"3");
    
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSLog(@"1");
//        [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSRunLoopCommonModes];
//        [[NSRunLoop currentRunLoop] run];
//    }];
//    [thread start];
//    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务1");
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务2");
        }
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务3");
        }
    });
 
}

- (void)test {
    NSLog(@"2");
}


@end
