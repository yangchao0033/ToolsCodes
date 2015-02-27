//
//  UIImage+HM.m
//  02-图片裁剪
//
//  Created by 杨超 on 15-2-27.
//  Copyright (c) 2015年 yangchao. All rights reserved.
//

#import "UIImage+HM.h"

@implementation UIImage (HM)
/**
 *  用作头像截取为带圆环的圆形头像
 *
 *  @param name  头像名
 *  @param width 圆环截取宽度
 *  @param color 圆环颜色
 *
 *  @return 截取后的头像
 */
+ (instancetype)imageWithIconName:(NSString *)name boardWidth:(CGFloat)width boardColor:(UIColor *)color
{
    // 圆环的宽度
    CGFloat boardW = width;
    // 加载旧的图片
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 大圆矩形的尺寸
    CGFloat bigW = oldImage.size.width + boardW * 2;
    CGFloat bigH = bigW;
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bigW, bigH), NO, 0);
    
    // 3、画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, bigW, bigH)];
    // 获取当前上下文
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    // 添加上下文
    CGContextAddPath(cxt, path.CGPath);
    // 设置颜色
    [color set];
    // 渲染
    CGContextFillPath(cxt);
    
    // 画小圆
    CGFloat smallX = boardW;
    CGFloat smallY = boardW;
    CGFloat smallW = oldImage.size.width;
    CGFloat smallH = oldImage.size.height;
    CGContextAddEllipseInRect(cxt, CGRectMake(smallX, smallY, smallW, smallH));// 这个圆只是为了限制显示区域，不用渲染
    
    
    
    // 设置裁剪区域
    //    [path addClip];
    CGContextClip(cxt);
    
    // 画图片
    //    [oldImage drawAtPoint:CGPointZero];
    [oldImage drawInRect:CGRectMake(smallX, smallY, smallW, smallH)];
    
    
    
    // 生成新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
@end
