//
//  BFSmallFilmViewController.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmViewController.h"
#import "UIImageView+WebCache.h"
#import <SOZOChromoplast.h>

@interface BFSmallFilmViewController ()

@end

@implementation BFSmallFilmViewController

- (void)viewWillAppear:(BOOL)animated {
    [self filmData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.smallView = [[BFSmallFilmView alloc] init];
    [self.view addSubview:_smallView];
    _smallView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [_smallView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_smallView.backFilmButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [_smallView.filmTableView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)filmData {
    
    [[BeanFlapMainViewManger sharedManger] fetchSmallFilmWithId:_idString Succeed:^(BFSmallFilmModel *resultModel) {
        self -> _smallModel = [[BFSmallFilmModel alloc] init];
        self -> _smallModel = resultModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            //获取背景颜色
            NSString *urlString = [NSString stringWithFormat:@"%@",self -> _smallModel.images.medium];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:urlString]];
            UIImage *image = [UIImage imageWithData:data];
            SOZOChromoplast *chromoplast = [[SOZOChromoplast alloc] initWithImage:image];
            self -> _smallView.backgroundColor = chromoplast.firstHighlight;
            
            self -> _smallView.genres = self -> _smallModel.genres;
            self -> _smallView.filmImageString = self -> _smallModel.images.medium;
            self -> _smallView.filmName = self ->  _smallModel.title;
            self -> _smallView.timeString = [NSString stringWithFormat:@"(%@)", self -> _smallModel.year];
            self -> _smallView.average = self -> _smallModel.rating.average;
            self -> _smallView.grade1 = self -> _smallModel.rating.details.grade1;
            self -> _smallView.grade2 = self -> _smallModel.rating.details.grade2;
            self -> _smallView.grade3 = self -> _smallModel.rating.details.grade3;
            self -> _smallView.grade4 = self -> _smallModel.rating.details.grade4;
            self -> _smallView.grade5 = self -> _smallModel.rating.details.grade5;
            self -> _smallView.ratingsCount = self -> _smallModel.ratings_count;
            self -> _smallView.collectCount = self -> _smallModel.collect_count;
            self -> _smallView.wishCount = self -> _smallModel.wish_count;
            NSString *countries = [self -> _smallModel.countries componentsJoinedByString:@" "];
            NSString *genres = [self -> _smallModel.genres componentsJoinedByString:@" "];
            NSString *pubdates = self -> _smallModel.pubdates[self -> _smallModel.pubdates.count - 1];
            NSString *durations = self -> _smallModel.durations[self -> _smallModel.durations.count - 1];
            self -> _smallView.content = [NSString stringWithFormat:@"%@/%@/%@上映/片长%@ >", countries, genres, pubdates, durations];
            self -> _smallView.situation = self -> _smallModel.summary;
            for (int i = 0; i < 4; i++) {
                BFSmallCommentModel *commmentModel = [[BFSmallCommentModel alloc] init];
                commmentModel = self -> _smallModel.popular_comments[i];
                [self -> _smallView.commentDateArray addObject:[commmentModel.created_at substringWithRange:NSMakeRange(0, 10)]];
                [self -> _smallView.commentNameArray addObject:commmentModel.author.name];
                [self -> _smallView.commentPickArray addObject:commmentModel.useful_count];
                [self -> _smallView.commentGradeArray addObject:commmentModel.rating.value];
                [self -> _smallView.commentContentArray addObject:commmentModel.content];
                [self -> _smallView.commentHeadImageArray addObject:commmentModel.author.avatar];
                
            }
            [self.smallView makeChangeView];
            [self.smallView.filmTableView reloadData];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"filmData Error!");
    }];
    
    [[BeanFlapMainViewManger sharedManger] fetchSmallFilmPhotoWithId:_idString Succeed:^(BFSmallFilmPhotosModel *resultModel) {
        self -> _photoModel = [[BFSmallFilmPhotosModel alloc] init];
        self -> _photoModel = resultModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            self -> _smallView.filmImages = self -> _photoModel.photos;
            [self -> _smallView.filmTableView reloadData];
        });
    }error:^(NSError * _Nonnull error) {
        NSLog(@"photo Error!");
    }];
    
    [[BeanFlapMainViewManger sharedManger] fetchSmallFilmLongCommentWithId:_idString Succeed:^(BFSmallFilmLongModel *resultModel) {
        self -> _longCommentModel = [[BFSmallFilmLongModel alloc] init];
        self -> _longCommentModel = resultModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int i = 0; i < 20; i++) {
                BFSmallReviewsModel *reviewsModel = [[BFSmallReviewsModel alloc] init];
                reviewsModel = self -> _longCommentModel.reviews[i];
                [self -> _smallView.longCommentGradeArray addObject:reviewsModel.rating.value];
                [self -> _smallView.longCommentUsefulArray addObject:reviewsModel.useful_count];
                [self -> _smallView.longCommentNameArray addObject:reviewsModel.author.name];
                [self -> _smallView.longCommentTitleArray addObject:reviewsModel.title];
                [self -> _smallView.longCommentContentArray addObject:reviewsModel.content];
                [self -> _smallView.longCommentHeadImageArray addObject:reviewsModel.author.avatar];
                [self -> _smallView.longCommentCommentsArray addObject:reviewsModel.comments_count];
                [self -> _smallView.longCommentShareArray addObject:reviewsModel.share_url];
            }
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"longComment Error!");
    }];
}

- (void)back {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)dealloc {
    [_smallView.filmTableView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset))];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
     if ([change[NSKeyValueChangeNewKey] CGPointValue].y > 100) {
         _smallView.upView.alpha = 0;
         _smallView.changeView.alpha = 1;
     } else {
         _smallView.upView.alpha = 1;
         _smallView.changeView.alpha = 0;
     }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
