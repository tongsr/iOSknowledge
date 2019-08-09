//
//  TouchEventVC.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/29.
//  Copyright © 2019 work. All rights reserved.
//

#import "TouchEventVC.h"
#import "TouchView.h"

@interface TouchEventVC ()
@property(nonatomic,strong)UIView *touchView;
@property(nonatomic,strong)TouchView *touchSubView;
@property(nonatomic,strong)TouchView *touchSubView2;
@end

@implementation TouchEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.touchView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 300, 300)];
    self.touchView.backgroundColor=[UIColor blueColor];
    //self.touchView.name=@"touchView";
    [self.view addSubview:self.touchView];
    // Do any additional setup after loading the view from its nib.
    
    self.touchSubView = [[TouchView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    self.touchSubView.backgroundColor=[UIColor yellowColor];
    self.touchSubView.name=@"touchSubView";
    [self.touchView addSubview:self.touchSubView];
    
    
    self.touchSubView2 = [[TouchView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.touchSubView2.backgroundColor=[UIColor redColor];
    self.touchSubView2.name=@"touchSubView2";
    [self.touchView addSubview:self.touchSubView2];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchFunc)];
    tap.numberOfTapsRequired=1;
    //[self.touchSubView2 addGestureRecognizer:tap];
    
}

-(void)touchFunc{
    NSLog(@"tap 2");
}

@end
