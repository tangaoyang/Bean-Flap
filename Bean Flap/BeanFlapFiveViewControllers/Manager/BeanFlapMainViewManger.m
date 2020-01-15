//
//  BeanFlapMainViewManger.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/24.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BeanFlapMainViewManger.h"
#define oneHTTP "douban.uieee.com"
#define twoHTTP douban-api.uieee.com
#define threeHTTP douban-api.now.sh
#define fourHTTP douban-api.zce.now.sh
#define fifthHTTP douban-api-git-master.zce.now.sh

static BeanFlapMainViewManger *manger = nil;

@implementation BeanFlapMainViewManger

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [[BeanFlapMainViewManger alloc] init];
        }
    });
    return manger;
}

- (void)fetchMainViewFilmSucceed:(BFMainViewNowBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString *filmNowURLStr = [NSString stringWithFormat:@"http://douban-api.zce.now.sh/v2/movie/in_theaters"];
    NSURL *filmNowURL = [NSURL URLWithString:filmNowURLStr];
    NSURLRequest *filmNowURLRequest = [NSURLRequest requestWithURL:filmNowURL];
    NSURLSession *filmNowURLSeesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *filmNowDataTask = [filmNowURLSeesion dataTaskWithRequest:filmNowURLRequest completionHandler:^(NSData *_Nullable data, NSURLResponse * _Nullable response, NSError *_Nullable error) {
        if (error == nil) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            BeanFlapMainViewModel *filmNowModel = [[BeanFlapMainViewModel alloc] initWithDictionary:getDictionary error:&error];
            succeedBlock(filmNowModel);
        } else {
            errorBlock(error);
        }
    }];
    [filmNowDataTask resume];
}

- (void)fetchWillViewFilmSucceed:(BFWillShowBlock)succeedBlock error:(ErrorBlock)errorBlock {
    
    NSString *filmWillURLStr = [NSString stringWithFormat:@"https://douban-api.zce.now.sh/v2/movie/coming_soon"];
    NSURL *filmWillURL = [NSURL URLWithString:filmWillURLStr];
    NSURLRequest *filmWillURLRequest = [NSURLRequest requestWithURL:filmWillURL];
    NSURLSession *filmWillURLSeesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *filmWillDataTask = [filmWillURLSeesion dataTaskWithRequest:filmWillURLRequest completionHandler:^(NSData *_Nullable data, NSURLResponse * _Nullable response, NSError *_Nullable error) {
        if (error == nil) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            BFWillHeadViewModel *filmWillModel = [[BFWillHeadViewModel alloc] initWithDictionary:getDictionary error:&error];
            succeedBlock(filmWillModel);
        } else {
            errorBlock(error);
        }
    }];
    [filmWillDataTask resume];
    
}

- (void)fetchSmallFilmWithId:(NSString *) idString Succeed:(BFSmallFilmBlock) succeedBlock error:(ErrorBlock) errorBlock {
    NSString *smallFilmString = [NSString stringWithFormat:@"https://douban-api.zce.now.sh/v2/movie/subject/%@", idString];
    NSURL *smallFilmUrl = [NSURL URLWithString:smallFilmString];
    NSURLRequest *smallFilmUrlRequest = [NSURLRequest requestWithURL:smallFilmUrl];
    NSURLSession *smallFilmUrlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *smallFilmDataTask = [smallFilmUrlSession dataTaskWithRequest:smallFilmUrlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            BFSmallFilmModel *smallFilmModel = [[BFSmallFilmModel alloc] initWithDictionary:getDictionary error:&error];
            succeedBlock(smallFilmModel);
        } else {
            errorBlock(error);
        }
    }];
    [smallFilmDataTask resume];
}

- (void)fetchSmallFilmPhotoWithId:(NSString *) idString Succeed:(BFSmallPhotoBlock) succeedBlock error:(ErrorBlock) errorBlock {
    NSString *photoString = [NSString stringWithFormat:@"https://douban-api.uieee.com/v2/movie/subject/%@/photos", idString];
    NSURL *photoUrl = [NSURL URLWithString:photoString];
    NSURLRequest *photoRequest = [NSURLRequest requestWithURL:photoUrl];
    NSURLSession *photoSesstion = [NSURLSession sharedSession];
    NSURLSessionDataTask *photoDataTask = [photoSesstion dataTaskWithRequest:photoRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *getDictory = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            BFSmallFilmPhotosModel *photoModel = [[BFSmallFilmPhotosModel alloc] initWithDictionary:getDictory error:&error];
            succeedBlock(photoModel);
        } else {
            errorBlock(error);
        }
    }];
    [photoDataTask resume];
}

- (void)fetchSmallFilmLongCommentWithId:(NSString *) idString Succeed:(BFSmallLongCommentBlock) succeedBlock error:(ErrorBlock) errorBlock {
    NSString *longString = [NSString stringWithFormat:@"https://douban.uieee.com/v2/movie/subject/%@/reviews", idString];
    NSURL *longUrl = [NSURL URLWithString:longString];
    NSURLRequest *longRequest = [NSURLRequest requestWithURL:longUrl];
    NSURLSession *longSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *longDataTask = [longSession dataTaskWithRequest:longRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            BFSmallFilmLongModel *longCommentModel = [[BFSmallFilmLongModel alloc] initWithDictionary:getDictionary error:&error];
            succeedBlock(longCommentModel);
        } else {
            errorBlock(error);
        }
    }];
    [longDataTask resume];
}

@end
