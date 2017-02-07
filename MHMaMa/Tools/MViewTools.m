//
//  MViewTools.m
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/11/30.
//  Copyright © 2016年 李沛然. All rights reserved.
//

#import "MViewTools.h"

@implementation MViewTools

+ (UIImage *)generateOnePixImageWithColor:(UIColor *)strokeColor;
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ScreenWidth,1/[UIScreen mainScreen].scale), NO, 0);
    /*
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextBeginPath(context);
     CGFloat pixelAdjustOffset = 0;
     if (((int)(1 / [UIScreen mainScreen].scale * [UIScreen mainScreen].scale) + 1) % 2 == 0)
     {
     pixelAdjustOffset = ((1 / [UIScreen mainScreen].scale) / 2);
     }
     CGFloat yPos = 1 - ((1 / [UIScreen mainScreen].scale) / 2);
     CGContextMoveToPoint(context, 0, yPos);
     CGContextAddLineToPoint(context, 100, yPos);
     CGContextSetLineWidth(context, 1 / [UIScreen mainScreen].scale);
     CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
     CGContextStrokePath(context);
     */
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0,0)];
    [path addLineToPoint:CGPointMake(ScreenWidth,0)];
    // 设置线宽
    path.lineWidth = 1 / [UIScreen mainScreen].scale;
    // 设置画笔颜色
    [strokeColor set];
    // 根据我们设置的各个点连线
    [path stroke];
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return im;
}

@end
