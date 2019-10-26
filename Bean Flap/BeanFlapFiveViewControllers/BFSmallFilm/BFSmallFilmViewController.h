//
//  BFSmallFilmViewController.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFSmallFilmView.h"
#import "BFSmallFilmViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmViewController : UIViewController

@property BFSmallFilmView *smallView;
@property BFSmallFilmViewModel *smallModel;

@end

NS_ASSUME_NONNULL_END
