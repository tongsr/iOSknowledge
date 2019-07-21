//
//  CoreAnimationVC.m
//  iOSKnowledgeTrain
//
//  Created by terence on 2019/7/21.
//  Copyright © 2019年 work. All rights reserved.
//

#import "CoreAnimationVC.h"

@interface CoreAnimationVC ()<CAAnimationDelegate>
- (IBAction)baseMove:(id)sender;
- (IBAction)animation0:(id)sender;
- (IBAction)animation1:(id)sender;
- (IBAction)animation2:(id)sender;
    @property (weak, nonatomic) IBOutlet UIView *testview;
    
@end

@implementation CoreAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (IBAction)baseMove:(id)sender {
    [UIView animateWithDuration:1 delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.testview.frame=CGRectMake(80, 100, 160, 160);
    } completion:nil];
}
    
    
    
    
- (IBAction)animation0:(id)sender {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.delegate=self;
    //2.设置动画属性初始值和结束值
    //basicAnimation.fromValue=[NSNumber numberWithInteger:50];//可以不设置，默认为图层初始状态
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(80, 100)];
    //存储当前位置在动画结束后使用
    [basicAnimation setValue:[NSValue valueWithCGPoint:CGPointMake(80, 100)] forKey:@"KCBasicAnimationLocation"];
    
    //设置其他动画属性
    basicAnimation.duration = 1.0f;//动画时间5秒
    // basicAnimation.repeatCount=HUGE_VALF;//设置重复次数,HUGE_VALF可看做无穷大，起到循环动画的效果
    //basicAnimation.removedOnCompletion = NO;//运行一次是否移除动画
    
    //3.添加动画到图层，注意key相当于给动画进行命名，以后获得该动画时可以使用此名称获取
    [self.testview.layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Translation"];
}
    
    
    
    
- (IBAction)animation1:(id)sender {
}
    
    
    
    
- (IBAction)animation2:(id)sender {
}
    
    
-(void)animationDidStart:(CAAnimation *)anim{
    
}
    
    
    
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //开启事务
    [CATransaction begin];
    //禁用隐式动画
    [CATransaction setDisableActions:YES];
    
    self.testview.layer.position=[[anim valueForKey:@"KCBasicAnimationLocation"] CGPointValue];
    
    //提交事务
    [CATransaction commit];
}
@end
