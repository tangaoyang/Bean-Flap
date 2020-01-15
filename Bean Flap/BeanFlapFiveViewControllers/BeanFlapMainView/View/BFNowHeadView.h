//
//  BFNowHeadView.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/2.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanFlapMainViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFNowHeadView : UIView

@property (nonatomic, strong) NSMutableArray *buttonImageArray;
@property (nonatomic, strong) NSMutableArray *filmButtonArray;
@property (nonatomic, strong) NSMutableArray *filmImageArray;
@property (nonatomic, strong) NSMutableArray *filmNameArray;
@property (nonatomic, strong) NSMutableArray *filmnameLabelArray;
@property (nonatomic, strong) NSMutableArray *pickButtonArray;
@property (nonatomic, strong) NSMutableArray *filmGradeArray;
@property (nonatomic, strong) NSMutableArray *filmGradeLabelArray;
@property (nonatomic, strong) NSMutableArray *filmGradeImageArray;
@property (nonatomic, strong) NSMutableArray *filmIdArray;
@property (nonatomic, strong) BeanFlapMainViewModel *myModel;

@end

NS_ASSUME_NONNULL_END
