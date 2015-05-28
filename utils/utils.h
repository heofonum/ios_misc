//
//  utils.h
//  
//
//  Created by HongjianZhu on 15/5/14.
//  Copyright (c) 2015年 HongjianZhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface utils : NSObject

+ (BOOL)isStrEmpty:(NSString *)str

+ (id)instantiateViewController:(NSString *)identifier storyboard:(NSString *)sb;

+ (CGFloat)widthOfString:(NSString *)string font:(UIFont *)font constrainToHeight:(CGFloat)height;
+ (CGFloat)heightOfString:(NSString *)string font:(UIFont *)font constrainToWidth:(CGFloat)width;
+ (CGSize)sizeOfLabelConstrainToWidth:(UILabel *)label;
+ (CGSize)sizeOfLabelConstrainToHeight:(UILabel *)label;

@end
