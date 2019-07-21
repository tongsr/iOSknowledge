//
//  CoreGraphicView.m
//  iOSKnowledgeTrain
//
//  Created by terence on 2019/7/21.
//  Copyright © 2019年 work. All rights reserved.
//

#import "CoreGraphicView.h"

@implementation CoreGraphicView

-(void)drawRect:(CGRect)rect{
    [self drawLine];

    
}
    
    
-(void)drawLine{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 10, 10);
    CGPathAddLineToPoint(path, nil, 100, 20);
    CGContextAddPath(context, path);
    
    
    
    //设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
    //CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);//设置填充色
    CGContextSetLineWidth(context, 2.0);//设置线条宽度
    //CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式
    //CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式
    //CGFloat lengths[2] = { 18, 9 };
    //CGContextSetLineDash(context, 0, lengths, 2);
    //CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0, [UIColor blackColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型
}

@end
