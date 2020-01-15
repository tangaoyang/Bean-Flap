//
//  BFSmallFilmContentTableViewCell.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/8.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmContentTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *channelLabel;//所属频道的标签
@property (nonatomic, strong) NSMutableArray *channelButtonArray;//所属频道的按钮们
@property (nonatomic, strong) UILabel *simpleSituationLabel;//“剧情简介”
@property (nonatomic, strong) UILabel *situationLabel;//剧情
@property (nonatomic, strong) UIButton *openButton;
@property (nonatomic) BOOL isOpen;
@property CGSize size;
@property CGSize imageViewSize;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) UIScrollView *filmScrollView;
@property (nonatomic, strong) UILabel *imageLabel;
@property (nonatomic, strong) NSMutableArray *commentContentArray;//短评内容
@property (nonatomic, strong) NSMutableArray *commentHeadImageArray;//短评头像
@property (nonatomic, strong) NSMutableArray *commentNameArray;//短评名字
@property (nonatomic, strong) NSMutableArray *commentGradeArray;//短评分数
@property (nonatomic, strong) NSMutableArray *commentDateArray;//短评日期
@property (nonatomic, strong) NSMutableArray *commentPickArray;//短评点赞数
@property (nonatomic, strong) UIImageView *commentImageView;//短评的界面
@property (nonatomic, strong) NSMutableArray *commentLabelArray;//短评label
@property (nonatomic, strong) NSMutableArray *openArray;//短评展开记录

- (void)addImage;
- (void)addTypeButton:(NSArray *)genres;
- (void)addComment;
- (void)openComment:(UIButton *) button;
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
