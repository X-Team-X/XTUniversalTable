//
//  NSAttributedString+XTConvenience.h
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_6_0

@interface NSAttributedString (XTConvenience)

+ (instancetype)xt_attributedStringWithString:(NSString*)string;

+ (instancetype)xt_attributedStringWithAttributedString:(NSAttributedString*)attrStr;

@end

@interface NSMutableAttributedString (XTConvenience)

- (void)xt_setFont:(UIFont*)font;
- (void)xt_setFont:(UIFont*)font range:(NSRange)range;
- (void)xt_setFontName:(NSString*)fontName size:(CGFloat)size;
- (void)xt_setFontName:(NSString*)fontName size:(CGFloat)size range:(NSRange)range;

- (void)xt_setTextColor:(UIColor*)color;
- (void)xt_setTextColor:(UIColor*)color range:(NSRange)range;

- (void)xt_setTextStrikethroughStyle:(NSUnderlineStyle)style;
- (void)xt_setTextStrikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range;

- (void)xt_setTextUnderLineStyle:(NSUnderlineStyle)style;
- (void)xt_setTextUnderLineStyle:(NSUnderlineStyle)style range:(NSRange)range;

- (void)xt_modifyParagraphStylesWithBlock:(void (^)(NSMutableParagraphStyle *paragraphStyle))block;
- (void)xt_modifyParagraphStylesInRange:(NSRange)range withBlock:(void(^)(NSMutableParagraphStyle *paragraphStyle))block;

- (void)xt_setParagraphStyle:(NSParagraphStyle *)paragraphStyle;
- (void)xt_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range;

@end

#endif
