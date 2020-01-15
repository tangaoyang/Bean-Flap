//
//  BFMainHeadView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/26.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFMainHeadView.h"
#import "Masonry.h"

@implementation BFMainHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.FilmscrollView = [[UIScrollView alloc] init];
        [self addSubview:self.FilmscrollView];
        self.FilmscrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 570);
        
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
        [self addSubview:_cellBlackLineImageView];
        _cellBlackLineImageView.frame = CGRectMake(5, 78, [UIScreen mainScreen].bounds.size.width / 4 - 6, 2);
        
        self.nowTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 570) style:UITableViewStylePlain];
        self.nowHeadView = [[BFNowHeadView alloc] init];
        _nowTableView.delegate = self;
        _nowTableView.dataSource = self;
        _nowTableView.tag = 0;
        [_nowTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"nowCell"];
       _nowTableView.tableHeaderView = _nowHeadView;
        _nowTableView.tableHeaderView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 540);
        [_FilmscrollView addSubview:_nowTableView];
        
        UIView *view = [[UIView alloc] init];
        _nowTableView.tableFooterView = view;
        
        self.willTableView = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 570) style:UITableViewStylePlain];
        self.willHeadView = [[BFWillHeadView alloc] init];
        _willTableView.delegate = self;
        _willTableView.dataSource = self;
        _willTableView.tag = 1;
        [_willTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"willCell"];
        _willTableView.tableHeaderView = _willHeadView;
        _willTableView.tableHeaderView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 560);
        [_FilmscrollView addSubview:_willTableView];
        _willTableView.tableFooterView = view;
        
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
        
    }
    return self;
}

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
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 155));
        make.top.equalTo(@(38));
        make.width.equalTo(@(53));
        make.height.equalTo(@(18));
    }];
    
    [self.showAllFilmCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 95));
        make.top.equalTo(@(35));
        make.width.equalTo(@(65));
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
        make.height.equalTo(@(570));
    }];
    /*
    [_nowTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(5));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(565));
    }];

    [_nowHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(520));
    }];

    [_willTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.top.equalTo(@(5));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(710));
    }];
    
    [_willHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(540));
    }];*/
}

- (void)bigButtonPress:(UIButton *)button {
    
    [button setTintColor:[UIColor blackColor]];
    for (UIButton *exButton in self.bigButtonArray) {
        if (exButton !=  button) {
            [exButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
    }
    
    [_FilmscrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (button.tag - 200), 0)];
    
    _nowAllFilm = _nowHeadView.myModel.total;
    _willAllFilm = _willHeadView.willModel.total;
    
    if (_FilmscrollView.contentOffset.x == 0) {
        _showAllFilmCount.text = [NSString stringWithFormat:@"全部 %@", _nowAllFilm];
        _cellBlackLineImageView.frame = CGRectMake(5, 78, [UIScreen mainScreen].bounds.size.width / 4 - 6, 2);
    } else {
        _showAllFilmCount.text = [NSString stringWithFormat:@"全部 %@", _willAllFilm];
        _cellBlackLineImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 4, 78, [UIScreen mainScreen].bounds.size.width / 4 - 6, 2);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 0) {
        UITableViewCell *nowCell = [tableView dequeueReusableCellWithIdentifier:@"nowCell" forIndexPath:indexPath];
        nowCell.imageView.image = [UIImage imageNamed:@"BeanFlapImage.jpg"];
        return nowCell;
    } else {
        UITableViewCell *willCell = [tableView dequeueReusableCellWithIdentifier:@"willCell" forIndexPath:indexPath];
        willCell.imageView.image = [UIImage imageNamed:@"BeanFlapImage.jpg"];
        return willCell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
