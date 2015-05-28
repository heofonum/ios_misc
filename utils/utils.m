//
//  utils.m
//  
//
//  Created by HongjianZhu on 15/5/14.
//  Copyright (c) 2015年 HongjianZhu. All rights reserved.
//

#import "utils.h"

@implementation utils

+ (id)instantiateViewController:(NSString *)identifier storyboard:(NSString *)sb {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sb bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

+ (BOOL)isStrEmpty:(NSString *)str {
    if (!str) return YES;
    
    if ([str isEqual:[NSNull null]]) return YES;
    
    if ([str respondsToSelector:@selector(length)]) {
        if ([str length] == 0) return YES;
    } else
        return YES;
    
    str = [str stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // here we can call length method directly
    if ([str length] == 0)
        return YES;
    
    return NO;
}

+ (CGFloat)heightOfString:(NSString *)string font:(UIFont *)font constrainToWidth:(CGFloat)width {
    if ([utils isStringEmpty:string]) {
        return 0;
    }
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    
    return ceilf(size.height);
}

+ (CGFloat)widthOfString:(NSString *)string font:(UIFont *)font constrainToHeight:(CGFloat)height {
    if ([utils isStringEmpty:string]) {
        return 0;
    }
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    
    return ceilf(size.width);
}

+ (CGSize)sizeOfLabelConstrainToWidth:(UILabel *)label {
    CGSize size = label.frame.size;
    
    CGFloat height = [self heightOfString:label.text font:label.font constrainToWidth:size.width];
    size.height = height;
    
    return size;
}

+ (CGSize)sizeOfLabelConstrainToHeight:(UILabel *)label {
    CGSize size = label.frame.size;
    
    CGFloat width = [self widthOfString:label.text font:label.font constrainToHeight:size.height];
    size.width = width;
    
    return size;
}

@end
