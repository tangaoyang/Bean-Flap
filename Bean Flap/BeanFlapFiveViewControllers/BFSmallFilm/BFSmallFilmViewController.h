//
//  BFSmallFilmViewController.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFSmallFilmView.h"
#import "BFSmallFilmModel.h"
#import "BeanFlapMainViewManger.h"
#import "BFSmallFilmPhotosModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmViewController : UIViewController

@property (nonatomic, strong) BFSmallFilmView *smallView;
@property (nonatomic, strong) BFSmallFilmModel *smallModel;
@property (nonatomic, strong) BFSmallFilmPhotosModel *photoModel;
@property (nonatomic, strong) BFSmallFilmLongModel *longCommentModel;
@property (nonatomic, strong) NSString *idString;

@end

NS_ASSUME_NONNULL_END
