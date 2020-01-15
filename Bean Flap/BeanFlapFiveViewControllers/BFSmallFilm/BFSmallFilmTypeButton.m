//
//  BFSmallFilmTypeButton.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/10.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmTypeButton.h"
#import <Masonry.h>

@implementation BFSmallFilmTypeButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15;
        
        self.arrowImageView = [[UIImageView alloc] init];
        [self addSubview:_arrowImageView];
        [_arrowImageView setImage:[UIImage imageNamed:@"BeanFlapArrow.png"]];
        
        self.arrowLabel = [[UILabel alloc] init];
        [self addSubview:_arrowLabel];
        _arrowLabel.textColor = [UIColor whiteColor];
        _arrowLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)layoutSubviews {
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-7);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.width.equalTo(@(13));
        make.height.equalTo(self.mas_height).offset(-20);
    }];
    
    [_arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(13);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.width.mas_equalTo(self.mas_width).offset(-10);
        make.height.equalTo(self.mas_height).offset(-10);
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
