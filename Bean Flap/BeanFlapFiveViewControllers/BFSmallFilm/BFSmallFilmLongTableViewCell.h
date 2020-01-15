//
//  BFSmallFilmLongTableViewCell.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/23.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmLongTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *sawLabel;
@property (nonatomic, strong) UIImageView *starImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *usefulLabel;
@property (nonatomic, strong) NSString *shareString;
@property (nonatomic, strong) NSString *grade;

@end

NS_ASSUME_NONNULL_END
