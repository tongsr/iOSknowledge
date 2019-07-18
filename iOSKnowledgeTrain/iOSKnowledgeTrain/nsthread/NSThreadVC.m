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
    
    
    [self sellticket];
    // Do any additional setup after loading the view from its nib.
}


-(void)sellticket{
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
