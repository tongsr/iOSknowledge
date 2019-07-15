//
//  RuntimeVC.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/15.
//  Copyright © 2019 work. All rights reserved.
//

#import "RuntimeVC.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "RuntimeObj+test.h"

@interface RuntimeVC ()

@end

@implementation RuntimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    //[self exchangeTest];
    
    //[self addMethod];
    
    //[self sendMsg];
    
    //[self addproperty];
    
    [self dictionaryConvert];
}


-(void)run{
    NSLog(@"run");
}


-(void)jump{
    NSLog(@"jump");
}


+(void)classRun{
    NSLog(@"classrun");
}

+(void)classJump{
    NSLog(@"classjump");
}

//请实现如下功能
//1 方法替换
-(void)exchangeTest{
    Method newrun = class_getInstanceMethod([RuntimeVC class], @selector(run));
    Method newJump = class_getInstanceMethod([RuntimeVC class],@selector(jump));
    method_exchangeImplementations(newrun, newJump);
    [self run];
    [self jump];
    
    Method run = class_getClassMethod([RuntimeVC class], @selector(classRun));
    Method jump = class_getClassMethod([RuntimeVC class],@selector(classJump));
    method_exchangeImplementations(run, jump);
    [RuntimeVC classRun];
    [RuntimeVC classJump];
}



//2 动态添加方法
void walk(id self, SEL _cmd, NSNumber *meter) {
    NSLog(@"走了%@米", meter);
}
-(void)addMethod{
    class_addMethod([self class], NSSelectorFromString(@"walk:"), (IMP)walk, "v@:@");
    [self performSelector:@selector(walk:) withObject:@10];
}



//3 发送消息
-(void)sendMsg{
    //objc_msgSend();
    objc_msgSend(self,@selector(run));
}




//4 增加属性
-(void)addproperty{
    RuntimeObj *obj = [[RuntimeObj alloc]init];
    obj.name = @"def";
    NSLog(@"%@",obj.name);
}





//5 字典转模型
-(void)dictionaryConvert{
    RuntimeObj *obj = [[RuntimeObj alloc]init];
    NSDictionary *dic = @{@"name":@"runtime",@"age":@"18"};
    obj.name = @"abc";
    [obj transformDict:dic];
    NSLog(@"%@",obj.name);
    
}

@end
