//
//  BeanFlapMainView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/12.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BeanFlapMainView.h"
#import "BFMainViewButtonTableViewCell.h"
#import "Masonry.h"

@implementation BeanFlapMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImageView *searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Search.png"]];
        UIView *searchView = [[UIView alloc] init];
        searchView.frame = CGRectMake(50, 8, 40, 40);
        [searchView addSubview:searchImageView];
        
        UIImageView *scanImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Scan.png"]];
        UIView *scanView = [[UIView alloc] init];
        scanView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 180, 8, 40, 40);
        [scanView addSubview:scanImageView];
        
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, [UIScreen mainScreen].bounds.size.width - 100, 50)];
        [self addSubview:_searchTextField];
        _searchTextField.delegate = self;
        _searchTextField.layer.masksToBounds = YES;
        _searchTextField.layer.borderWidth = 0;
        _searchTextField.layer.cornerRadius = 20;
        _searchTextField.layer.backgroundColor = [UIColor colorWithRed:0.97 green:0.96 blue:0.97 alpha:1.0].CGColor;
        _searchTextField.placeholder = @"电影票房小组";
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.rightViewMode = UITextFieldViewModeAlways;
        _searchTextField.leftView = searchView;
        _searchTextField.rightView = scanView;
        
        UIImageView *messageImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Message.png"]];
        messageImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 45, 40, 50);
        [self addSubview:messageImageView];
        
        _partArray = [[NSArray alloc] init];
        _buttonArray = [[NSMutableArray alloc] init];
        _partArray = @[@"电影", @"电视", @"读书", @"原创小说", @"音乐", @"同城"];
        
        for (int i = 0; i < _partArray.count; i++) {
            UIButton *partButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [partButton setTitle:[NSString stringWithFormat:@"%@", _partArray[i]] forState:UIControlStateNormal];
            partButton.tag = 100 + i;
            if (i == 0) {
                [partButton setTintColor:[UIColor blackColor]];
            } else {
                [partButton setTintColor:[UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0]];
            }
            [partButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
            partButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 6 * i, 115, [UIScreen mainScreen].bounds.size.width / 6, 50);
            [self addSubview:partButton];
            [_buttonArray addObject:partButton];
        }
        
        self.showScrollView = [[UIScrollView alloc] init];
        [self addSubview:self.showScrollView];
        self.showScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 6, [UIScreen mainScreen].bounds.size.height);
        self.showScrollView.pagingEnabled = YES;
        self.showScrollView.scrollEnabled = YES;
        
        self.tableView = [[UITableView alloc] init];
        [self.showScrollView addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[BFMainViewButtonTableViewCell class] forCellReuseIdentifier:@"buttonCell"];

        self.viewToViewControllerDelegate = self;
        
        UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-Line.png"]];
        lineImageView.frame = CGRectMake(0, 167, [UIScreen mainScreen].bounds.size.width, 1);
        [self addSubview:lineImageView];
        
        self.showAllButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.showAllButton setImage:[[UIImage imageNamed:@"Bean-Flap-Arrow-Right.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        self.blackLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bean-Flap-BlackLine.png"]];
        [_showScrollView addSubview:_blackLineImageView];
    
    }
    return self;
}

- (void)layoutSubviews {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    
    [self.showScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(165));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    
    [_blackLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(5));
        make.top.equalTo(@(0));
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 6 - 10));
        make.height.equalTo(@(2));
    }];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BFMainViewButtonTableViewCell *buttonCell = [self.tableView dequeueReusableCellWithIdentifier:@"buttonCell" ];
    buttonCell.selectionStyle = UIAccessibilityTraitNone;
    [buttonCell addSubview:self.showAllButton];
    buttonCell.cellToTableViewDelegate = self;
    buttonCell.filmNameArray = [[NSMutableArray alloc] init];
    if (_title) {
        [buttonCell.filmNameArray addObject:_title];
        [buttonCell.filmNameArray addObject:@"中国机长"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
    } else {
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"中国机长"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
        [buttonCell.filmNameArray addObject:@"我和我的祖国"];
    }
    
//    self.passFilmTitleImageGradeDelegate = self;
    NSLog(@"ViewTitle ==  %@", _title);
//    buttonCell.filmNameArray[0] = _title;
    NSLog(@" buttonCell.filmNameArray[0] ==  %@", buttonCell.filmNameArray[0]);
//    buttonCell.filmNameArray = @[_title, _title, _title, _title, _title, _title];
    
    [self.showAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@([UIScreen mainScreen].bounds.size.width - 30));
        make.top.equalTo(@(35));
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    
    
    return buttonCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 700;
}

- (void)press {
    [self.viewToViewControllerDelegate cellToViewController];
}

//- (void)PassFilmTitle:(NSString *)title andImage:(NSString *)imageStr andGrade:(NSString *)grade {
//    self.title = title;
//    NSLog(@"self.title = %@", _title);
//    self.imageStr = imageStr;
//    self.average = grade;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
