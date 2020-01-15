//
//  BFSmallFilmLongTableViewCell.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/23.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmLongTableViewCell.h"

@implementation BFSmallFilmLongTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1];
    
    self.usefulLabel = [[UILabel alloc] init];
    [self addSubview:_usefulLabel];
    _usefulLabel.textColor = [UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1];
    _usefulLabel.font = [UIFont systemFontOfSize:15];
    
    self.commentLabel = [[UILabel alloc] init];
    [self addSubview:_commentLabel];
    _commentLabel.font = [UIFont systemFontOfSize:15];
    _commentLabel.textColor = [UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1];
    
    self.sawLabel = [[UILabel alloc] init];
    [self addSubview:_sawLabel];
    _sawLabel.textColor = [UIColor colorWithRed:145/25.0 green:145/255.0 blue:145/255.0 alpha:1];
    _sawLabel.text = @"看过";
    _sawLabel.font = [UIFont systemFontOfSize:9];
    
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    
    self.contentLabel = [[UILabel alloc] init];
    [self addSubview:_contentLabel];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.textColor = [UIColor colorWithRed:185/255.0 green:185/255.0 blue:185/255.0 alpha:1];
    _contentLabel.numberOfLines = 3;
    
    self.headImageView = [[UIImageView alloc] init];
    [self addSubview:_headImageView];
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.cornerRadius = 20;
    
    self.starImageView = [[UIImageView alloc] init];
    [self addSubview:_starImageView];
    
    return self;
}

- (void)layoutSubviews {
    _nameLabel.frame = CGRectMake(50, 13, 100, 20);
    _headImageView.frame = CGRectMake(13, 5, 30, 30);
    _sawLabel.frame = CGRectMake(150, 20, 20, 10);
    _starImageView.frame = CGRectMake(175, 16, 80, 15);
    _titleLabel.frame = CGRectMake(10, 58, self.bounds.size.width - 20, 21);
    _contentLabel.frame = CGRectMake(10, 78, self.bounds.size.width - 30, 60);
    _commentLabel.frame = CGRectMake(15, 148, 80, 15);
    _usefulLabel.frame = CGRectMake(115, 148, 100, 15);
    double gradeDouble = [_grade doubleValue] * 2;
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
        [_starImageView addSubview:starSingleImageView];
    }
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
