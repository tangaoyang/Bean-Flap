//
//  BeanFlapMainViewManger.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/24.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeanFlapMainViewModel.h"

typedef void (^BFMainViewNowBlock)(BeanFlapMainViewModel *mainViewNowModel);

typedef void (^ErrorBlock)(NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface BeanFlapMainViewManger : NSObject

+ (instancetype)sharedManger;

//获取当日最新数据
- (void)fetchMainViewFilmSucceed:(BFMainViewNowBlock) succeedBlock error:(ErrorBlock) errorBlock;

@end

NS_ASSUME_NONNULL_END
