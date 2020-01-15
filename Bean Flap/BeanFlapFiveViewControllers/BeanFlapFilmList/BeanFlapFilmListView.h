//
//  BeanFlapFilmListView.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanFlapMainViewModel.h"
#import "BFFilmListTableViewCell.h"
#import "BFSmallFilmViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BuyViewToViewControllerDelegate <NSObject>

- (void)addBuyToViewController;
- (void)pressFilm;

@end

@interface BeanFlapFilmListView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
CellDelegate
>

@property (nonatomic, strong) UILabel *filmTitleLabel;
@property (nonatomic, strong) UIImageView *frameImageView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) NSArray *buttonNameArray;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) UIScrollView *listScrollView;
@property (nonatomic, strong) UIImageView *blackLineImageView;
@property (nonatomic, strong) NSMutableArray *filmSawArray;
@property (nonatomic, strong) NSMutableArray *filmNameArray;
@property (nonatomic, strong) NSMutableArray *filmImageArray;
@property (nonatomic, strong) NSMutableArray *filmGradeArray;
@property (nonatomic, strong) NSMutableArray *filmGradeImageArray;
@property (nonatomic, strong) NSMutableArray *filmContentArray;
@property (nonatomic, strong) NSMutableArray *URLArray;
@property (nonatomic, strong) NSMutableArray *URLDataArray;
@property (nonatomic, strong) NSMutableArray *filmIdArray;
@property (nonatomic, strong) UIImageView *loadImageView;
@property (nonatomic, strong) BeanFlapMainViewModel *listModel;
@property (nonatomic, strong) NSString *filmCount;
@property id <BuyViewToViewControllerDelegate> buyViewToViewtrollerDelegate;

@end

NS_ASSUME_NONNULL_END
