//
//  BFSmallFilmView.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFSmallFilmContentTableViewCell.h"
#import "BFSmallFilmLongTableViewCell.h"
#import "BFSmallFilmSelectUpTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>
@property int a;
@property long int buttonTag;

@property (nonatomic, strong) UIView *upView;//上面的view
@property (nonatomic, strong) UIView *changeView;//上拉后的view
@property (nonatomic, strong) UITableView *filmTableView;//总界面的tableView

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *backFilmButton;
@property (nonatomic, strong) NSString *filmImageString;//电影宣传照
@property (nonatomic, strong) NSString *filmName;//电影名字
@property (nonatomic, strong) NSString *timeString;//上映时间
@property (nonatomic, strong) NSString *rank;//排名
@property (nonatomic, strong) NSString *content;//电影介绍
@property (nonatomic, strong) NSArray *genres;//所属频道
@property (nonatomic, strong) BFSmallFilmSeeButton *seeButton;//想看按钮
@property (nonatomic, strong) BFSmallFilmSeeButton *sawButton;//看过按钮
@property (nonatomic, strong) UIImageView *gradeImageView;//分数图
@property (nonatomic, strong) NSMutableArray *channelButtonArray;//所属频道的按钮们
@property (nonatomic, strong) NSString *situation;//剧情
@property (nonatomic, strong) NSString *ratingsCount;

@property (nonatomic, strong) NSString *average;
@property (nonatomic, strong) NSString *grade1;
@property (nonatomic, strong) NSString *grade2;
@property (nonatomic, strong) NSString *grade3;
@property (nonatomic, strong) NSString *grade4;
@property (nonatomic, strong) NSString *grade5;
@property (nonatomic, strong) NSString *collectCount;//看过
@property (nonatomic, strong) NSString *wishCount;//想看
@property (nonatomic, copy) NSArray *filmImages;//剧照
@property (nonatomic, strong) NSMutableArray *commentContentArray;//短评内容
@property (nonatomic, strong) NSMutableArray *commentHeadImageArray;//短评头像
@property (nonatomic, strong) NSMutableArray *commentNameArray;//短评名字
@property (nonatomic, strong) NSMutableArray *commentGradeArray;//短评分数
@property (nonatomic, strong) NSMutableArray *commentDateArray;//短评日期
@property (nonatomic, strong) NSMutableArray *commentPickArray;//短评点赞数

@property (nonatomic) BOOL isOpen;
@property int size;

@property (nonatomic, strong) NSMutableArray *longCommentNameArray;//长评名字
@property (nonatomic, strong) NSMutableArray *longCommentGradeArray;//长评评分
@property (nonatomic, strong) NSMutableArray *longCommentHeadImageArray;//长评头像
@property (nonatomic, strong) NSMutableArray *longCommentTitleArray;//长评标题
@property (nonatomic, strong) NSMutableArray *longCommentContentArray;//长评内容
@property (nonatomic, strong) NSMutableArray *longCommentCommentsArray;//长评回复数
@property (nonatomic, strong) NSMutableArray *longCommentUsefulArray;//长评有用数
@property (nonatomic, strong) NSMutableArray *longCommentShareArray;//长评分享链接

- (void)makeChangeView;

@end

NS_ASSUME_NONNULL_END
