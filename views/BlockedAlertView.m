//
//  BlockedAlertView.m
//
//
//  Created by ZhuHongjian on 14-10-17.
//  Copyright (c) 2014年 ZhuHongjian. All rights reserved.
//

#import "BlockedAlertView.h"

#define kDefaultTitle @"提示"
#define kCancelTitle  @"确定"

@implementation BlockedAlertView {
    void(^cancelBlock_)(void);
    void(^otherBlock1_)(void);
    void(^otherBlock2_)(NSString *text);
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(void))otherBlock {
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    if (self) {
        cancelBlock_ = cancelBlock;
        otherBlock1_ = otherBlock;
    }
    return self;
}

- (instancetype)initWithMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(void))otherBlock {
    return [self initWithTitle:kDefaultTitle message:message cancelTitle:cancelTitle cancelBlock:cancelBlock otherTitle:otherTitle otherBlock:otherBlock];
}

// alertView with textField
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message textFieldHint:(NSString *)hint textFieldValue:(NSString *)value cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(NSString *text))otherBlock {
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    if (self) {
        self.alertViewStyle = UIAlertViewStylePlainTextInput;
        
        cancelBlock_ = cancelBlock;
        otherBlock2_ = otherBlock;
    }
    return self;
}

- (instancetype)initWithMessage:(NSString *)message textFieldHint:(NSString *)hint textFieldValue:(NSString *)value cancelTitle:(NSString *)cancelTitle cancelBlock:(void(^)(void))cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(void(^)(NSString *text))otherBlock {
    return [self initWithTitle:kDefaultTitle message:message textFieldHint:hint textFieldValue:value cancelTitle:cancelTitle cancelBlock:cancelBlock otherTitle:otherTitle otherBlock:otherBlock];
}

+ (void)alertWithMessage:(NSString *)message {
    ZYBlockAlertView *alertView = [[ZYBlockAlertView alloc] initWithMessage:message cancelTitle:kCancelTitle cancelBlock:nil otherTitle:nil otherBlock:nil];
    [alertView show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.cancelButtonIndex) {
        if (cancelBlock_) {
            cancelBlock_();
        }
    } else {
        if (alertView.alertViewStyle == UIAlertViewStylePlainTextInput) {
            if (otherBlock2_) {
                UITextField *textField = [alertView textFieldAtIndex:0];
                NSString *text = textField.text;

                otherBlock2_(text);
            }
        } else {
            if (otherBlock1_) {
                otherBlock1_();
            }
        }
    }
}

@end
