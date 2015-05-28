//
//  BlockedAlertView.h
//
//
//  Created by ZhuHongjian on 14-10-17.
//  Copyright (c) 2014年 ZhuHongjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockedAlertView : UIAlertView <UIAlertViewDelegate>

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(void))otherBlock;

- (instancetype)initWithMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(void))otherBlock;

// alertView with textField
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message textFieldHint:(NSString *)hint textFieldValue:(NSString *)value cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(NSString *text))otherBlock;

- (instancetype)initWithMessage:(NSString *)message textFieldHint:(NSString *)hint textFieldValue:(NSString *)value cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(NSString *text))otherBlock;

+ (void)alertWithMessage:(NSString *)message;

@end
