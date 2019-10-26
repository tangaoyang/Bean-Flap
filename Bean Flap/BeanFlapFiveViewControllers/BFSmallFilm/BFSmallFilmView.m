//
//  BFSmallFilmView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmView.h"
#import "Masonry.h"

@implementation BFSmallFilmView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:133/255.0 green:70/255.0 blue:44/255.0 alpha:1];
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_backButton];
        [_backButton setImage:[[UIImage imageNamed:@"BeanFlapWhiteBack.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        
        self.filmLabel = [[UILabel alloc] init];
        _filmLabel.text = @"电影";
        [_filmLabel setTextColor:[UIColor whiteColor]];
        _filmLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_filmLabel];
        
        self.moreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_moreButton];
        [_moreButton setImage:[[UIImage imageNamed:@"BeanFlapMore.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews {
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(25));
        make.top.equalTo(@(45));
        make.width.equalTo(@(26));
        make.height.equalTo(@(26));
    }];
    
    [_filmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 2 - 25));
        make.top.equalTo(@(48));
        make.width.equalTo(@(90));
        make.height.equalTo(@(21));
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 52));
        make.top.equalTo(@(50));
        make.width.equalTo(@(26));
        make.height.equalTo(@(26));
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
