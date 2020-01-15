//
//  BFSmallFilmLongModel.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/23.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "JSONModel.h"

@protocol BFSmallReviewsModel <NSObject>

@end

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallFilmLongAuthorModel : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatar;

@end

@interface BFSmallFilmLongRatingModel : JSONModel

@property (nonatomic, strong) NSString *value;

@end

@interface BFSmallReviewsModel : JSONModel

@property (nonatomic, strong) BFSmallFilmLongAuthorModel *author;
@property (nonatomic, strong) BFSmallFilmLongRatingModel *rating;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *useful_count;//有用
@property (nonatomic, strong) NSString *comments_count;//评论
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *share_url;

@end

@interface BFSmallFilmLongModel : JSONModel

@property (nonatomic, strong) NSArray <BFSmallReviewsModel> *reviews;

@end

NS_ASSUME_NONNULL_END
