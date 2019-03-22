//
//  BWButton.h
//  BeautyHouse
//
//  Created by 欧阳宏嘉 on 2019/1/9.
//  Copyright © 2019 欧阳宏嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BWImagePosType) {
    BWImageLeft = 0,
    BWImageRight,
    BWImageTop,
    BWImageBottom,
};
NS_ASSUME_NONNULL_BEGIN

@interface BWButton : UIButton
@property (nonatomic, assign) BWImagePosType type;
@end

NS_ASSUME_NONNULL_END
