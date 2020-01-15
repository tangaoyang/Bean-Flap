//
//  BFSmallFilmSelectUpTableViewCell.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/8.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFSmallFilmSeeButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmSelectUpTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *filmImageView;//电影宣传照
@property (nonatomic, strong) UILabel *filmNameLabel;//电影名字
@property (nonatomic, strong) UILabel *timeLabel;//上映时间
@property (nonatomic, strong) UILabel *rankLabel;//排名
@property (nonatomic, strong) UILabel *contentLabel;//电影介绍
@property (nonatomic, strong) BFSmallFilmSeeButton *seeButton;//想看按钮
@property (nonatomic, strong) BFSmallFilmSeeButton *sawButton;//看过按钮
@property (nonatomic, strong) UIImageView *gradeImageView;//分数图

- (void)makeGradeImageView:(NSString *)grade saw:(NSString *)sawCount see:(NSString *)seeCount grade1:(NSString *)grade1 grade2:(NSString *)grade2 grade3: (NSString *)grade3 grade4:(NSString *)grade4 grade5:(NSString *)grade5 ;

@end

NS_ASSUME_NONNULL_END
