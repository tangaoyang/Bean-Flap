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
    
    self.listView = [[BeanFlapFilmListView alloc] init];
    [self.view addSubview:self.listView];
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height);
    }];
    [self.listView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    for (UIButton *exButton in self.listView.buttonArray) {
        [exButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.listView.listScrollView.delegate = self;
    self.listView.buyViewToViewtrollerDelegate = self;
    self.listModel = [[BeanFlapFilmListModel alloc] init];
    
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
