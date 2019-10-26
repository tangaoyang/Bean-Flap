//
//  BeanFlapFilmListView.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFFilmListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BuyViewToViewControllerDelegate <NSObject>

- (void)addBuyToViewController;

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
@property id <BuyViewToViewControllerDelegate> buyViewToViewtrollerDelegate;

@end

NS_ASSUME_NONNULL_END
