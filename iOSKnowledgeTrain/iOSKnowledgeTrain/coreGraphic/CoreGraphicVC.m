//
//  CoreGraphicVC.m
//  iOSKnowledgeTrain
//
//  Created by terence on 2019/7/21.
//  Copyright © 2019年 work. All rights reserved.
//

#import "CoreGraphicVC.h"
#import "CoreGraphicView.h"

@interface CoreGraphicVC ()
    @property (weak, nonatomic) IBOutlet CoreGraphicView *testView;
    
@end

@implementation CoreGraphicVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


//-(void)viewDidAppear:(BOOL)animated{
//    [self.testView setNeedsDisplay];
//}
@end
