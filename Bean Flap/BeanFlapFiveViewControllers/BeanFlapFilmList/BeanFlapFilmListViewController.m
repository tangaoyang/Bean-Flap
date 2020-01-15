//
//  BeanFlapFilmListViewController.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BeanFlapFilmListViewController.h"
#import "BFFilmListTableViewCell.h"
#import "Masonry.h"

@interface BeanFlapFilmListViewController ()

@end

@implementation BeanFlapFilmListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[BeanFlapMainViewManger sharedManger] fetchMainViewFilmSucceed:^(BeanFlapMainViewModel *resultModel){
        self.listView.listModel = [[BeanFlapMainViewModel alloc] init];
        self -> _listView.listModel = resultModel;
        NSNotification *nowListNoti = [NSNotification notificationWithName:@"nowList" object:self userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:nowListNoti];
    }error:^(NSError *error){
        NSLog(@"nowListModel -- Error");
    }];
    [_listView.listTableView reloadData];
    
    self.listView = [[BeanFlapFilmListView alloc] init];
    [self.view addSubview:self.listView];
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height);
    }];
    [self.listView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    for (UIButton *exButton in self.listView.buttonArray) {
//        [exButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
//    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listData) name:@"nowList" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"film" object:nil];
    [_listView.listTableView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew context:nil];
    self.listView.listScrollView.delegate = self;
    self.listView.buyViewToViewtrollerDelegate = self;
}

- (void)listData{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *genresString;
        NSString *actorString;
        BFCastsModel *actorModel;
        NSMutableArray *actorArray;
        NSURL *imageUrl;
        NSData *imageData;
        UIImage *image;
        for (int i = 0; i < 10; i++) {
            actorArray = [[NSMutableArray alloc] init];
            BFSubjectsModel *subjectModel = self -> _listView.listModel.subjects[i];
            //id
            [self -> _listView.filmIdArray addObject:subjectModel.id];
            //电影名
            [self -> _listView.filmNameArray addObject:subjectModel.title];
            //电影评分
            self -> _listView.filmGradeArray[i] = [NSString stringWithFormat:@"%0.1f", subjectModel.rating.average];
            //电影分类
            genresString = [subjectModel.genres componentsJoinedByString:@" "];
            //电影图片
            imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", subjectModel.images.medium]];
            imageData = [NSData dataWithContentsOfURL:imageUrl];
            image = [UIImage imageWithData:imageData];
            self -> _listView.filmImageArray[i] = image;
            //看过人数
            double count = [subjectModel.collect_count doubleValue];
            if (count > 10000) {
                count /= 10000;
                self -> _listView.filmSawArray[i] = [NSString stringWithFormat:@"%0.1f万人看过", count];
            } else {
                self -> _listView.filmSawArray[i] = [NSString stringWithFormat:@"%0.0f人看过", count];
            }
            
            //电影演员
            for (int i = 0; i < subjectModel.casts.count; i++) {
                actorModel = subjectModel.casts[i];
                actorArray[i] = actorModel.name;
            }
            actorString = [actorArray componentsJoinedByString:@" "];
            //电影上映地点
            [self frameAdd:subjectModel string:genresString count:i actor:actorString];
            
        }
        [self -> _listView.listTableView reloadData];
    });
}

- (void)frameAdd:(BFSubjectsModel *)subjectModel string: (NSString *)  genresString count:(int) i actor:(NSString *)actorString{
    NSURL *wantSeeCountUrl;
    NSURLRequest *wantSeeCountRequest;
    NSURLSession *wantSeeCountSession;
    NSURLSessionDataTask *wantSeeCountData;
    static NSString *filmFrame;
    static NSString *string;
    
    wantSeeCountUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://douban-api.zce.now.sh/v2/movie/subject/%@", subjectModel.id]];
    wantSeeCountRequest = [NSURLRequest requestWithURL:wantSeeCountUrl];
    wantSeeCountSession = [NSURLSession sharedSession];
    wantSeeCountData = [wantSeeCountSession dataTaskWithRequest:wantSeeCountRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            dispatch_async(dispatch_get_main_queue(), ^() {
                filmFrame = [getDictionary[@"countries"] componentsJoinedByString:@" "];
                //电影总简介
                string = [NSString stringWithFormat:@"%@/%@/%@/%@", subjectModel.year, filmFrame, genresString, actorString];
                self -> _listView.filmContentArray[i] = string;
                [self -> _listView.listTableView reloadData];
            });
        } else {
            NSLog(@"wantSeeCount -- Error");
        }
    }];
    [wantSeeCountData resume];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([change[NSKeyValueChangeNewKey] CGPointValue].y > 1114) {
        if (_listView.filmNameArray.count == 10) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *genresString;
                NSString *actorString;
                BFCastsModel *actorModel;
                NSMutableArray *actorArray;
                NSURL *imageUrl;
                NSData *imageData;
                UIImage *image;
                for (int i = 10; i < 20; i++) {
                    actorArray = [[NSMutableArray alloc] init];
                    BFSubjectsModel *subjectModel = self -> _listView.listModel.subjects[i];
                    //电影名
                    [self -> _listView.filmNameArray addObject:subjectModel.title];
                    //电影评分
                    self -> _listView.filmGradeArray[i] = [NSString stringWithFormat:@"%0.1f", subjectModel.rating.average];
                    //电影分类
                    genresString = [subjectModel.genres componentsJoinedByString:@" "];
                    //电影图片
                    imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", subjectModel.images.medium]];
                    imageData = [NSData dataWithContentsOfURL:imageUrl];
                    image = [UIImage imageWithData:imageData];
                    self -> _listView.filmImageArray[i] = image;
                    //看过人数
                    double count = [subjectModel.collect_count doubleValue];
                    if (count > 10000) {
                        count /= 10000;
                        self -> _listView.filmSawArray[i] = [NSString stringWithFormat:@"%0.1f万人看过", count];
                    } else {
                        self -> _listView.filmSawArray[i] = [NSString stringWithFormat:@"%0.0f人看过", count];
                    }
                    
                    //电影演员
                    for (int i = 0; i < subjectModel.casts.count; i++) {
                        actorModel = subjectModel.casts[i];
                        actorArray[i] = actorModel.name;
                    }
                    actorString = [actorArray componentsJoinedByString:@" "];
                    //电影上映地点
                    [self frameAdd:subjectModel string:genresString count:i actor:actorString];
                    
                }
                
                [self -> _listView.listTableView reloadData];
            });
        }
    }
}

- (void)press:(UIButton *)button {
    [button setTintColor:[UIColor blackColor]];
    for (UIButton *exButton in self.listView.buttonArray) {
        if (exButton !=  button) {
            [exButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
    }
    
    [self.listView.blackLineImageView removeFromSuperview];
    [self.listView.listScrollView addSubview:self.listView.blackLineImageView];
    [self.listView.blackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * (button.tag - 300) + [UIScreen mainScreen].bounds.size.width * (button.tag - 300) + 10));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 20));
        make.height.equalTo(@(2));
    }];
    
    [self.listView.listScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (button.tag - 300), 0)];
}

- (void)jumpView:(NSNotification *) dic{
    NSDictionary *getDictionary = dic.userInfo;
    BFSmallFilmViewController *root = [[BFSmallFilmViewController alloc] init];
    root.idString = getDictionary[@"index"];
//    NSLog(@"root.idString == %@", root.idString);
//    NSLog(@"getDictionary[@index] == %@", getDictionary[@"index"]);
    [self presentViewController:root animated:NO completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int i = scrollView.contentOffset.x / ([UIScreen mainScreen].bounds.size.width);
    [self.listView.buttonArray[i] setTintColor:[UIColor blackColor]];
    for (UIButton *exButton in self.listView.buttonArray) {
        if (exButton != self.listView.buttonArray[i]) {
            [exButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
    }
    [self.listView.blackLineImageView removeFromSuperview];
    [self.listView.listScrollView addSubview:self.listView.blackLineImageView];
    [self.listView.blackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + [UIScreen mainScreen].bounds.size.width * i + 10));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 20));
        make.height.equalTo(@(2));
    }];
}

- (void)back {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)addBuyToViewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您已经成功购买！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:NO completion:nil];
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
