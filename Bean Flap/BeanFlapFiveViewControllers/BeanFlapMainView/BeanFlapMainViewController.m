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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.manger = [BeanFlapMainViewManger sharedManger];
    [[BeanFlapMainViewManger sharedManger] fetchMainViewFilmSucceed:^(BeanFlapMainViewModel *resultModel){
        self.myModel = resultModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            BFSubjectsModel *subjectModel = [[BFSubjectsModel alloc] init];
            subjectModel = self -> _myModel.subjects[0];
//            BFImagesModel *imageModel = [[BFImagesModel alloc] init];
//            imageModel = subjectModel.images;
            [self creatView];
            self.myView.title = subjectModel.title;
            [self.myView.tableView reloadData];
//            NSLog(@"View Controller title  == %@", self.myView.title);
//            [self.myView.tableView reloadData];
            if ([self respondsToSelector: @selector(PassFilmTitle:andImage:andGrade:)]) {
                [self.passFilmTitleImageGradeDelegate PassFilmTitle:subjectModel.title andImage:@"123" andGrade:@"5"];
            }
            NSLog(@"Controller sub title == %@", subjectModel.title);
            NSLog(@"Controller sub image == %@", subjectModel.images.meidum);
        });
    } error: ^(NSError *error) {
        NSLog(@"---  error");
    }];
    
}

- (void)creatView {
    self.myView = [[BeanFlapMainView alloc] init];
    self.myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.myView];
    [self.myView.showAllButton addTarget:self action:@selector(pressShowAll) forControlEvents:UIControlEventTouchUpInside];
    
    for (UIButton *exButton in self.myView.buttonArray) {
        [exButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
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


//去掉导航栏
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)cellToViewController {
    BFSmallFilmViewController *film = [[BFSmallFilmViewController alloc] init];
    [self presentViewController:film animated:NO completion:nil];
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
