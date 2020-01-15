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

@protocol BFCastsModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface BFRatingModel : JSONModel

@property (nonatomic) double average;

@end

@interface BFImagesModel : JSONModel

@property (nonatomic, strong) NSString *medium;

@end

@interface BFCastsModel : JSONModel

@property (nonatomic, strong) NSString *name;

@end

@interface BFSubjectsModel : JSONModel
@property (nonatomic, strong) BFRatingModel *rating;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *genres;
@property (nonatomic, strong) NSArray *pubdates;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *collect_count;
@property (nonatomic, strong) NSArray<BFCastsModel> *casts;
@property (nonatomic, strong) BFImagesModel *images;

@end

@interface BeanFlapMainViewModel : JSONModel

@property (nonatomic, strong) NSString *total;
@property (nonatomic, copy) NSArray<BFSubjectsModel> *subjects;
@property (nonatomic, strong) NSString *id;

@end


NS_ASSUME_NONNULL_END
