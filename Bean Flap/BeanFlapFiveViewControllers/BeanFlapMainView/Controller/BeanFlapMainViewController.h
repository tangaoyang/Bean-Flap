//
//  BeanFlapMainViewController.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/9.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanFlapMainView.h"
#import "BFWillHeadViewModel.h"
#import "BeanFlapMainViewModel.h"
#import "BeanFlapMainViewManger.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PassFilmTitleImageGradeDelegate <NSObject>

- (void)PassFilmTitle:(NSString *) title andImage:(NSString *) imageStr andGrade:(NSString *) grade;
@end

@interface BeanFlapMainViewController : UIViewController
<
UIScrollViewDelegate,
ViewToViewControllerDelegate
>

@property (nonatomic, strong) BeanFlapMainViewModel *myModel;
@property (nonatomic, strong) BeanFlapMainView *myView;
@property (nonatomic, strong) BeanFlapMainViewManger *manger;
@property (nonatomic, strong) id <PassFilmTitleImageGradeDelegate> passFilmTitleImageGradeDelegate;

@end

NS_ASSUME_NONNULL_END
