//
//  BFSmallFilmModel.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/9.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "JSONModel.h"

@protocol BFSmallCommentModel <NSObject>


@end

NS_ASSUME_NONNULL_BEGIN

@protocol BFSmallImageModel

@end

@interface BFSmallImageModel : JSONModel

@property (nonatomic, strong) NSString *medium;

@end

@interface BFSmallRatingDetailsModel : JSONModel

@property (nonatomic, strong) NSString *grade1;
@property (nonatomic, strong) NSString *grade2;
@property (nonatomic, strong) NSString *grade3;
@property (nonatomic, strong) NSString *grade4;
@property (nonatomic, strong) NSString *grade5;

@end

@interface BFSmallRatingModel : JSONModel

@property (nonatomic, strong) NSString *average;
@property (nonatomic, strong) BFSmallRatingDetailsModel *details;

@end

@interface BFSmallCommentRatingModel : JSONModel

@property (nonatomic, strong) NSString *value;

@end

@interface BFSmallCommentAuthorModel : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatar;

@end

@interface BFSmallCommentModel : JSONModel

@property (nonatomic, strong) BFSmallCommentRatingModel *rating;
@property (nonatomic, strong) NSString *useful_count;
@property (nonatomic, strong) BFSmallCommentAuthorModel *author;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *created_at;

@end

@interface BFSmallFilmModel : JSONModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) BFSmallImageModel *images;
@property (nonatomic, strong) NSArray *countries;//上映国家
@property (nonatomic, strong) NSArray *genres;//类型
@property (nonatomic, strong) NSArray *pubdates;//上映时间
@property (nonatomic, strong) NSArray *durations;//片长
@property (nonatomic, strong) NSString *summary;//剧情简介
@property (nonatomic, strong) NSString *collect_count;//看过
@property (nonatomic, strong) NSString *wish_count;//想看
@property (nonatomic, strong) NSString *ratings_count;//评分人数
@property (nonatomic, strong) BFSmallRatingModel *rating;
@property (nonatomic, strong) NSArray<BFSmallCommentModel> *popular_comments;//短评

@end

NS_ASSUME_NONNULL_END
