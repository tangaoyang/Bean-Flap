//
//  BFSmallFilmView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import <WebKit/WebKit.h>

@implementation BFSmallFilmView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:133/255.0 green:70/255.0 blue:44/255.0 alpha:1];
        
        self.upView = [[UIView alloc] init];
        [self addSubview:_upView];
        
        _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_upView addSubview:_backButton];
        _backButton.frame = CGRectMake(25, 45, 26, 26);
        [_backButton setImage:[[UIImage imageNamed:@"BeanFlapWhiteBack.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        
        UILabel *filmLabel = [[UILabel alloc] init];
        filmLabel.text = @"电影";
        filmLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 25, 50, 90, 21);
        [filmLabel setTextColor:[UIColor whiteColor]];
        filmLabel.font = [UIFont systemFontOfSize:22];
        [_upView addSubview:filmLabel];
        
        UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_upView addSubview:moreButton];
        moreButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 52, 50, 26, 26);
        [moreButton setImage:[[UIImage imageNamed:@"BeanFlapMore.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        self.changeView = [[UIView alloc] init];
        [self addSubview:_changeView];
        
        _backFilmButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_changeView addSubview:_backFilmButton];
        _backFilmButton.frame = CGRectMake(25, 45, 26, 26);
        [_backFilmButton setImage:[[UIImage imageNamed:@"BeanFlapWhiteBack.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        
        UIButton *moreChangeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_changeView addSubview:moreChangeButton];
        moreChangeButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 52, 50, 26, 26);
        [moreChangeButton setImage:[[UIImage imageNamed:@"BeanFlapMore.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        self.filmTableView = [[UITableView alloc] init];
        [self addSubview:_filmTableView];
        _filmTableView.backgroundColor = [UIColor clearColor];
        _filmTableView.delegate = self;
        _filmTableView.dataSource = self;
        _filmTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_filmTableView registerClass:[BFSmallFilmSelectUpTableViewCell class] forCellReuseIdentifier:@"selectUpCell"];
        [_filmTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"selectCell"];
        [_filmTableView registerClass:[BFSmallFilmContentTableViewCell class] forCellReuseIdentifier:@"contentCell"];
        [_filmTableView registerClass:[BFSmallFilmLongTableViewCell class] forCellReuseIdentifier:@"longCommentCell"];
        _filmTableView.estimatedRowHeight = 0;
//        _filmTableView.estimatedSectionHeaderHeight = 0;
//        _filmTableView.estimatedSectionFooterHeight = 0;
        
        self.commentDateArray = [[NSMutableArray alloc] init];
        self.commentHeadImageArray = [[NSMutableArray alloc] init];
        self.commentNameArray = [[NSMutableArray alloc] init];
        self.commentGradeArray = [[NSMutableArray alloc] init];
        self.commentContentArray = [[NSMutableArray alloc] init];
        self.commentPickArray = [[NSMutableArray alloc] init];
        
        self.longCommentShareArray = [[NSMutableArray alloc] init];
        self.longCommentCommentsArray = [[NSMutableArray alloc] init];
        self.longCommentHeadImageArray = [[NSMutableArray alloc] init];
        self.longCommentContentArray = [[NSMutableArray alloc] init];
        self.longCommentTitleArray = [[NSMutableArray alloc] init];
        self.longCommentNameArray = [[NSMutableArray alloc] init];
        self.longCommentGradeArray = [[NSMutableArray alloc] init];
        self.longCommentUsefulArray = [[NSMutableArray alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonTarget:) name:@"buttonTarget" object:nil];
    }
    return self;
}

- (void)layoutSubviews {
    [_upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(@(90));
        make.top.mas_equalTo(self.mas_top);
    }];
    
    [_changeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(@(90));
        make.top.mas_equalTo(self.mas_top);
    }];
    
    [_filmTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height).offset(-70);
        make.top.mas_equalTo(90);
    }];
    
}

- (void)makeChangeView {
    UIImageView *filmImageView = [[UIImageView alloc] init];
    [filmImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _filmImageString]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [_changeView addSubview:filmImageView];
    filmImageView.frame = CGRectMake(62, 35, 25, 35);
    
    UILabel *filmNameLabel = [[UILabel alloc] init];
    [_changeView addSubview:filmNameLabel];
    filmNameLabel.text = _filmName;
    filmNameLabel.textColor = [UIColor whiteColor];
    filmNameLabel.font = [UIFont systemFontOfSize:16];
    filmNameLabel.frame = CGRectMake(100, 37, 100, 20);
    
    UILabel *filmGardeLabel = [[UILabel alloc] init];
    [_changeView addSubview:filmGardeLabel];
    double averageDouble = [_average doubleValue];
    filmGardeLabel.text = [NSString stringWithFormat:@"%0.1f", averageDouble];
    filmGardeLabel.font = [UIFont systemFontOfSize:10];
    filmGardeLabel.textColor = [UIColor colorWithRed:171/255.0 green:132/255.0 blue:119/255.0 alpha:1];
    filmGardeLabel.frame = CGRectMake(178, 61, 30, 15);
    
    double gradeDouble = [_average doubleValue];
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
    starImageView.frame = CGRectMake(100, 61, 77, 15);
    [_changeView addSubview:starImageView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        BFSmallFilmSelectUpTableViewCell *cell = [_filmTableView dequeueReusableCellWithIdentifier:@"selectUpCell" forIndexPath: indexPath];
        [cell.filmImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _filmImageString]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.filmNameLabel.text = _filmName;
        cell.timeLabel.text = _timeString;
        cell.contentLabel.text = _content;
        [cell.gradeImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [cell makeGradeImageView:_average saw: _collectCount see:_wishCount grade1:_grade1 grade2:_grade2 grade3:_grade3 grade4:_grade4 grade5:_grade5];
        cell.selectionStyle = UIAccessibilityTraitNone;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [_filmTableView dequeueReusableCellWithIdentifier:@"selectCell" forIndexPath:indexPath];
        [cell.imageView setImage:[UIImage imageNamed:@"BeanFlapTicket.png"]];
        cell.imageView.frame = CGRectMake(20, 10, 10, 10);
        cell.textLabel.text = @"选座购票";
        cell.textLabel.frame = CGRectMake(60, 10, 200, 50);
        cell.textLabel.font = [UIFont systemFontOfSize:20];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UIAccessibilityTraitNone;
        return cell;
    } else if (indexPath.section == 2){
        BFSmallFilmContentTableViewCell *cell = [_filmTableView dequeueReusableCellWithIdentifier:@"contentCell" forIndexPath:indexPath];
        cell.situationLabel.text = _situation;
        [cell addTypeButton:_genres];
        cell.commentHeadImageArray = _commentHeadImageArray;
        cell.commentContentArray = _commentContentArray;
        cell.commentGradeArray = _commentGradeArray;
        cell.commentPickArray = _commentPickArray;
        cell.commentNameArray = _commentNameArray;
        cell.commentDateArray = _commentDateArray;
        cell.images = _filmImages;
        if (_filmImages) {
            [cell addImage];
        }
        if (_commentHeadImageArray.count == 4) {
            [cell addComment];
        }
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if (_buttonTag == 0) {
            _buttonTag = 100;
        }
        button.tag = _buttonTag;
        NSLog(@"button.tag ==     %li", button.tag);
        if (_a == 1) {
            _size = cell.imageViewSize.height + 1100;
            NSLog(@"size == %d", _size);
            [cell loadData];
            [cell openComment:button];
        }
       
        button.tag = _buttonTag;
        if (_a == 1) {
            _size = cell.imageViewSize.height + 1100;
            [cell loadData];
            [cell openComment:button];
        }
        NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:2];
        [_filmTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UIAccessibilityTraitNone;
        return cell;
    } else {
        BFSmallFilmLongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"longCommentCell" forIndexPath:indexPath];
        cell.selectionStyle = UIAccessibilityTraitNone;
        if (_longCommentNameArray.count == 20) {
            cell.nameLabel.text = _longCommentNameArray[indexPath.section - 3];
            cell.grade = _longCommentGradeArray[indexPath.section - 3];
            cell.shareString = _longCommentShareArray[indexPath.section - 3];
            cell.titleLabel.text = _longCommentTitleArray[indexPath.section - 3];
            cell.usefulLabel.text = [NSString stringWithFormat:@"%@有用", _longCommentUsefulArray[indexPath.section - 3]];
            cell.contentLabel.text = _longCommentContentArray[indexPath.section - 3];
            cell.commentLabel.text = [NSString stringWithFormat:@"%@回复", _longCommentCommentsArray[indexPath.section - 3]];
            [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _longCommentHeadImageArray[indexPath.section - 3]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:2];
            [_filmTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
            NSIndexSet *indexSetTwo = [[NSIndexSet alloc]initWithIndex:3];
            [_filmTableView reloadSections:indexSetTwo withRowAnimation:UITableViewRowAnimationNone];
        }
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 22;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)buttonTarget:(NSNotification *)notification {
    NSNumber *number = notification.userInfo[@"key"];
    _buttonTag = [number integerValue];
    NSLog(@"_buttonTag == %li", (long)_buttonTag);
    _a = 1;
    [_filmTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 460;
    } else if (indexPath.section == 1) {
        return 70;
    } else if (indexPath.section == 2){
        if (_size) {
            return _size;
        } else {
            return 1200;
        }
    } else {
        return 190;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= 3) {
        WKWebView *webView = [[WKWebView alloc] initWithFrame:self.bounds];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _longCommentShareArray[indexPath.section - 3]]]];
        [webView loadRequest:request];
        [self addSubview:webView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
