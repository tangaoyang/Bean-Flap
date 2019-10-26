//
//  BFSmallFilmViewController.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/17.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmViewController.h"

@interface BFSmallFilmViewController ()

@end

@implementation BFSmallFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.smallView = [[BFSmallFilmView alloc] init];
    [self.view addSubview:_smallView];
    _smallView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [_smallView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)back {
    [self dismissViewControllerAnimated:NO completion:nil];
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
