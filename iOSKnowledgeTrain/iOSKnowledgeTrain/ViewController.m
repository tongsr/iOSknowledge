//
//  ViewController.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/15.
//  Copyright © 2019 work. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeVC.h"
#import "RunloopVC.h"
#import "ButtonAreaVC.h"

@interface ViewController ()
- (IBAction)goRuntime:(id)sender;
- (IBAction)goRunloop:(id)sender;
- (IBAction)goButtonArea:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)goRuntime:(id)sender {
    RuntimeVC *vc = [[RuntimeVC alloc]initWithNibName:@"RuntimeVC" bundle:nil];
    vc.title=@"runtime";
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)goRunloop:(id)sender {
    RunloopVC *vc = [[RunloopVC alloc]initWithNibName:@"RunloopVC" bundle:nil];
    vc.title=@"Runloop";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goButtonArea:(id)sender {
    ButtonAreaVC *vc = [[ButtonAreaVC alloc]initWithNibName:@"ButtonAreaVC" bundle:nil];
    vc.title=@"ButtonArea";
    [self.navigationController pushViewController:vc animated:YES];
}



@end
