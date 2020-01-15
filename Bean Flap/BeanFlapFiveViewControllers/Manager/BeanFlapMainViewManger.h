//
//  BeanFlapMainViewManger.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/24.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeanFlapMainViewModel.h"
#import "BFWillHeadViewModel.h"
#import "BFSmallFilmModel.h"
#import "BFSmallFilmPhotosModel.h"
#import "BFSmallFilmLongModel.h"

typedef void (^BFMainViewNowBlock)(BeanFlapMainViewModel *mainViewNowModel);
typedef void (^BFWillShowBlock)(BFWillHeadViewModel *succeedBlock);
typedef void (^BFSmallFilmBlock)(BFSmallFilmModel *succeedBlock);
typedef void (^BFSmallPhotoBlock)(BFSmallFilmPhotosModel *succeedBlock);
typedef void (^BFSmallLongCommentBlock)(BFSmallFilmLongModel *succeedBlock);

typedef void (^ErrorBlock)(NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface BeanFlapMainViewManger : NSObject

+ (instancetype)sharedManger;

//获取影院热映数据
- (void)fetchMainViewFilmSucceed:(BFMainViewNowBlock) succeedBlock error:(ErrorBlock) errorBlock;
//获取即将上映数据
- (void)fetchWillViewFilmSucceed:(BFWillShowBlock) succeedBlock error:(ErrorBlock) errorBlock;
//获取详细电影界面数据
- (void)fetchSmallFilmWithId:(NSString *) idString Succeed:(BFSmallFilmBlock) succeedBlock error:(ErrorBlock) errorBlock;
//获取电影剧照
- (void)fetchSmallFilmPhotoWithId:(NSString *) idString Succeed:(BFSmallPhotoBlock) succeedBlock error:(ErrorBlock) errorBlock;
//获取电影长评
- (void)fetchSmallFilmLongCommentWithId:(NSString *) idString Succeed:(BFSmallLongCommentBlock) succeedBlock error:(ErrorBlock) errorBlock;

//@property (nonatomic, strong) NSString *string;

@end

NS_ASSUME_NONNULL_END
