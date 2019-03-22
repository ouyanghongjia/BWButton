//
//  ViewController.m
//  BWButtonDemo
//
//  Created by 欧阳宏嘉 on 2019/3/22.
//

#import "ViewController.h"
#import "BWButton.h"
#import "Masonry.h"
#import "CustomButton.h"

@interface ViewController ()
@property (nonatomic, strong) BWButton *topBtn;
@property (nonatomic, strong) BWButton *leftBtn;
@property (nonatomic, strong) BWButton *rightBtn;
@property (nonatomic, strong) BWButton *bottomBtn;

@property (nonatomic, strong) UIButton *systemBtn;
@property (nonatomic, strong) CustomButton *customBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.systemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.systemBtn setTitle:@"系统按钮" forState:UIControlStateNormal];
    [self.systemBtn setImage:[UIImage imageNamed:@"icon_like_big_h"] forState:UIControlStateNormal];
    [self.systemBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.systemBtn];
    
    [self.systemBtn setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
    [self.systemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-50);
    }];
    
    self.customBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    [self.customBtn setTitle:@"自定义按钮" forState:UIControlStateNormal];
    [self.customBtn setImage:[UIImage imageNamed:@"icon_like_big_h"] forState:UIControlStateNormal];
    [self.customBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.customBtn];
    
    [self.customBtn setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
    [self.customBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
    
    
    self.topBtn = [self buttonWithType:BWImageTop title:@"图片在上"];
    self.leftBtn = [self buttonWithType:BWImageLeft title:@"图片在左，文字在右"];
    self.rightBtn = [self buttonWithType:BWImageRight title:@"图片在右，文字在左"];
    self.bottomBtn = [self buttonWithType:BWImageBottom title:@"图片在下"];
    
    [self.view addSubview:self.topBtn];
    [self.view addSubview:self.leftBtn];
    [self.view addSubview:self.rightBtn];
    [self.view addSubview:self.bottomBtn];
    
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.centerX.mas_equalTo(0);
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
    }];
    
    [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-50);
        make.centerX.mas_equalTo(0);
    }];
}

- (BWButton *)buttonWithType:(BWImagePosType)type title:(NSString *)title
{
    BWButton *button = [BWButton buttonWithType:UIButtonTypeCustom];
    button.type = type;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_like_big_h"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]];
    return button;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.leftBtn setTitle:@"文字在➡️" forState:UIControlStateNormal];
    [self.rightBtn setTitle:@"文字在⬅️" forState:UIControlStateNormal];
}

@end
