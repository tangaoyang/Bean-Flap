//
//  BFFilmListTableViewCell.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/16.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFFilmListTableViewCell.h"
#import "Masonry.h"

@implementation BFFilmListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.filmButton = [[UIButton alloc] init];
    self.filmButton.backgroundColor = [UIColor blackColor];
    self.filmButton.layer.masksToBounds = YES;
    self.filmButton.layer.cornerRadius = 5;
    [self addSubview:self.filmButton];
    
    self.filmNameLabel = [[UILabel alloc] init];
    [self addSubview:self.filmNameLabel];
    self.filmNameLabel.text = @"这是电影名";
    self.filmNameLabel.font = [UIFont systemFontOfSize:20];
    self.filmNameLabel.textColor = [UIColor blackColor];
    
    self.starImageView = [[UIImageView alloc] init];
    self.starImageView.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.starImageView];
    
    self.contentLabel = [[UILabel alloc] init];
    [self addSubview: self.contentLabel];
    self.contentLabel.text = @"这是内容";
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel.textColor = [UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0];
    
    self.buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:self.buyButton];
    self.buyButton.layer.masksToBounds = YES;
    self.buyButton.layer.borderWidth = 1;
    self.buyButton.layer.cornerRadius = 5;
    self.buyButton.layer.borderColor = [UIColor colorWithRed:0.95 green:0.45 blue:0.48 alpha:1.0].CGColor;
    [self.buyButton setTitle:@"购票" forState:UIControlStateNormal];
    self.buyButton.tintColor = [UIColor colorWithRed:0.95 green:0.45 blue:0.48 alpha:1.0];
    [self.buyButton addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
    
    self.sawLabel = [[UILabel alloc] init];
    [self addSubview:self.sawLabel];
    self.sawLabel.text = @"39.5万人看过";
    self.sawLabel.textColor = [UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0];
    self.sawLabel.font = [UIFont systemFontOfSize:13];
    
    self.scoreLabel = [[UILabel alloc] init];
    [self addSubview:self.scoreLabel];
    self.scoreLabel.text = @"8.0";
    self.scoreLabel.font = [UIFont systemFontOfSize:12];
    self.scoreLabel.textColor = [UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.filmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(30));
        make.top.equalTo(@(20));
        make.width.equalTo(@(100));
        make.height.equalTo(@(150));
    }];
    
    [self.filmNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(150));
        make.top.equalTo(@(20));
        make.width.equalTo(@(200));
        make.height.equalTo(@(21));
    }];
    
    [self.starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(150));
        make.top.equalTo(@(60));
        make.width.equalTo(@(80));
        make.height.equalTo(@(15));
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(235));
        make.top.equalTo(@(60));
        make.width.equalTo(@(30));
        make.height.equalTo(@(15));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(150));
        make.top.equalTo(@(70));
        make.width.equalTo(@(200));
        make.height.equalTo(@(50));
    }];
    
    [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(300));
        make.top.equalTo(@(55));
        make.width.equalTo(@(70));
        make.height.equalTo(@(33));
    }];
    
    [self.sawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(295));
        make.top.equalTo(@(92));
        make.width.equalTo(@(85));
        make.height.equalTo(@(15));
    }];
}

- (void)buy {
    [self.celldelegate addBuy];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
