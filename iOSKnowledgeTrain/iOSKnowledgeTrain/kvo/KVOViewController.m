//
//  KVOViewController.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/26.
//  Copyright © 2019 work. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *lblKvo;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    [self.textView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object==self.textView&&[keyPath isEqualToString:@"contentOffset"]) {
        NSLog(@" %@",[change objectForKey:@"new"]);
        
        
        NSValue *oldvalue = change[NSKeyValueChangeOldKey];
        NSValue *newvalue = change[NSKeyValueChangeNewKey];
        CGFloat oldoffset_y = oldvalue.UIOffsetValue.vertical;
        CGFloat newoffset_y = newvalue.UIOffsetValue.vertical;
        

        //CGPoint point = [tempDic objectForKey:@"NSPoint"];

        self.lblKvo.text = [NSString stringWithFormat:@"%f",newoffset_y];
    }
}




@end
