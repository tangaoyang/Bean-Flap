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
@property (nonatomic, strong) NSMutableArray *filmIdArray;
@property (nonatomic, strong) BFWillHeadViewModel *willModel;
@property (nonatomic, strong) BFWillSubjectsModel *subjectModelone;
@property (nonatomic, strong) BFWillSubjectsModel *subjectModeltwo;
@property (nonatomic, strong) BFWillSubjectsModel *subjectModelthree;
@property (nonatomic, strong) BFWillSubjectsModel *subjectModelfour;
@property (nonatomic, strong) BFWillSubjectsModel *subjectModelfive;
@property (nonatomic, strong) BFWillSubjectsModel *subjectModelsix;
@property (nonatomic, strong) UIImage *imageOne;
@property (nonatomic, strong) UIImage *imageTwo;
@property (nonatomic, strong) UIImage *imageThree;
@property (nonatomic, strong) UIImage *imageFour;
@property (nonatomic, strong) UIImage *imageFive;
@property (nonatomic, strong) UIImage *imageSix;

@end

NS_ASSUME_NONNULL_END
