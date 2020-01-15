//
//  BFSmallFilmPhotosModel.h
//  Bean Flap
//
//  Created by cinderella on 2019/11/15.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "JSONModel.h"

@protocol BFSmallPhotosModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface BFSmallPhotosModel : JSONModel

@property (nonatomic, strong) NSString *image;

@end

@interface BFSmallFilmPhotosModel : JSONModel

@property (nonatomic, strong) NSArray<BFSmallPhotosModel> *photos;//剧照

@end

NS_ASSUME_NONNULL_END
