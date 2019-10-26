//
//  ViewController.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/9.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "ViewController.h"
#import "BeanFlapMainViewController.h"
#import "BeanFlapEmptyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *beanFlapLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Logo.png"]];
    beanFlapLogoImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3 - 35, [UIScreen mainScreen].bounds.size.height / 5 * 4 + 60, 70, 70);
    
    UILabel *beanFlapLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 + 50, [UIScreen mainScreen].bounds.size.height / 5 * 4 + 55, 100, 80)];
    beanFlapLabel.text = @"豆瓣";
    beanFlapLabel.font = [UIFont systemFontOfSize:45];
    beanFlapLabel.textColor = [UIColor grayColor];
    
    [self.view addSubview:beanFlapLabel];
    [self.view addSubview:beanFlapLogoImageView];
    [self performSelector:@selector(go) withObject:self afterDelay:1];
    
}

- (void)go {
    
    BeanFlapEmptyViewController *first = [[BeanFlapEmptyViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    nav1.title = @"首页";
    //设置title大小
    [nav1.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset1;
    offset1.horizontal = 2;
    offset1.vertical = 13;
    [nav1.tabBarItem setTitlePositionAdjustment:offset1];
    nav1.tabBarItem.image = [[UIImage imageNamed:@"Bean-Flap-Homeun.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"Bean-Flap-Home.png"];
    
    BeanFlapMainViewController *second = [[BeanFlapMainViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    nav2.title = @"书影音";
    //设置title大小
    [nav2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset2;
    offset2.horizontal = 2;
    offset2.vertical = 13;
    [nav2.tabBarItem setTitlePositionAdjustment:offset2];
    nav2.tabBarItem.image = [[UIImage imageNamed:@"Bean-Flap-Bookun.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"Bean-Flap-Book.png"];
    
    BeanFlapEmptyViewController *third = [[BeanFlapEmptyViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:third];
    nav3.title = @"小组";
    //设置title大小
    [nav3.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset3;
    offset3.horizontal = 2;
    offset3.vertical = 13;
    [nav3.tabBarItem setTitlePositionAdjustment:offset3];
    nav3.tabBarItem.image = [[UIImage imageNamed:@"Bean-Flap-Groupun.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.selectedImage = [UIImage imageNamed:@"Bean-Flap-Group.png"];
    
    BeanFlapEmptyViewController *fourth = [[BeanFlapEmptyViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:fourth];
    nav4.title = @"市集";
    //设置title大小
    [nav4.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset4;
    offset4.horizontal = 2;
    offset4.vertical = 13;
    [nav4.tabBarItem setTitlePositionAdjustment:offset4];
    nav4.tabBarItem.image = [[UIImage imageNamed:@"Bean-Flap-Shopun.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.selectedImage = [UIImage imageNamed:@"Bean-Flap-Shop.png"];
    
    BeanFlapEmptyViewController *fifth = [[BeanFlapEmptyViewController alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:fifth];
    nav5.title = @"我的";
    //设置title大小
    [nav5.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset5;
    offset5.horizontal = 2;
    offset5.vertical = 13;
    [nav5.tabBarItem setTitlePositionAdjustment:offset5];
    nav5.tabBarItem.image = [[UIImage imageNamed:@"Bean-Flap-Iun.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav5.tabBarItem.selectedImage = [UIImage imageNamed:@"Bean-Flap-I.png"];
    
    NSArray *navArr = @[nav1, nav2, nav3, nav4, nav5];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = navArr;
    tabBarController.view.tintColor = [UIColor colorWithRed:0.18 green:0.69 blue:0.33 alpha:1.0];
    tabBarController.view.backgroundColor = [UIColor whiteColor];
    tabBarController.tabBar.translucent = NO;
    
    self.view.window.rootViewController = tabBarController;
}

@end
