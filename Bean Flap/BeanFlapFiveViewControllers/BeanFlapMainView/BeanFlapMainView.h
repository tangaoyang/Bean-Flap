//
//  BeanFlapMainView.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFMainViewButtonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ViewToViewControllerDelegate <NSObject>

- (void)cellToViewController;

@end

@interface BeanFlapMainView : UIView
<
UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate,
CellToTableViewDelegate
>

@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) NSArray *partArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *showAllButton;
@property (nonatomic, strong) UIScrollView *showScrollView;
@property (nonatomic, strong) UIImageView *blackLineImageView;
@property (nonatomic, strong) NSString *title;
@property id <ViewToViewControllerDelegate> viewToViewControllerDelegate;

@end

NS_ASSUME_NONNULL_END
