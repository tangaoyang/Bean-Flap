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
    NSString *filmNowURLStr = [NSString stringWithFormat:@"http://douban.uieee.com/v2/movie/in_theaters"];
    NSURL *filmNowURL = [NSURL URLWithString:filmNowURLStr];
    NSURLRequest *filmNowURLRequest = [NSURLRequest requestWithURL:filmNowURL];
    NSURLSession *filmNowURLSeesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *filmNowDataTask = [filmNowURLSeesion dataTaskWithRequest:filmNowURLRequest completionHandler:^(NSData *_Nullable data, NSURLResponse * _Nullable response, NSError *_Nullable error) {
        if (error == nil) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//            NSLog(@"%@", getDictionary);
            BeanFlapMainViewModel *filmNowModel = [[BeanFlapMainViewModel alloc] initWithDictionary:getDictionary error:&error];
            succeedBlock(filmNowModel);
        } else {
            errorBlock(error);
        }
    }];
    [filmNowDataTask resume];
}

@end
