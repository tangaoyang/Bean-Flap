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

typedef void (^BFMainViewNowBlock)(BeanFlapMainViewModel *mainViewNowModel);
typedef void (^BFWillShowBlock)(BFWillHeadViewModel *succeedBlock);

typedef void (^ErrorBlock)(NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface BeanFlapMainViewManger : NSObject

+ (instancetype)sharedManger;

//获取影院热映数据
- (void)fetchMainViewFilmSucceed:(BFMainViewNowBlock) succeedBlock error:(ErrorBlock) errorBlock;
//获取即将上映数据
- (void)fetchWillViewFilmSucceed:(BFWillShowBlock) succeedBlock error:(ErrorBlock) errorBlock;
//获取想看人数
//- (void)fetchWantSeeCountSucceed:(NSString *) count error:(ErrorBlock) errorBlock;

@end

NS_ASSUME_NONNULL_END
