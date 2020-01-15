//
//  BFMainHeadView.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/26.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanFlapMainViewModel.h"
#import "BFWillHeadView.h"
#import "BFNowHeadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFMainHeadView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) NSMutableArray *bigButtonArray;
@property (nonatomic, strong) NSArray *bigPartArray;
@property (nonatomic, strong) UILabel *showAllLabel;
@property (nonatomic, strong) UILabel *showAllFilmCount;
@property (nonatomic, strong) UIImageView *downLineImageView;
@property (nonatomic, strong) UIScrollView *FilmscrollView;
@property (nonatomic, strong) UIImageView *cellBlackLineImageView;
@property (nonatomic, strong) UITableView *nowTableView;
@property (nonatomic, strong) UITableView *willTableView;
@property (nonatomic, strong) BFNowHeadView *nowHeadView;
@property (nonatomic, strong) BFWillHeadView *willHeadView;
@property (nonatomic, strong) NSString *nowAllFilm;
@property (nonatomic, strong) NSString *willAllFilm;

@end

NS_ASSUME_NONNULL_END
