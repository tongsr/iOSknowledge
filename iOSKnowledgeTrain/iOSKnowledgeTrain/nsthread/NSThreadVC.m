//
//  NSThreadVC.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/18.
//  Copyright © 2019 work. All rights reserved.
//

#import "NSThreadVC.h"

@interface NSThreadVC ()
@property(assign,nonatomic)int ticket_count;

- (IBAction)nsthread_sychronized_test:(id)sender;

- (IBAction)nsthread_nslock_test:(id)sender;

- (IBAction)nsoperation_test:(id)sender;

- (IBAction)gcd_test:(id)sender;

@end

@implementation NSThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
}








-(void)startSell{
    
    while (YES) {
        [NSThread sleepForTimeInterval:1.0f];
        @synchronized (self) {
            if (self.ticket_count==0) {
                //[NSThread cancel];
                break;
            }else{
                self.ticket_count--;
                NSLog(@"%@,leftTicket= %d",[NSThread currentThread].name,self.ticket_count);
            }
        }
    }
}

- (IBAction)nsthread_sychronized_test:(id)sender {
    self.ticket_count=20;
    
    NSThread *thread1=[[NSThread alloc]initWithTarget:self selector:@selector(startSell) object:nil];
    thread1.name=@"售票员1";
    [thread1 start];
    
    NSThread *thread2=[[NSThread alloc]initWithTarget:self selector:@selector(startSell) object:nil];
    thread2.name=@"售票员2";
    [thread2 start];
}

- (IBAction)nsthread_nslock_test:(id)sender {
    self.ticket_count=18;
    NSLock *lock = [[NSLock alloc]init];
    [NSThread detachNewThreadWithBlock:^{
        [NSThread currentThread].name=@"售票员1";
        while (YES) {
            [NSThread sleepForTimeInterval:1.0f];
            [lock lock];
            if (self.ticket_count>0) {
                
                
                self.ticket_count--;
                NSLog(@"%@,leftTicket= %d",[NSThread currentThread].name,self.ticket_count);
                
            }
            else{
                [[NSThread currentThread]cancel];
                break;
            }
            [lock unlock];
        }
    }];
    
    [NSThread detachNewThreadWithBlock:^{
        [NSThread currentThread].name=@"售票员2";
        while (YES) {
            [NSThread sleepForTimeInterval:1.0f];
            [lock lock];
            if (self.ticket_count>0) {
                
                
                self.ticket_count--;
                NSLog(@"%@,leftTicket= %d",[NSThread currentThread].name,self.ticket_count);
                
            }
            else{
                [[NSThread currentThread]cancel];
                break;
            }
            [lock unlock];
        }
    }];
}

- (IBAction)nsoperation_test:(id)sender {
    self.ticket_count=18;
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(startSell) object:nil];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self startSell];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"finished");
    }];
    [op3 addDependency:op2];
    
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    
}




- (IBAction)gcd_test:(id)sender {
    self.ticket_count=9;
    dispatch_queue_t queue = dispatch_queue_create("abc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [NSThread currentThread].name=@"窗口1";
        [self startSell];
    });
    dispatch_async(queue, ^{
        [NSThread currentThread].name=@"窗口2";
        [self startSell];
    });
    
    
}





@end
