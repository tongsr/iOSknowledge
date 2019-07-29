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
@property(nonatomic,strong)TouchView *touchView;
@end

@implementation TouchEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.touchView = [[TouchView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.touchView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.touchView];
    // Do any additional setup after loading the view from its nib.
}



@end
