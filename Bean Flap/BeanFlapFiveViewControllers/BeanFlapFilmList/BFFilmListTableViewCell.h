//
//  BFFilmListTableViewCell.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/16.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CellDelegate <NSObject>

- (void)addBuy;

@end

@interface BFFilmListTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *filmButton;
@property (nonatomic, strong) UILabel *filmNameLabel;
@property (nonatomic, strong) UIImageView *starImageView;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *buyButton;
@property (nonatomic, strong) UILabel *sawLabel;
@property (nonatomic, weak) id <CellDelegate> celldelegate;

@end

NS_ASSUME_NONNULL_END
