//
//  BFSmallFilmContentTableViewCell.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/8.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmContentTableViewCell.h"
#import "Masonry.h"
#import "BFSmallFilmTypeButton.h"
#import "UIImageView+WebCache.h"
#import "BFSmallFilmPhotosModel.h"

@implementation BFSmallFilmContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.channelLabel = [[UILabel alloc] init];
        [self addSubview:_channelLabel];
        _channelLabel.textColor = [UIColor colorWithRed:171/255.0 green:132/255.0 blue:119/255.0 alpha:1];
        _channelLabel.text = @"所属频道";
        _channelLabel.font = [UIFont systemFontOfSize:14];
        
        self.channelButtonArray = [[NSMutableArray alloc] init];
        
        self.situationLabel = [[UILabel alloc] init];
        [self addSubview:_situationLabel];
        _situationLabel.numberOfLines = 4;
        _situationLabel.textColor = [UIColor whiteColor];
        _situationLabel.font = [UIFont systemFontOfSize:17];
        
        self.isOpen = NO;
        
        self.openButton = [[UIButton alloc] init];
        [self addSubview:_openButton];
        [_openButton addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
        [_openButton setTitle:@"展开" forState:UIControlStateNormal];
        [_openButton setTitleColor:[UIColor colorWithRed:171/255.0 green:132/255.0 blue:119/255.0 alpha:1] forState:UIControlStateNormal];
        [_openButton setFont:[UIFont systemFontOfSize:14]];
        _openButton.frame = CGRectMake(375, 180, 30, 16);
        
        self.simpleSituationLabel = [[UILabel alloc] init];
        [self addSubview:_simpleSituationLabel];
        _simpleSituationLabel.textColor = [UIColor whiteColor];
        _simpleSituationLabel.text = @"剧情简介";
        _simpleSituationLabel.font = [UIFont systemFontOfSize:20];
        
        self.images = [[NSArray alloc] init];
        _images = @[@"Bean-Flap-Logo.png", @"Bean-Flap-Logo.png", @"Bean-Flap-Logo.png", @"Bean-Flap-Logo.png"];
        
        self.filmScrollView = [[UIScrollView alloc] init];
        [self addSubview:_filmScrollView];
        _filmScrollView.contentSize = CGSizeMake(232 * 4, 160);
        
        self.imageLabel = [[UILabel alloc] init];
        [self addSubview:_imageLabel];
        _imageLabel.textColor = [UIColor whiteColor];
        _imageLabel.text = @"预告片/视频评论/剧照";
        _imageLabel.font = [UIFont systemFontOfSize:20];
        
        self.commentDateArray = [[NSMutableArray alloc] init];
        self.commentHeadImageArray = [[NSMutableArray alloc] init];
        self.commentNameArray = [[NSMutableArray alloc] init];
        self.commentGradeArray = [[NSMutableArray alloc] init];
        self.commentContentArray = [[NSMutableArray alloc] init];
        self.commentPickArray = [[NSMutableArray alloc] init];
        self.commentLabelArray = [[NSMutableArray alloc] init];
        self.openArray = [[NSMutableArray alloc] init];
        
        self.commentImageView = [[UIImageView alloc] init];
        [self addSubview:_commentImageView];
        _commentImageView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _commentImageView.layer.masksToBounds = YES;
        _commentImageView.layer.cornerRadius = 5;
        _commentImageView.userInteractionEnabled = YES;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_channelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.equalTo(@(20));
        make.width.equalTo(@(100));
        make.height.equalTo(@(15));
    }];
    
    _simpleSituationLabel.frame = CGRectMake(10, 60, 100, 25);
    
    _situationLabel.frame = CGRectMake(10, 95, self.bounds.size.width - 20, 85);
    
    _imageLabel.frame = CGRectMake(7, 210, [UIScreen mainScreen].bounds.size.width - 100, 30);
    
    _filmScrollView.frame = CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height);
    
    for (int i = 0; i < 4; i++) {
        UIImageView *addImageView = [[UIImageView alloc] init];
        [addImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _images[i]]]];
        addImageView.frame = CGRectMake(i * 230, 0, 232, 160);
        [_filmScrollView addSubview:addImageView];
    }
}

- (void)addImage {
    [_filmScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < 4; i++) {
        UIImageView *addImageView = [[UIImageView alloc] init];
        BFSmallPhotosModel *imageModel = _images[i];
        [addImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", imageModel.image]] placeholderImage:[UIImage imageNamed:@"loading.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            NSLog(@"load complete!");
        }];
        addImageView.frame = CGRectMake(i * 230, 0, 232, 160);
        [_filmScrollView addSubview:addImageView];
    }
}

- (void)addComment {
    [_commentImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _imageViewSize = CGSizeMake(5, 0);
    for (int i = 0; i < 4; i++) {
//        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
//        _imageViewSize.height += [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height;
        _imageViewSize.height += 28;
    }
    _commentImageView.frame = CGRectMake(10, 440, self.bounds.size.width - 20, 597 + _imageViewSize.height);
    
    
    [self loadData];
}

- (void)loadData {
    UILabel *simpleCommentLabel = [[UILabel alloc] init];
    simpleCommentLabel.text = @"短评";
    simpleCommentLabel.textColor = [UIColor whiteColor];
    simpleCommentLabel.font = [UIFont systemFontOfSize:20];
    simpleCommentLabel.frame = CGRectMake(15, 18, 43, 25);
    [_commentImageView addSubview:simpleCommentLabel];
    
    UIImageView *questionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapQuestion.png"]];
    questionImageView.frame = CGRectMake(58, 17, 23, 23);
    [_commentImageView addSubview:questionImageView];
    
    CGSize contentSize = CGSizeZero;
    
    for (int i = 0; i < 4; i++) {
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = _commentNameArray[i];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.frame = CGRectMake(75, 65 + contentSize.height, 200, 17);
        [_commentImageView addSubview:nameLabel];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [_commentLabelArray addObject:contentLabel];
        [_openArray addObject:@"0"];
        contentLabel.text = _commentContentArray[i];
        contentLabel.textColor = [UIColor whiteColor];
        contentLabel.font = [UIFont systemFontOfSize:13];
        contentLabel.numberOfLines = 0;
        NSDictionary *cattri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGSize cContentSize = [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:cattri context:nil].size;
        if (cContentSize.height > 28) {
            UIButton *openButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            openButton.tag = i + 100;
            if (openButton.selected) {
                [openButton removeFromSuperview];
            }
            [openButton setTitle:@"展开" forState:UIControlStateNormal];
            [openButton setTitleColor:[UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1] forState:UIControlStateNormal];
            openButton.frame = CGRectMake(self.bounds.size.width - 50, 143 + contentSize.height, 30, 15);
            openButton.titleLabel.font = [UIFont systemFontOfSize:12];
            [openButton addTarget:self action:@selector(openComment: ) forControlEvents:UIControlEventTouchUpInside];
            [openButton addTarget:self action:@selector(reload:) forControlEvents:UIControlEventTouchUpInside];
            [_commentImageView addSubview:openButton];
            contentLabel.frame = CGRectMake(15, 115 + contentSize.height, self.bounds.size.width - 30, 28);
        } else {
            contentLabel.frame = CGRectMake(15, 115 + contentSize.height, self.bounds.size.width - 30, cContentSize.height);
        }
        [_commentImageView addSubview:contentLabel];
        
        UIImageView *headImageView = [[UIImageView alloc] init];
        [headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _commentHeadImageArray[i]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        headImageView.frame = CGRectMake(15, 65 + contentSize.height, 40, 40);
        headImageView.layer.masksToBounds = YES;
        headImageView.layer.cornerRadius = 20;
        [_commentImageView addSubview:headImageView];
        
        double gradeDouble = [_commentGradeArray[i] doubleValue] * 2;
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
        starImageView.frame = CGRectMake(75, 88 + contentSize.height, 80, 15);
        [_commentImageView addSubview:starImageView];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.text = _commentDateArray[i];
        timeLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:146/255.0 alpha:1];
        timeLabel.font = [UIFont systemFontOfSize:11];
        timeLabel.frame = CGRectMake(155, 88 + contentSize.height, 100, 15);
        [_commentImageView addSubview:timeLabel];
        
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        if ([[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height < 28) {
            contentSize.height += [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height;
        } else {
            contentSize.height += 28;
        }
        contentSize.height += 140;
        
        UIImageView *pickImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapPick.png"]];
         [_commentImageView addSubview:pickImageView];
        [pickImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(15);
            make.width.equalTo(@(20));
            make.height.equalTo(@(20));
        }];
        
        UILabel *pickLabel = [[UILabel alloc] init];
        [_commentImageView addSubview:pickLabel];
        pickLabel.font = [UIFont systemFontOfSize:12];
        pickLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:146/255.0 alpha:1];
        pickLabel.text = _commentPickArray[i];
        pickLabel.frame = CGRectMake(40, contentSize.height - 3, 102, 15);
        [pickLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(40));
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(15);
            make.width.equalTo(@(102));
            make.height.equalTo(@(20));
        }];
    }
}
- (void)reload:(UIButton *)button {
    NSLog(@"nsno button = %@", button);
    NSNumber *tag = [NSNumber numberWithInteger: button.tag];
    NSDictionary *dict = @{@"key":tag};
    NSNotification *buttonNsnoti = [NSNotification notificationWithName:@"buttonTarget" object:self userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:buttonNsnoti];
}
- (void)openComment:(UIButton *) button {
    
    [_commentImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _openArray[button.tag - 100] = @"1";
    UILabel *simpleCommentLabel = [[UILabel alloc] init];
    simpleCommentLabel.text = @"短评";
    simpleCommentLabel.textColor = [UIColor whiteColor];
    simpleCommentLabel.font = [UIFont systemFontOfSize:20];
    simpleCommentLabel.frame = CGRectMake(15, 18, 43, 25);
    [_commentImageView addSubview:simpleCommentLabel];
    
    UIImageView *questionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapQuestion.png"]];
    questionImageView.frame = CGRectMake(58, 17, 23, 23);
    [_commentImageView addSubview:questionImageView];
    
    CGSize contentSize = CGSizeZero;
    for (int i = 0; i < 4; i++) {
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = _commentNameArray[i];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.frame = CGRectMake(75, 65 + contentSize.height, 200, 17);
        [_commentImageView addSubview:nameLabel];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [_commentLabelArray addObject:contentLabel];
        contentLabel.text = _commentContentArray[i];
        contentLabel.textColor = [UIColor whiteColor];
        contentLabel.font = [UIFont systemFontOfSize:13];
        contentLabel.numberOfLines = 0;
        NSDictionary *cattri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGSize cContentSize = [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:cattri context:nil].size;
        if (cContentSize.height > 28 && [_openArray[i] isEqualToString:@"0"]) {
            UIButton *openButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [openButton setTitle:@"展开" forState:UIControlStateNormal];
            openButton.tag = i + 100;
            if (openButton.selected) {
                [openButton removeFromSuperview];
            }
            [openButton setTitleColor:[UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1] forState:UIControlStateNormal];
            openButton.frame = CGRectMake(self.bounds.size.width - 50, 143 + contentSize.height, 30, 15);
            openButton.titleLabel.font = [UIFont systemFontOfSize:12];
            [openButton addTarget:self action:@selector(openCommentAgain: ) forControlEvents:UIControlEventTouchUpInside];
            [_commentImageView addSubview:openButton];
            contentLabel.frame = CGRectMake(15, 115 + contentSize.height, self.bounds.size.width - 30, 28);
        } else {
            contentLabel.frame = CGRectMake(15, 115 + contentSize.height, self.bounds.size.width - 30, cContentSize.height);
            _imageViewSize.height += cContentSize.height;
            _imageViewSize.height -= 28;
        }
        [_commentImageView addSubview:contentLabel];
        
        UIImageView *headImageView = [[UIImageView alloc] init];
        [headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _commentHeadImageArray[i]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        headImageView.frame = CGRectMake(15, 65 + contentSize.height, 40, 40);
        headImageView.layer.masksToBounds = YES;
        headImageView.layer.cornerRadius = 20;
        [_commentImageView addSubview:headImageView];
        
        double gradeDouble = [_commentGradeArray[i] doubleValue] * 2;
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
        starImageView.frame = CGRectMake(75, 88 + contentSize.height, 80, 15);
        [_commentImageView addSubview:starImageView];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.text = _commentDateArray[i];
        timeLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:146/255.0 alpha:1];
        timeLabel.font = [UIFont systemFontOfSize:11];
        timeLabel.frame = CGRectMake(155, 88 + contentSize.height, 100, 15);
        [_commentImageView addSubview:timeLabel];
        
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        if ([[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height < 28 || [_openArray[i] isEqualToString:@"1"]) {
            contentSize.height += [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height;
        } else {
            contentSize.height += 28;
        }
        contentSize.height += 140;
        
        UIImageView *pickImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapPick.png"]];
        [_commentImageView addSubview:pickImageView];
        [pickImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(15);
            make.width.equalTo(@(20));
            make.height.equalTo(@(20));
        }];
        
        UILabel *pickLabel = [[UILabel alloc] init];
        [_commentImageView addSubview:pickLabel];
        pickLabel.font = [UIFont systemFontOfSize:12];
        pickLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:146/255.0 alpha:1];
        pickLabel.text = _commentPickArray[i];
        [pickLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(40));
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(15);
            make.width.equalTo(@(102));
            make.height.equalTo(@(20));
        }];
        [_commentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(pickLabel.mas_bottom).offset(10);
            make.left.equalTo(@(10));
            make.width.equalTo(@(self.bounds.size.width - 20));
            make.top.equalTo(@(440));
        }];
    }
    NSLog(@"_imageViewSize.height == %f", _imageViewSize.height);
}

- (void)openCommentAgain:(UIButton *)button {
    
    NSNotification *buttonNsnoti = [NSNotification notificationWithName:@"buttonTarget" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:buttonNsnoti];
    
    [_commentImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _openArray[button.tag - 100] = @"1";
    UILabel *simpleCommentLabel = [[UILabel alloc] init];
    simpleCommentLabel.text = @"短评";
    simpleCommentLabel.textColor = [UIColor whiteColor];
    simpleCommentLabel.font = [UIFont systemFontOfSize:20];
    simpleCommentLabel.frame = CGRectMake(15, 18, 43, 25);
    [_commentImageView addSubview:simpleCommentLabel];
    
    UIImageView *questionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapQuestion.png"]];
    questionImageView.frame = CGRectMake(58, 17, 23, 23);
    [_commentImageView addSubview:questionImageView];
    
    CGSize contentSize = CGSizeZero;
    for (int i = 0; i < 4; i++) {
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = _commentNameArray[i];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.frame = CGRectMake(75, 65 + contentSize.height, 200, 17);
        [_commentImageView addSubview:nameLabel];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [_commentLabelArray addObject:contentLabel];
        contentLabel.text = _commentContentArray[i];
        if (i == button.tag - 100) {
            contentLabel.tag = 1;
        }
        contentLabel.textColor = [UIColor whiteColor];
        contentLabel.font = [UIFont systemFontOfSize:13];
        contentLabel.numberOfLines = 0;
        NSDictionary *cattri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGSize cContentSize = [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:cattri context:nil].size;
        if (cContentSize.height > 28 && [_openArray[i] isEqualToString:@"0"]) {
            UIButton *openButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [openButton setTitle:@"展开" forState:UIControlStateNormal];
            openButton.tag = i + 100;
            if (openButton.selected) {
                [openButton removeFromSuperview];
            }
            [openButton setTitleColor:[UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1] forState:UIControlStateNormal];
            openButton.frame = CGRectMake(self.bounds.size.width - 50, 143 + contentSize.height, 30, 15);
            openButton.titleLabel.font = [UIFont systemFontOfSize:12];
            [openButton addTarget:self action:@selector(openComment: ) forControlEvents:UIControlEventTouchUpInside];
            [_commentImageView addSubview:openButton];
            contentLabel.frame = CGRectMake(15, 115 + contentSize.height, self.bounds.size.width - 30, 28);
        } else {
            _imageViewSize.height += cContentSize.height;
            _imageViewSize.height -= 28;
            contentLabel.frame = CGRectMake(15, 115 + contentSize.height, self.bounds.size.width - 30, cContentSize.height);
        }
        [_commentImageView addSubview:contentLabel];
        
        UIImageView *headImageView = [[UIImageView alloc] init];
        [headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", _commentHeadImageArray[i]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        headImageView.frame = CGRectMake(15, 65 + contentSize.height, 40, 40);
        headImageView.layer.masksToBounds = YES;
        headImageView.layer.cornerRadius = 20;
        [_commentImageView addSubview:headImageView];
        
        double gradeDouble = [_commentGradeArray[i] doubleValue] * 2;
//        NSLog(@"gradeDouble == %f", gradeDouble);
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
        starImageView.frame = CGRectMake(75, 88 + contentSize.height, 80, 15);
        [_commentImageView addSubview:starImageView];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.text = _commentDateArray[i];
        timeLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:146/255.0 alpha:1];
        timeLabel.font = [UIFont systemFontOfSize:11];
        timeLabel.frame = CGRectMake(155, 88 + contentSize.height, 100, 15);
        [_commentImageView addSubview:timeLabel];
        
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        if ([[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height < 28 || [_openArray[i] isEqualToString:@"1"]) {
            contentSize.height += [[NSString stringWithFormat:@"%@", _commentContentArray[i]] boundingRectWithSize:CGSizeMake(self.bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height;
        } else {
            contentSize.height += 28;
        }
        contentSize.height += 140;
        
        UIImageView *pickImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapPick.png"]];
        [_commentImageView addSubview:pickImageView];
        //        pickImageView.frame = CGRectMake(15, contentSize.height - 5, 20, 20);
        [pickImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(15);
            make.width.equalTo(@(20));
            make.height.equalTo(@(20));
        }];
        
        UILabel *pickLabel = [[UILabel alloc] init];
        [_commentImageView addSubview:pickLabel];
        pickLabel.font = [UIFont systemFontOfSize:12];
        pickLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:146/255.0 alpha:1];
        pickLabel.text = _commentPickArray[i];
        [pickLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(40));
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(15);
            make.width.equalTo(@(102));
            make.height.equalTo(@(20));
        }];
        
        [_commentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(pickLabel.mas_bottom).offset(10);
            make.left.equalTo(@(10));
            make.width.equalTo(@(self.bounds.size.width - 20));
            make.top.equalTo(@(440));
        }];
    }
    NSLog(@"_imageViewSize.height == %f", _imageViewSize.height);
}

- (void)pressButton {
    //如果没有展开
    if (self.isOpen == NO) {
        self.isOpen = YES;
        _situationLabel.numberOfLines = 0;
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        _size = [_situationLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        _situationLabel.frame = CGRectMake(10, 95, _size.width, _size.height);
        [_openButton setTitle:@"关闭" forState:UIControlStateNormal];
        _openButton.frame = CGRectMake(375, 90 + _size.height, 30, 16);
        _imageLabel.frame = CGRectMake(7, 140 + _size.height, [UIScreen mainScreen].bounds.size.width - 100, 30);
        _commentImageView.frame = CGRectMake(10, 440 + _size.height, self.bounds.size.width - 20, 600 + _imageViewSize.height);
        _filmScrollView.frame = CGRectMake(0, 180 + _size.height, [UIScreen mainScreen].bounds.size.width, 160);
    } else {
        self.isOpen = NO;
        _situationLabel.numberOfLines = 4;
        _openButton.frame = CGRectMake(375, 180, 30, 16);
        _situationLabel.frame = CGRectMake(10, 95, [UIScreen mainScreen].bounds.size.width - 20, 85);
        [_openButton setTitle:@"展开" forState:UIControlStateNormal];
        _imageLabel.frame = CGRectMake(7, 210, [UIScreen mainScreen].bounds.size.width - 100, 30);
        _filmScrollView.frame = CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 160);
        _commentImageView.frame = CGRectMake(10, 440, self.bounds.size.width - 20, 600 + _imageViewSize.height);
    }
}

- (void)addTypeButton:(NSArray *)genres {
    if (genres.count > 5) {
        for (int i = 0; i < 5; i++) {
            BFSmallFilmTypeButton *button = [[BFSmallFilmTypeButton alloc] init];
            button.arrowLabel.text = [NSString stringWithFormat:@"%@", genres[i]];
            [_channelButtonArray addObject:button];
        }
    } else {
        for (int i = 0; i < genres.count; i++) {
            BFSmallFilmTypeButton *button = [[BFSmallFilmTypeButton alloc] init];
            button.arrowLabel.text = [NSString stringWithFormat:@"%@", genres[i]];
            [_channelButtonArray addObject:button];
        }
    }
    int left = 83;
    for (BFSmallFilmTypeButton *exButton in _channelButtonArray) {
        exButton.frame = CGRectMake(left, 10, 20 * exButton.arrowLabel.text.length + 22, 30);
        left += 25 * exButton.arrowLabel.text.length + 22;
        [self addSubview:exButton];
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
