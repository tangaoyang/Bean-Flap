//
//  BeanFlapFilmListView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BeanFlapFilmListView.h"
#import "Masonry.h"
#import "BFFilmListTableViewCell.h"

@implementation BeanFlapFilmListView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.filmNameArray = [[NSMutableArray alloc] init];
//        self.filmGradeImageArray = [[NSMutableArray alloc] init];
        self.filmContentArray = [[NSMutableArray alloc] init];
        self.filmSawArray = [[NSMutableArray alloc] init];
        self.filmGradeArray = [[NSMutableArray alloc] init];
        self.filmImageArray = [[NSMutableArray alloc] init];
        self.filmIdArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 20; i++) {
//            [_filmNameArray addObject:@"123"];
            [_filmGradeArray addObject:@"5"];
            [_filmContentArray addObject:@"95123"];
            [_filmSawArray addObject:@"1234"];
            [_filmImageArray addObject:[UIImage imageNamed:@"Bean-Flap-Logo.png"]];
        }
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:self.backButton];
        [self.backButton setImage:[[UIImage imageNamed:@"BeanFlapFilmBack.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        
        self.lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Line.png"]];
        [self addSubview:self.lineImageView];
        
        self.frameImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapFilmFrame.png"]];
        [self addSubview:self.frameImageView];
        
        self.filmTitleLabel = [[UILabel alloc] init];
        [self addSubview:self.filmTitleLabel];
        self.filmTitleLabel.text = @"院线电影";
        self.filmTitleLabel.font = [UIFont systemFontOfSize:20];
        
        self.buttonNameArray = [[NSArray alloc] init];
        self.buttonNameArray = @[@"正在热映", @"即将上映", @"10月观影指南"];
        self.buttonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 3; i++) {
            UIButton *partButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [partButton setTitle:[NSString stringWithFormat:@"%@", self.buttonNameArray[i]] forState:UIControlStateNormal];
            partButton.tag = 300 + i;
            if (i == 0) {
                [partButton setTintColor:[UIColor blackColor]];
            } else {
                [partButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
            }
            partButton.titleLabel.font = [UIFont systemFontOfSize:16];
            [self.buttonArray addObject:partButton];
            [self addSubview:partButton];
        }
        
        self.listScrollView = [[UIScrollView alloc] init];
        [self addSubview:self.listScrollView];
        self.listScrollView.pagingEnabled = YES;
        self.listScrollView.scrollEnabled = YES;
        self.listScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height);
        _listScrollView.showsVerticalScrollIndicator = NO;
        
        self.listTableView = [[UITableView alloc] init];
        self.listTableView.separatorStyle = UITableViewStylePlain;
        [self.listScrollView addSubview:self.listTableView];
        self.listTableView.separatorStyle = UITableViewCellSelectionStyleGray;
        self.listTableView.delegate = self;
        self.listTableView.dataSource = self;
        [self.listTableView registerClass:[BFFilmListTableViewCell class] forCellReuseIdentifier:@"filmCell"];
        
        self.blackLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-BlackLine.png"]];
        [_listScrollView addSubview:_blackLineImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int i = 0;
    
    for (UIButton *exButton in self.buttonArray) {
        [exButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i));
            make.top.equalTo(@(90));
            make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3));
            make.height.equalTo(@(50));
        }];
        i++;
    }
    
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height - 140));
    }];
    
    [self.listScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(140));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(139));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(1));
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(30));
        make.top.equalTo(@(45));
        make.width.equalTo(@(26));
        make.height.equalTo(@(26));
    }];
    
    [self.frameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 90));
        make.top.equalTo(@(50));
        make.width.equalTo(@(80));
        make.height.equalTo(@(30));
    }];
    
    [self.filmTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 2 - 40));
        make.top.equalTo(@(55));
        make.width.equalTo(@(90));
        make.height.equalTo(@(21));
    }];
    
    [_blackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(5));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 10));
        make.height.equalTo(@(2));
    }];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BFFilmListTableViewCell *filmCell = [tableView dequeueReusableCellWithIdentifier:@"filmCell" forIndexPath:indexPath];
    
    if (_filmNameArray.count > 0) {
        filmCell.filmNameLabel.text = _filmNameArray[indexPath.section];
    }
    filmCell.scoreLabel.text = _filmGradeArray[indexPath.section];
    [filmCell.filmButton setImage: _filmImageArray[indexPath.section] forState:UIControlStateNormal];
    filmCell.contentLabel.text = _filmContentArray[indexPath.section];
    filmCell.sawLabel.text = _filmSawArray[indexPath.section];
    if ([_filmGradeArray[indexPath.section] isEqual: @"0.0"]) {
        filmCell.buyButton.layer.borderColor = [UIColor colorWithRed:185/255.0 green:146/255.0 blue:77/255.0 alpha:1.0].CGColor;
        [filmCell.buyButton setTitle:@"预售" forState:UIControlStateNormal];
        filmCell.buyButton.tintColor = [UIColor colorWithRed:185/255.0 green:146/255.0 blue:77/255.0 alpha:1.0];
        filmCell.scoreLabel.text = @"";
    } else {
        filmCell.buyButton.layer.borderColor = [UIColor colorWithRed:0.95 green:0.45 blue:0.48 alpha:1.0].CGColor;
        [filmCell.buyButton setTitle:@"购票" forState:UIControlStateNormal];
        filmCell.buyButton.tintColor = [UIColor colorWithRed:0.95 green:0.45 blue:0.48 alpha:1.0];
    }
    [filmCell.filmButton addTarget:self action:@selector(showFilm) forControlEvents:UIControlEventTouchUpInside];
    
    double grade = [_filmGradeArray[indexPath.section] doubleValue];
    if (grade == 0) {
        UIImageView *nilImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapNilImageView.jpg"]];
        [filmCell.starImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [filmCell.starImageView addSubview:nilImageView];
        nilImageView.frame = filmCell.starImageView.bounds;
    } else {
        UIImageView *starImageView = [[UIImageView alloc] init];
        for (int j = 0; j < 5; j++) {
            UIImageView *starSingleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(16 * j, 0, 15, 15)];
            if (grade - 2 >= 0) {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarLight.png"]];
            } else if ((grade - 2 < 0) && (grade - 2 > -1)) {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarPart.png"]];
            } else {
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
            }
            grade -= 2;
            [starImageView addSubview:starSingleImageView];
        }
        [filmCell.starImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [filmCell.starImageView addSubview:starImageView];
        starImageView.frame = filmCell.starImageView.bounds;
    }
    
    filmCell.selectionStyle = UIAccessibilityTraitNone;
    filmCell.celldelegate = self;
    return filmCell;
}

- (void)showFilm {
    [self.buyViewToViewtrollerDelegate pressFilm];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 187;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_filmNameArray.count > 10) {
        return _filmNameArray.count;
    } else {
        return 10;
    }
}

- (void)addBuy {
    [self.buyViewToViewtrollerDelegate addBuyToViewController];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNotification *noti = [NSNotification notificationWithName:@"film" object:self userInfo:@{@"index":_filmIdArray[indexPath.section]}];
//    NSLog(@" _filmIdArray[indexPath.section] == %@", _filmIdArray[indexPath.section]);
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
