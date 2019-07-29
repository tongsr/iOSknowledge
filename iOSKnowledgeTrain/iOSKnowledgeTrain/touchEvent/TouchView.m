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
    if ([super pointInside:point withEvent:event]) {
        return self;
    }
    else return nil;
}



-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


@end
