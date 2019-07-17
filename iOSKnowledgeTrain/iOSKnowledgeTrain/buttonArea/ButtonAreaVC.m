//
//  ButtonAreaVC.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/17.
//  Copyright © 2019 work. All rights reserved.
/***
 当用户点击屏幕后，UIApplication 先响应事件，然后传递给UIWindow。如果window可以响应。就开始遍历window的subviews。
 
 在系统的UIView中，以下4个条件不执行事件响应。
 1.隐藏(hidden=YES)的视图
 2.禁止用户操作(userInteractionEnabled=NO)的视图
 3.alpha<0.01的视图
 4.视图超出父视图的区域
 
 
 
 
 实现扩大点击区域的原理：重写   - (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
 系统按钮则使用运行时去重写一个分类
 
 ***/


//





#import "ButtonAreaVC.h"
#import "UIButton+large.h"

@interface ButtonAreaVC ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)clickFunc:(id)sender;

@end

@implementation ButtonAreaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeBtnArea];
}



-(void)changeBtnArea{
    
}



- (IBAction)clickFunc:(id)sender {
    [self.btn setBackgroundColor:[UIColor blueColor]];
}
@end
