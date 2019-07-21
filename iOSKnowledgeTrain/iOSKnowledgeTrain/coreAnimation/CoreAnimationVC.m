//
//  CoreAnimationVC.m
//  iOSKnowledgeTrain
//
//  Created by terence on 2019/7/21.
//  Copyright © 2019年 work. All rights reserved.
//

#import "CoreAnimationVC.h"

@interface CoreAnimationVC ()
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
}
    
    
    
    
- (IBAction)animation1:(id)sender {
}
    
    
    
    
- (IBAction)animation2:(id)sender {
}
    
    
    
@end
