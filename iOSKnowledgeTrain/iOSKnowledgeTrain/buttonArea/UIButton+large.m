//
//  UIButton+large.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/17.
//  Copyright © 2019 work. All rights reserved.
//

#import "UIButton+large.h"
#import <objc/runtime.h>



@implementation UIButton (large)

    
    
-(void)btnBigger:(int)size{
    objc_setAssociatedObject(self,  @"top", [NSNumber numberWithInt:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,  @"left", [NSNumber numberWithInt:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,  @"bottom", [NSNumber numberWithInt:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,  @"right", [NSNumber numberWithInt:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
    
    

- (CGRect)enlargedRect
    {
        NSNumber *topEdge = objc_getAssociatedObject(self, @"top");
        NSNumber *leftEdge = objc_getAssociatedObject(self, @"left");
        NSNumber *bottomEdge = objc_getAssociatedObject(self, @"bottom");
        NSNumber *rightEdge = objc_getAssociatedObject(self, @"right");
        
        if (topEdge && rightEdge && bottomEdge && leftEdge){
            
            return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                              self.bounds.origin.y - topEdge.floatValue,
                              self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                              self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
        }else{
            
            return self.bounds;
        }
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
