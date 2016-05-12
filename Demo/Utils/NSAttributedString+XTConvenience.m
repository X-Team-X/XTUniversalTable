//
//  NSAttributedString+XTConvenience.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "NSAttributedString+XTConvenience.h"
#import <CoreText/CoreText.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_6_0

#pragma mark - NSAttributedString

@implementation NSAttributedString (XTConvenience)

+ (instancetype)xt_attributedStringWithString:(NSString*)string
{
    if (string)
    {
        return [[self alloc] initWithString:string];
    }
    else
    {
        return nil;
    }
}

+ (instancetype)xt_attributedStringWithAttributedString:(NSAttributedString*)attrStr
{
    if (attrStr)
    {
        return [[self alloc] initWithAttributedString:attrStr];
    }
    else
    {
        return nil;
    }
}

@end

#pragma mark - NSMutableAttributedString

@implementation NSMutableAttributedString (XTConvenience)

#pragma mark - Font

-(void)xt_setFont:(UIFont*)font
{
    [self xt_setFontName:font.fontName size:font.pointSize];
}

-(void)xt_setFont:(UIFont*)font range:(NSRange)range
{
    [self xt_setFontName:font.fontName size:font.pointSize range:range];
}

-(void)xt_setFontName:(NSString*)fontName size:(CGFloat)size
{
    [self xt_setFontName:fontName size:size range:NSMakeRange(0,[self length])];
}

-(void)xt_setFontName:(NSString*)fontName size:(CGFloat)size range:(NSRange)range
{
    [self removeAttribute:NSFontAttributeName range:range];
    [self addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:size] range:range];
}

#pragma mark - Color

-(void)xt_setTextColor:(UIColor*)color
{
    [self xt_setTextColor:color range:NSMakeRange(0,[self length])];
}

-(void)xt_setTextColor:(UIColor*)color range:(NSRange)range
{
    [self removeAttribute:NSForegroundColorAttributeName range:range];
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)xt_setTextStrikethroughStyle:(NSUnderlineStyle)style
{
    [self xt_setTextStrikethroughStyle:style range:NSMakeRange(0, self.length)];
}

- (void)xt_setTextStrikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range
{
    [self removeAttribute:NSStrikethroughStyleAttributeName range:range];
    [self addAttribute:NSStrikethroughStyleAttributeName value:@(style) range:range];
}

- (void)xt_setTextUnderLineStyle:(NSUnderlineStyle)style
{
    [self xt_setTextUnderLineStyle:style range:NSMakeRange(0, self.length)];
}

- (void)xt_setTextUnderLineStyle:(NSUnderlineStyle)style range:(NSRange)range
{
    [self removeAttribute:NSUnderlineStyleAttributeName range:range];
    [self addAttribute:NSUnderlineStyleAttributeName value:@(style) range:range];
}

- (void)xt_modifyParagraphStylesWithBlock:(void (^)(NSMutableParagraphStyle *paragraphStyle))block
{
    [self xt_modifyParagraphStylesInRange:NSMakeRange(0, self.length) withBlock:block];
}

- (void)xt_modifyParagraphStylesInRange:(NSRange)range withBlock:(void (^)(NSMutableParagraphStyle *))block
{
    NSParameterAssert(block != nil);
    
    NSRangePointer rangePtr = &range;
    NSUInteger loc = range.location;
    [self beginEditing];
    while (NSLocationInRange(loc, range))
    {
        NSParagraphStyle *paraStyle = [self attribute:NSParagraphStyleAttributeName
                                              atIndex:loc
                                longestEffectiveRange:rangePtr
                                              inRange:range];
        if (!paraStyle)
        {
            paraStyle = [NSParagraphStyle defaultParagraphStyle];
        }
        NSMutableParagraphStyle *mutableParaStyle = [paraStyle mutableCopy];
        block(mutableParaStyle);
        [self xt_setParagraphStyle:mutableParaStyle range:*rangePtr];
        
        loc = NSMaxRange(*rangePtr);
    }
    [self endEditing];
}

- (void)xt_setParagraphStyle:(NSParagraphStyle *)paragraphStyle
{
    [self xt_setParagraphStyle:paragraphStyle range:NSMakeRange(0, self.length)];
}

- (void)xt_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range
{
    [self removeAttribute:NSParagraphStyleAttributeName range:range];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}

@end

#endif