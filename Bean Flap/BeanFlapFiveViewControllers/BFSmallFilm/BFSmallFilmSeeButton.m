//
//  BFSmallFilmSeeButton.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/8.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmSeeButton.h"

@implementation BFSmallFilmSeeButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        self.seeImageView = [[UIImageView alloc] init];
        [self addSubview:_seeImageView];
        
        self.seeLabel = [[UILabel alloc] init];
        [self addSubview:_seeLabel];
        _seeLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)layoutSubviews {
    _seeImageView.frame = CGRectMake(self.bounds.size.width / 2 - 30, 14, 20, 20);
    _seeLabel.frame = CGRectMake(self.bounds.size.width / 2 - 5, 16, 50, 17);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
