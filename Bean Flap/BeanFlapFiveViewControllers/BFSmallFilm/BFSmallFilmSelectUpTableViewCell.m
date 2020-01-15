//
//  BFSmallFilmSelectUpTableViewCell.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/8.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmSelectUpTableViewCell.h"
#import "Masonry.h"

@implementation BFSmallFilmSelectUpTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _filmImageView = [[UIImageView alloc] init];
        [self addSubview:_filmImageView];
        
        _filmNameLabel = [[UILabel alloc] init];
        [self addSubview:_filmNameLabel];
        _filmNameLabel.font = [UIFont systemFontOfSize:30];
        _filmNameLabel.textColor = [UIColor whiteColor];
        
        _timeLabel = [[UILabel alloc] init];
        [self addSubview:_timeLabel];
        _timeLabel.textColor = [UIColor whiteColor];
        
        _rankLabel = [[UILabel alloc] init];
        [self addSubview:_rankLabel];
        
        _contentLabel = [[UILabel alloc] init];
        [self addSubview:_contentLabel];
        _contentLabel.textColor = [UIColor colorWithRed:171/255.0 green:132/255.0 blue:119/255.0 alpha:1];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        
        _seeButton = [[BFSmallFilmSeeButton alloc] init];
        [self addSubview:_seeButton];
        [_seeButton.seeImageView setImage:[UIImage imageNamed:@"BeanFlapFilmUnPick.png"]];
        _seeButton.seeLabel.text = @"想看";
        
        _sawButton = [[BFSmallFilmSeeButton alloc] init];
        [self addSubview:_sawButton];
        [_sawButton.seeImageView setImage:[UIImage imageNamed:@"BeanFlapSaw.png"]];
        _sawButton.seeLabel.text = @"看过";
        
        _gradeImageView = [[UIImageView alloc] init];
        [self addSubview:_gradeImageView];
        _gradeImageView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _gradeImageView.layer.masksToBounds = YES;
        _gradeImageView.layer.cornerRadius = 10;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_filmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.top.mas_equalTo(self.mas_top).offset(25);
        make.width.equalTo(@(125));
        make.height.equalTo(@(175));
    }];
    
    [_filmNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(15);
        make.left.mas_equalTo(self.mas_left).offset(155);
        make.width.equalTo(@(250));
        make.height.equalTo(@(45));
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(60);
        make.left.mas_equalTo(self.mas_left).offset(155);
        make.width.equalTo(@(250));
        make.height.equalTo(@(25));
    }];
    
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(105);
        make.left.mas_equalTo(self.mas_left).offset(155);
        make.width.equalTo(@(150));
        make.height.equalTo(@(30));
    }];
    
    [_seeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(220);
        make.left.mas_equalTo(self.mas_left).offset(155);
        make.width.equalTo(@(120));
        make.height.equalTo(@(45));
    }];
    
    [_sawButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(220);
        make.left.mas_equalTo(self.mas_left).offset(283);
        make.width.equalTo(@(120));
        make.height.equalTo(@(45));
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(130);
        make.left.mas_equalTo(self.mas_left).offset(150);
        make.width.equalTo(@(250));
        make.height.equalTo(@(75));
    }];
    
    [_gradeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(285);
        make.width.mas_equalTo(self.mas_width).offset(-20);
        make.height.equalTo(@(150));
    }];
}

- (void)makeGradeImageView:(NSString *)grade saw:(NSString *)sawCount see:(NSString *)seeCount grade1:(NSString *)grade1 grade2:(NSString *)grade2 grade3: (NSString *)grade3 grade4:(NSString *)grade4 grade5:(NSString *)grade5 {
    double gradeDouble = [grade doubleValue];
    double gradeOne = [grade1 doubleValue];
    double gradeTwo = [grade2 doubleValue];
    double gradeThree = [grade3 doubleValue];
    double gradeFour = [grade4 doubleValue];
    double gradeFive = [grade5 doubleValue];
    double gradeCount = gradeOne + gradeTwo + gradeThree + gradeFour + gradeFive;
    
    UILabel *logoLabel = [[UILabel alloc] init];
    [_gradeImageView addSubview:logoLabel];
    logoLabel.frame = CGRectMake(15, 10, 100, 20);
    logoLabel.text = @"豆瓣评分™";
    logoLabel.font = [UIFont systemFontOfSize:13];
    logoLabel.textColor = [UIColor whiteColor];
    
    UILabel *ratingsCountLabel = [[UILabel alloc] init];
    [_gradeImageView addSubview:ratingsCountLabel];
    ratingsCountLabel.text = [NSString stringWithFormat:@"%0.0f人评分", gradeCount];
    ratingsCountLabel.frame = CGRectMake(280, 98, 100, 20);
    ratingsCountLabel.font = [UIFont systemFontOfSize:12];
    ratingsCountLabel.textColor = [UIColor colorWithRed:171/255.0 green:132/255.0 blue:119/255.0 alpha:1];
    
    UILabel *sawLabel = [[UILabel alloc] init];
    [_gradeImageView addSubview:sawLabel];
    double sawCountDouble = [sawCount doubleValue];
    if (sawCountDouble > 10000) {
        sawCountDouble /= 10000;
        sawLabel.text = [NSString stringWithFormat:@"%0.1f万人看过", sawCountDouble];
    } else {
        sawLabel.text = [NSString stringWithFormat:@"%0.0f人看过", sawCountDouble];
    }
    sawLabel.frame = CGRectMake(self.bounds.size.width - 190, 120, 90, 18);
    sawLabel.textColor = [UIColor colorWithRed:171/255.0 green:152/255.0 blue:129/255.0 alpha:1];
    sawLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *seeLabel = [[UILabel alloc] init];
    [_gradeImageView addSubview:seeLabel];
    seeLabel.frame = CGRectMake(self.bounds.size.width - 97, 120, 90, 18);
    double seeCountDouble = [seeCount doubleValue];
    if (seeCountDouble > 10000) {
        seeCountDouble /= 10000;
        seeLabel.text = [NSString stringWithFormat:@"%0.1f万人想看", seeCountDouble];
    } else {
        seeLabel.text = [NSString stringWithFormat:@"%0.0f人想看", seeCountDouble];
    }
    seeLabel.textColor = [UIColor colorWithRed:171/255.0 green:152/255.0 blue:129/255.0 alpha:1];
    seeLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *gradeLabel = [[UILabel alloc] init];
    if (gradeDouble == 0.0) {
        gradeLabel.text = @"尚未上映";
        gradeLabel.font = [UIFont systemFontOfSize:22];
    } else {
        gradeLabel.text = [NSString stringWithFormat:@"%0.1f", gradeDouble];
        gradeLabel.font = [UIFont systemFontOfSize:42];
        
        UIImageView *starImageView = [[UIImageView alloc] init];
        for (int j = 0; j < 5; j++) {
            UIImageView *starSingleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(14 * j, 0, 13, 13)];
            if (gradeDouble - 2 >= 0) {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarLight.png"]];
            } else if ((gradeDouble - 2 < 0) && (gradeDouble - 2 > -1)) {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarPart.png"]];
            } else {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
            }
            gradeDouble -= 2;
            [starImageView addSubview:starSingleImageView];
        }
        starImageView.frame = CGRectMake(47, 100, 80, 15);
        [_gradeImageView addSubview:starImageView];
        
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5 - i; j++) {
                UIImageView *starSingleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 - 10 * j, i * 13 + 32, 10, 10)];
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
                [_gradeImageView addSubview:starSingleImageView];
            }
            if (grade4 != nil) {
                UIProgressView *gradeProgressView = [[UIProgressView alloc] init];
                gradeProgressView.frame = CGRectMake(195, i * 14 + 36, 100, 13);
                gradeProgressView.backgroundColor = [UIColor grayColor];
                gradeProgressView.progressTintColor = [UIColor orangeColor];
                gradeProgressView.progressViewStyle = UIProgressViewStyleDefault;
                if (i == 4) {
                    double progress = gradeOne/gradeCount;
                    gradeProgressView.progress = progress;
                } else if (i == 3) {
                    gradeProgressView.progress = (gradeTwo/gradeCount);
                } else if (i == 2) {
                    gradeProgressView.progress = (gradeThree/gradeCount);
                } else if (i == 1) {
                    gradeProgressView.progress = (gradeFour/gradeCount);
                } else {
                    gradeProgressView.progress = (gradeFive/gradeCount);
                }
                [_gradeImageView addSubview:gradeProgressView];
            }
        }
    }
    gradeLabel.textColor = [UIColor whiteColor];
    gradeLabel.frame = CGRectMake(55, 40, 130, 45);
    [_gradeImageView addSubview:gradeLabel];
    
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
