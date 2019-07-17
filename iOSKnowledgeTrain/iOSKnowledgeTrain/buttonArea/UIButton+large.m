//
//  UIButton+large.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/17.
//  Copyright © 2019 work. All rights reserved.
//

#import "UIButton+large.h"

@implementation UIButton (large)


- (CGRect)enlargedRect {
        return CGRectMake(self.bounds.origin.x - 100,
                          self.bounds.origin.y - 100,
                          self.bounds.size.width + 200,
                          self.bounds.size.height + 200);

}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    CGRect rect = [self enlargedRect];
    //如果按钮设置为不可点击、隐藏、透明度小于等于0.01或者点击在按钮内部，则直接执行父类方法
    if (CGRectEqualToRect(rect, self.bounds) || self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return [super hitTest:point withEvent:event];
    }
    //判断点击是否在放大的范围内
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
