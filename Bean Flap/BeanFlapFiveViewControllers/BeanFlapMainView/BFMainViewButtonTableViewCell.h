//
//  BFMainViewButtonTableViewCell.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/13.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BFMainViewButtonTableViewCell;

@protocol CellToTableViewDelegate <NSObject>

- (void)press;

@end

@interface BFMainViewButtonTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *bigButtonArray;
@property (nonatomic, strong) NSArray *bigPartArray;
@property (nonatomic, strong) UILabel *showAllLabel;
@property (nonatomic, strong) UILabel *showAllFilmCount;
@property (nonatomic, strong) NSMutableArray *filmButtonArray;
@property (nonatomic, strong) NSMutableArray *filmNameArray;
@property (nonatomic, strong) NSMutableArray *filmnameLabelArray;
@property (nonatomic, strong) UIImageView *downLineImageView;
@property (nonatomic, strong) UIScrollView *FilmscrollView;
@property (nonatomic, strong) NSMutableArray *pickButtonArray;
@property (nonatomic, strong) NSMutableArray *filmGradeArray;
@property (nonatomic, strong) NSMutableArray *filmGradeLabelArray;
@property (nonatomic, strong) NSMutableArray *filmGradeImageArray;
@property (nonatomic, strong) UIImageView *cellBlackLineImageView;
@property id <CellToTableViewDelegate> cellToTableViewDelegate;

@end

NS_ASSUME_NONNULL_END
