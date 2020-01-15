//
//  BeanFlapFilmListViewController.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanFlapFilmListView.h"
#import "BeanFlapFilmListModel.h"
#import "BeanFlapMainViewModel.h"
#import "BeanFlapMainViewManger.h"
#import "BFSmallFilmViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeanFlapFilmListViewController : UIViewController
<
BuyViewToViewControllerDelegate,
UIScrollViewDelegate
>

@property (nonatomic, strong) BeanFlapFilmListView *listView;
@property (nonatomic, strong) BeanFlapMainViewModel *nowListModel;
@property (nonatomic, strong) BeanFlapMainViewModel *willListModel;

@end

NS_ASSUME_NONNULL_END
