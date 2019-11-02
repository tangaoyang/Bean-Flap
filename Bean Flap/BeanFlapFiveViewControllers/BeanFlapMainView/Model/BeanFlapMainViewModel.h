//
//  BeanFlapMainViewModel.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/24.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "JSONModel.h"

@protocol BFSubjectsModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface BFRatingModel : JSONModel

@property (nonatomic) double average;

@end

@interface BFImagesModel : JSONModel

@property (nonatomic, strong) NSString *medium;

@end

@interface BFSubjectsModel : JSONModel
@property (nonatomic, strong) BFRatingModel *rating;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) BFImagesModel *images;

@end

@interface BeanFlapMainViewModel : JSONModel

@property (nonatomic, strong) NSString *total;
@property (nonatomic, copy) NSArray<BFSubjectsModel> *subjects;

@end


NS_ASSUME_NONNULL_END