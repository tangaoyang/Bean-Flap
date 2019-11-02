//
//  BeanFlapMainViewController.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/9.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BeanFlapMainViewController.h"
#import "BeanFlapFilmListViewController.h"
#import "Masonry.h"
#import "BFSmallFilmViewController.h"

@interface BeanFlapMainViewController ()

@end

@implementation BeanFlapMainViewController


- (void)viewWillAppear:(BOOL)animated {
    
    //去掉导航栏
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self upData];
    [self creatView];
    
}

- (void)upData {
    [[BeanFlapMainViewManger sharedManger] fetchMainViewFilmSucceed:^(BeanFlapMainViewModel *resultModel){
        self.myView.headView.nowHeadView.myModel = [[BeanFlapMainViewModel alloc] init];
        self.myView.headView.nowHeadView.myModel = resultModel;
        //创建通知
        NSNotification *nowNSNoti = [NSNotification notificationWithName:@"relate" object:self userInfo:nil];
        //通过通知中心发送通知更新
        [[NSNotificationCenter defaultCenter] postNotification:nowNSNoti];
    } error: ^(NSError *error) {
        NSLog(@"nowShowError");
    }];
    [[BeanFlapMainViewManger sharedManger] fetchWillViewFilmSucceed:^(BFWillHeadViewModel *resultModel) {
        self -> _myView.headView.willHeadView.willModel = [[BFWillHeadViewModel alloc] init];
        self -> _myView.headView.willHeadView.willModel = resultModel;
        NSNotification *willNSNoti = [NSNotification notificationWithName:@"willShowNoti" object:self userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:willNSNoti];
    } error:^(NSError *error) {
        NSLog(@"willShowError");
    }];
    [_myView.tableView reloadData];
}

- (void)creatView {
    self.myView = [[BeanFlapMainView alloc] init];
    self.myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.myView];
    [self.myView.showAllButton addTarget:self action:@selector(pressShowAll) forControlEvents:UIControlEventTouchUpInside];
    
    for (UIButton *exButton in self.myView.buttonArray) {
        [exButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (UIButton *filmButton in _myView.headView.nowHeadView.filmButtonArray) {
        [filmButton addTarget:self action:@selector(pressFilm) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (UIButton *exButton in _myView.headView.willHeadView.filmButtonArray) {
        [exButton addTarget:self action:@selector(pressFilm) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.myView.viewToViewControllerDelegate = self;
    self.myView.showScrollView.delegate = self;
}

- (void)press:(UIButton *)button {
    [button setTintColor:[UIColor blackColor]];
    for (UIButton *exButton in self.myView.buttonArray) {
        if (exButton !=  button) {
            [exButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
    }
    
    [self.myView.blackLineImageView removeFromSuperview];
    [self.myView.showScrollView addSubview:self.myView.blackLineImageView];
    [self.myView.blackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 6 * (button.tag - 100) + [UIScreen mainScreen].bounds.size.width * (button.tag - 100) + 5));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 6 - 10));
        make.height.equalTo(@(2));
    }];
    
    [self.myView.showScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (button.tag - 100), 0)];
}

- (void)pressFilm {
    BFSmallFilmViewController *film = [[BFSmallFilmViewController alloc] init];
    [self presentViewController:film animated:NO completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int i = (scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
    [self.myView.buttonArray[i] setTintColor:[UIColor blackColor]];
    for (UIButton *exButton in self.myView.buttonArray) {
        if (exButton != self.myView.buttonArray[i]) {
            [exButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
        }
    }
    
    [self.myView.blackLineImageView removeFromSuperview];
    [self.myView.showScrollView addSubview:self.myView.blackLineImageView];
    [self.myView.blackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 6 * i + [UIScreen mainScreen].bounds.size.width * i + 5));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 6 - 10));
        make.height.equalTo(@(2));
    }];
}

- (void)pressShowAll {
    BeanFlapFilmListViewController *root = [[BeanFlapFilmListViewController alloc] init];
    [self presentViewController:root animated:NO completion:nil];
}

//- (void)cellToViewController {
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
