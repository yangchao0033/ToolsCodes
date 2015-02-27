//
//  UIImage+HM.h
//  02-图片裁剪
//
//  Created by 杨超 on 15-2-27.
//  Copyright (c) 2015年 yangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HM)
/**
 *  用作头像截取为带圆环的圆形头像
 *
 *  @param name  头像名
 *  @param width 圆环截取宽度
 *  @param color 圆环颜色
 *
 *  @return 截取后的头像
 */
+ (instancetype)imageWithIconName:(NSString *)name boardWidth:(CGFloat)width boardColor:(UIColor *)color;
/**
 *  用于截图的类方法
 *
 *  @param view 需要截取的控件
 *
 *  @return 返回的截取的图片
 */
+ (instancetype)captureWithView:(UIView *)view;
@end
