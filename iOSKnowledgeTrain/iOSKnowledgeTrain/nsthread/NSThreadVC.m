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
@end

@implementation NSThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        NSLog(@"hello");
    }];
    [thread setName:@"The Second Thread"];
    [thread start];
    
    
    //[self sellticketWithSychronized];
    [self sellTicketWithNSLock];
}



///使用nslock加锁进行售票
-(void)sellTicketWithNSLock{
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




////使用@synchronized加锁进行售票

-(void)sellticketWithSychronized{
    self.ticket_count=20;
    
    NSThread *thread1=[[NSThread alloc]initWithTarget:self selector:@selector(startSell) object:nil];
    thread1.name=@"售票员1";
    [thread1 start];
    
    NSThread *thread2=[[NSThread alloc]initWithTarget:self selector:@selector(startSell) object:nil];
    thread2.name=@"售票员2";
    [thread2 start];
}



-(void)startSell{
    
    while (YES) {
        [NSThread sleepForTimeInterval:1.0f];
        @synchronized (self) {
            if (self.ticket_count==0) {
                [[NSThread currentThread]cancel];
            }else{
                self.ticket_count--;
                NSLog(@"%@,leftTicket= %d",[NSThread currentThread].name,self.ticket_count);
            }
        }
    }
}





@end
