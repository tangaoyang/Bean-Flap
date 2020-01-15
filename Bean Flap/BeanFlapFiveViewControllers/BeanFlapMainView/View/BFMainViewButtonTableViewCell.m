//
//  BFMainViewButtonTableViewCell.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/13.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFMainViewButtonTableViewCell.h"
#import "BeanFlapFilmListViewController.h"
#import "BeanFlapMainViewController.h"
#import "Masonry.h"

@implementation BFMainViewButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.filmNameArray = [[NSMutableArray alloc] init];
//    NSLog(@"123");
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveTitle:) name:@"titleCenter" object:nil];
    
    self.FilmscrollView = [[UIScrollView alloc] init];
    [self addSubview:self.FilmscrollView];
    self.FilmscrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 500);
    
    self.bigButtonArray = [[NSMutableArray alloc] init];
    self.bigPartArray = [[NSArray alloc] init];
    self.bigPartArray = @[@"影院热映", @"即将上映"];
    for (int i = 0; i < self.bigPartArray.count; i++) {
        UIButton *bigButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [bigButton setTitle:[NSString stringWithFormat:@"%@", self.bigPartArray[i]] forState:UIControlStateNormal];
        bigButton.tag = 200 + i;
        if (i == 0) {
            [bigButton setTintColor:[UIColor blackColor]];
        } else {
            [bigButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
        [bigButton addTarget:self action:@selector(bigButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [bigButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
        [self addSubview:bigButton];
        [self.bigButtonArray addObject:bigButton];
    }
    
    self.cellBlackLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-BlackLine.png"]];
    [_FilmscrollView addSubview:_cellBlackLineImageView];
    
    self.pickButtonArray = [[NSMutableArray alloc] init];
    
    self.filmGradeLabelArray = [[NSMutableArray alloc] init];
    
    self.showAllLabel = [[UILabel alloc] init];
    [self addSubview:self.showAllLabel];
    self.showAllLabel.text = @"观影指南";
    self.showAllLabel.textAlignment = NSTextAlignmentCenter;
    self.showAllLabel.textColor = [UIColor whiteColor];
    self.showAllLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];//字体加粗
    self.showAllLabel.backgroundColor = [UIColor redColor];
    self.showAllLabel.layer.masksToBounds = YES;
    self.showAllLabel.layer.cornerRadius = 8;
    
    self.showAllFilmCount = [[UILabel alloc] init];
    [self addSubview:self.showAllFilmCount];
    self.showAllFilmCount.text = @"全部 xx";
    self.showAllFilmCount.font = [UIFont systemFontOfSize:15];
    
    self.downLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Line.png"]];
    [self addSubview:self.downLineImageView];
    
    self.filmButtonArray = [[NSMutableArray alloc] init];
    self.filmnameLabelArray = [[NSMutableArray alloc] init];
    [self.filmNameArray addObject:@"我和我的祖国"];
    [self.filmNameArray addObject:@"123"];
    [self.filmNameArray addObject:@"中国机长"];
    [self.filmNameArray addObject:@"我和我的祖国"];
    [self.filmNameArray addObject:@"我和我的祖国"];
    [self.filmNameArray addObject:@"我和我的祖国"];
    
    
    self.filmGradeArray = [[NSMutableArray alloc] init];
    self.filmGradeImageArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        [_filmGradeArray addObject:[NSString stringWithFormat:@"%d", rand()%10]];
    }
    for (int i = 0; i < 6; i++) {
        int grade = [_filmGradeArray[i] intValue];
        UIImageView *starImageView = [[UIImageView alloc] init];
        for (int j = 0; j < 5; j++) {
            UIImageView *starSingleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16 * j, 0, 15, 15)];
            if (grade - 2 >= 0) {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarLight.png"]];
            } else if ((grade - 2 < 0) && (grade - 2 > -2)) {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarPart.png"]];
            } else {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
            }
            grade -= 2;
            [starImageView addSubview:starSingleImageView];
        }
        [_filmGradeImageArray addObject:starImageView];
        [_FilmscrollView addSubview:starImageView];
    }
    
    for (int j = 0; j < 6; j++) {
        UIButton *filmButton = [[UIButton alloc] init];
        [self.FilmscrollView addSubview:filmButton];
        [self.filmButtonArray addObject:filmButton];
        filmButton.layer.masksToBounds = YES;
        filmButton.layer.cornerRadius = 10;
        filmButton.backgroundColor = [UIColor orangeColor];
        [filmButton addTarget:self action:@selector(pressFilm) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *filmLabel = [[UILabel alloc] init];
        filmLabel.text = self.filmNameArray[j];
        [self.filmnameLabelArray addObject:filmLabel];
        [self.FilmscrollView addSubview:filmLabel];
        
        UILabel *starLabel = [[UILabel alloc] init];
        starLabel.text = self.filmGradeArray[j];
        starLabel.font = [UIFont systemFontOfSize:12];
        [starLabel setTextColor:[UIColor grayColor]];
        [self.filmGradeLabelArray addObject:starLabel];
        [self.FilmscrollView addSubview:starLabel];
        
        UIButton *pickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [pickButton setImage:[[UIImage imageNamed:@"BeanFlapFilmUnPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [pickButton addTarget:self action:@selector(pick:) forControlEvents:UIControlEventTouchUpInside];
        [self.FilmscrollView addSubview:pickButton];
        [self.pickButtonArray addObject:pickButton];
        
    }
    return self;
    
}

//- (void)receiveTitle:(NSNotification *)noti {
//    NSLog(@"before  ==  %@", _filmNameArray);
//    [self.filmNameArray addObject:@"我和我的祖国"];
//    [self.filmNameArray addObject:[noti.userInfo objectForKey:@"title"]];
//    [self.filmNameArray addObject:@"中国机长"];
//    [self.filmNameArray addObject:@"我和我的祖国"];
//    [self.filmNameArray addObject:@"我和我的祖国"];
//    [self.filmNameArray addObject:@"我和我的祖国"];
//    NSLog(@"_filmNameArray   ==    %@", _filmNameArray);
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int i = 0;
    for (UIButton *exButton in self.bigButtonArray) {
        [exButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 4 * i));
            make.top.equalTo(@(1));
            make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 4));
            make.height.equalTo(@(90));
        }];
        i++;
    }
    
    [self.showAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 150));
        make.top.equalTo(@(38));
        make.width.equalTo(@(53));
        make.height.equalTo(@(18));
    }];

    [self.showAllFilmCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 90));
        make.top.equalTo(@(35));
        make.width.equalTo(@(53));
        make.height.equalTo(@(20));
    }];
    
    [self.downLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(77));
        make.height.equalTo(@(1));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
    }];
    
    [self.FilmscrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(78));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width * 2));
        make.height.equalTo(@(700));
    }];
    
    [_cellBlackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(5));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 4 - 6));
        make.height.equalTo(@(2));
    }];
    
    for (int j = 0; j < 2; j++) {
        for (int i = 0; i < 3; i++) {
            [self.filmButtonArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 10));
                make.top.equalTo(@(33 + j * 250));
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 15));
                make.height.equalTo(@(180));
            }];
            
            [self.pickButtonArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 10));
                make.top.equalTo(@(33 + j * 250));
                make.width.equalTo(@(30));
                make.height.equalTo(@(30));
            }];
            
            [_filmnameLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(223 + j * 250));
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 15));
                make.height.equalTo(@(30));
            }];
            
            [_filmGradeImageArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(250 + j * 250));
                make.width.equalTo(@(85));
                make.height.equalTo(@(27));
            }];
            
            [_filmGradeLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 105));
                make.top.equalTo(@(245 + j * 250));
                make.width.equalTo(@(20));
                make.height.equalTo(@(27));
            }];
        }
    }
    
}

- (void)dealloc {
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)bigButtonPress:(UIButton *)button {
    [button setTintColor:[UIColor blackColor]];
    for (UIButton *exButton in self.bigButtonArray) {
        if (exButton !=  button) {
            [exButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
    }
    
    [_cellBlackLineImageView removeFromSuperview];
    
    [_FilmscrollView addSubview:_cellBlackLineImageView];
    [_cellBlackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 4 * (button.tag - 200) + [UIScreen mainScreen].bounds.size.width * (button.tag - 200) + 5));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 4 - 6));
        make.height.equalTo(@(2));
    }];
    
    [self.FilmscrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (button.tag - 200), 0)];
}

- (void)pick:(UIButton *)button {
    [button setImage:[[UIImage imageNamed:@"BeanFlapFilmPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pickCancel:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pickCancel:(UIButton *)button {
    [button setImage:[[UIImage imageNamed:@"BeanFlapFilmUnPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)pressFilm {
    [self.cellToTableViewDelegate press];
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
