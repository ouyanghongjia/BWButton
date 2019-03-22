//
//  CustomButton.m
//  BWButtonDemo
//
//  Created by 欧阳宏嘉 on 2019/3/23.
//

#import "CustomButton.h"

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * 0.3);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, CGRectGetHeight(contentRect) * 0.3, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * 0.7);
}

@end
