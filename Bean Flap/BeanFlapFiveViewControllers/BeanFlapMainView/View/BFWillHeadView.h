//
//  BFWillHeadView.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/27.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFWillHeadViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFWillHeadView : UIView

@property (nonatomic, strong) NSMutableArray *pickButtonArray;
@property (nonatomic, strong) NSMutableArray *filmButtonArray;
@property (nonatomic, strong) NSMutableArray *filmImageArray;
@property (nonatomic, strong) NSMutableArray *filmLabelArray;
@property (nonatomic, strong) NSMutableArray *filmNameArray;
@property (nonatomic, strong) NSMutableArray *wantLabelArray;
@property (nonatomic, strong) NSMutableArray *wantNumberArray;
@property (nonatomic, strong) NSMutableArray *dayLabelArray;
@property (nonatomic, strong) NSMutableArray *dayShowArray;
@property (nonatomic, strong) NSMutableArray *monthShowArray;
@property (nonatomic, strong) BFWillHeadViewModel *willModel;

@end

NS_ASSUME_NONNULL_END
