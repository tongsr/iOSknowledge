//
//  RunloopVC.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/15.
//  Copyright © 2019 work. All rights reserved.
//

#import "RunloopVC.h"
#define WEAKSELF typeof(self) __weak weakSelf = self;
@interface RunloopVC ()
@property (weak, nonatomic) IBOutlet UILabel *lbltime;
@property (weak, nonatomic) IBOutlet UITextView *textview;


@property(nonatomic,strong)NSThread *thread;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation RunloopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    
    
    
    NSTimer* timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    [self testKeepThread];
}


-(void)timerRun{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    self.lbltime.text = timeSp;
}





- (void)testKeepThread
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"线程开始");
        //获取到当前线程
        self.thread = [NSThread currentThread];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        //添加一个Port，同理为了防止runloop没事干直接退出
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        //运行一个runloop，[NSDate distantFuture]：很久很久以后才让它失效
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"线程结束");
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //在我们开启的异步线程调用方法
        [self performSelector:@selector(recieveMsg) onThread:self.thread withObject:nil waitUntilDone:NO];
    });
}

- (void)recieveMsg
{
    NSLog(@"收到消息了，在这个线程：%@",[NSThread currentThread]);
}



                  
/*
 performSelector
 当调用 NSObject 的 performSelecter:afterDelay: 后，实际上其内部会创建一个 Timer 并添加到当前线程的 RunLoop 中。所以如果当前线程没有 RunLoop，则这个方法会失效。
 当调用 performSelector:onThread: 时，实际上其会创建一个 Timer 加到对应的线程去，同样的，如果对应线程没有 RunLoop 该方法也会失效。所以使用这个方法最好是手动启动 RunLoop。
 
当调用 NSObject的performSelector:onThread:时，实际上其内部会创建一个 Timer 并添加到当前线程的 RunLoop 中:
 
 
 
 
 //线程保活
 NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
 [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
 [runLoop run];
*/

@end
