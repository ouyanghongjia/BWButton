//
//  BWButton.m
//  BeautyHouse
//
//  Created by 欧阳宏嘉 on 2019/1/9.
//  Copyright © 2019 欧阳宏嘉. All rights reserved.
//

#import "BWButton.h"

@interface BWButton()
@property (nonatomic, assign) CGSize extendSize;
@property (nonatomic, strong) UILabel *caculateLabel;
@end

@implementation BWButton
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupSubViews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.caculateLabel.text = self.currentTitle;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews
{
    self.extendSize = CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return [self caculateTitleRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return [self caculateImageRect:contentRect];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    self.caculateLabel.text = title;
    self.extendSize = [self caculateContentSize];
    [self invalidateIntrinsicContentSize];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    self.extendSize = [self caculateContentSize];
    [self invalidateIntrinsicContentSize];
}

- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
{
    [super setImageEdgeInsets:imageEdgeInsets];
    self.extendSize = [self caculateContentSize];
    [self invalidateIntrinsicContentSize];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
    [super setTitleEdgeInsets:titleEdgeInsets];
    self.extendSize = [self caculateContentSize];
    [self invalidateIntrinsicContentSize];
}

- (CGRect)caculateTitleRect:(CGRect)contentRect
{
    CGSize textSize = self.caculateLabel.frame.size;
    CGFloat w = textSize.width;
    CGFloat h = textSize.height;
    CGFloat x = self.titleEdgeInsets.left;
    CGFloat y = self.titleEdgeInsets.top;
    CGRect imageRect = [self imageRectForContentRect:contentRect];
    if (self.type == BWImageLeft) {
        y = CGRectGetMidY(contentRect) - h*0.5;
        x = CGRectGetMaxX(imageRect) + self.imageEdgeInsets.right + self.titleEdgeInsets.left;
    } else if (self.type == BWImageRight) {
        y = CGRectGetMidY(contentRect) - h*0.5;
    } else if (self.type == BWImageTop) {
        x = CGRectGetMidX(contentRect) - w*0.5;
        y = CGRectGetMaxY(imageRect) + self.imageEdgeInsets.bottom + self.titleEdgeInsets.top;
    } else if (self.type == BWImageBottom) {
        x = CGRectGetMidX(contentRect) - w*0.5;
    }
    
    return CGRectMake(x, y, w, h);
}

- (CGRect)caculateImageRect:(CGRect)contentRect
{
    CGFloat w = self.currentImage.size.width;
    CGFloat h = self.currentImage.size.height;
    CGFloat x = self.imageEdgeInsets.left;
    CGFloat y = self.imageEdgeInsets.top;
    if (self.type == BWImageLeft) {
        y = CGRectGetMidY(contentRect) - h*0.5;
    } else if (self.type == BWImageRight) {
        y = CGRectGetMidY(contentRect) - h*0.5;
        x = CGRectGetWidth(contentRect) - self.imageEdgeInsets.right - w;
    } else if (self.type == BWImageTop) {
        x = CGRectGetMidX(contentRect) - w*0.5;
    } else if (self.type == BWImageBottom) {
        x = CGRectGetMidX(contentRect) - w*0.5;
        y = CGRectGetHeight(contentRect) - self.imageEdgeInsets.bottom - h;
    }
    return CGRectMake(x, y, w, h);
}

- (CGSize)caculateContentSize
{
    self.caculateLabel.font = self.titleLabel.font;
    [self.caculateLabel sizeToFit];
    
    CGSize textSize = self.caculateLabel.frame.size;
    CGSize imageSize = self.currentImage.size;
    CGFloat w = 0;
    CGFloat h = 0;
    if (self.type == BWImageLeft ||
        self.type == BWImageRight) {
        w = self.imageEdgeInsets.left + self.imageEdgeInsets.right + imageSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right + textSize.width;
        h = MAX(self.titleEdgeInsets.top + textSize.height + self.titleEdgeInsets.bottom, imageSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom);
    } else {
        w = MAX(textSize.width + self.titleEdgeInsets.left+self.titleEdgeInsets.right, imageSize.width+self.imageEdgeInsets.left+self.imageEdgeInsets.right);
        h = self.titleEdgeInsets.top + textSize.height + self.titleEdgeInsets.bottom + self.imageEdgeInsets.top + imageSize.height + self.imageEdgeInsets.bottom;
    }
    
    return CGSizeMake(w, h);
}

- (void)setType:(BWImagePosType)type
{
    _type = type;
    [self setImage:self.currentImage forState:UIControlStateNormal];
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
}

- (CGSize)intrinsicContentSize
{
    return self.extendSize;
}

- (UILabel *)caculateLabel
{
    if (!_caculateLabel) {
        _caculateLabel = [UILabel new];
    }
    return _caculateLabel;
}

@end
