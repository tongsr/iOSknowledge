//
//  TouchView.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/29.
//  Copyright © 2019 work. All rights reserved.
//

#import "TouchView.h"


@interface TouchView()

@end


@implementation TouchView


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
//    if ([super pointInside:point withEvent:event]) {
//        NSLog(@"touch %@",self.name);
//    }
//    else{
//        NSLog(@"not touch %@",self.name);
//    }
    
    if (CGRectContainsPoint(self.bounds, point)) {
        NSLog(@"touch %@  event  %@",self.name,event.description);
    }else{
        NSLog(@"not touch %@",self.name);
    }
    
    return [super hitTest:point withEvent:event];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch begin %@",self.name);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"touch end %@",self.name);
}


@end
