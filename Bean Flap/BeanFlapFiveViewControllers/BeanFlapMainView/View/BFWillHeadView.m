//
//  BFWillHeadView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/27.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFWillHeadView.h"
#import "Masonry.h"

@implementation BFWillHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"123132");
        self.pickButtonArray = [[NSMutableArray alloc] init];
        self.wantLabelArray = [[NSMutableArray alloc] init];
        self.wantNumberArray = [[NSMutableArray alloc] init];
        self.dayLabelArray = [[NSMutableArray alloc] init];
        self.dayShowArray = [[NSMutableArray alloc] init];
        self.monthShowArray = [[NSMutableArray alloc] init];
        self.filmLabelArray = [[NSMutableArray alloc] init];
        self.filmNameArray = [[NSMutableArray alloc] init];
        self.filmButtonArray = [[NSMutableArray alloc] init];
        self.filmImageArray = [[NSMutableArray alloc] init];
        
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        
        [self.wantNumberArray addObject:@"1"];
        [self.wantNumberArray addObject:@"1"];
        [self.wantNumberArray addObject:@"1"];
        [self.wantNumberArray addObject:@"1"];
        [self.wantNumberArray addObject:@"1"];
        [self.wantNumberArray addObject:@"1"];
        
        [self.dayShowArray addObject:@"123"];
        [self.dayShowArray addObject:@"123"];
        [self.dayShowArray addObject:@"123"];
        [self.dayShowArray addObject:@"123"];
        [self.dayShowArray addObject:@"123"];
        [self.dayShowArray addObject:@"123"];
        
        [self.monthShowArray addObject:@"123"];
        [self.monthShowArray addObject:@"123"];
        [self.monthShowArray addObject:@"123"];
        [self.monthShowArray addObject:@"123"];
        [self.monthShowArray addObject:@"123"];
        [self.monthShowArray addObject:@"123"];
        
        for (int i = 0; i < 6; i++) {
            
            UILabel *wantLabel = [[UILabel alloc] init];
            wantLabel.textColor = [UIColor colorWithRed:0.67 green:0.66 blue:0.67 alpha:1.0];
            wantLabel.font = [UIFont systemFontOfSize:12];
            [self addSubview:wantLabel];
            [self.wantLabelArray addObject:wantLabel];
            
            UILabel *dayLabel = [[UILabel alloc] init];
            dayLabel.textColor = [UIColor redColor];
            dayLabel.font = [UIFont systemFontOfSize:12];
            dayLabel.layer.masksToBounds = YES;
            dayLabel.layer.borderWidth = 1;
            dayLabel.layer.cornerRadius = 5;
            dayLabel.layer.borderColor = [UIColor redColor].CGColor;
            [self addSubview:dayLabel];
            [self.dayLabelArray addObject:dayLabel];
            
            UILabel *filmLabel = [[UILabel alloc] init];
            filmLabel.font = [UIFont systemFontOfSize:15];
            filmLabel.numberOfLines = 0;
            [self addSubview:filmLabel];
            [self.filmLabelArray addObject:filmLabel];
            
            UIButton *filmButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            filmButton.layer.masksToBounds = YES;
            filmButton.layer.cornerRadius = 10;
            [self addSubview:filmButton];
            [self.filmButtonArray addObject:filmButton];
            
            UIButton *pickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [pickButton setImage:[[UIImage imageNamed:@"BeanFlapFilmUnPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            [pickButton addTarget:self action:@selector(pick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:pickButton];
            [self.pickButtonArray addObject:pickButton];
            
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showData) name:@"willShowNoti" object:nil];
    }
    return self;
}

- (void)showData {
    
    BFWillSubjectsModel *subjectModelone = [[BFWillSubjectsModel alloc] init];
    subjectModelone = _willModel.subjects[0];
    
    BFWillSubjectsModel *subjectModeltwo = [[BFWillSubjectsModel alloc] init];
    subjectModeltwo = _willModel.subjects[1];
    
    BFWillSubjectsModel *subjectModelthree = [[BFWillSubjectsModel alloc] init];
    subjectModelthree = _willModel.subjects[2];
    
    BFWillSubjectsModel *subjectModelfour = [[BFWillSubjectsModel alloc] init];
    subjectModelfour = _willModel.subjects[3];
    
    BFWillSubjectsModel *subjectModelfive = [[BFWillSubjectsModel alloc] init];
    subjectModelfive = _willModel.subjects[4];
    
    BFWillSubjectsModel *subjectModelsix = [[BFWillSubjectsModel alloc] init];
    subjectModelsix = _willModel.subjects[5];
    
    dispatch_async(dispatch_get_main_queue(), ^() {
        for (int i = 0; i < 6; i++) {
            BFWillSubjectsModel *subjectModel;
            if (i == 0) {
                subjectModel = subjectModelone;
            } else if (i == 1) {
                subjectModel = subjectModeltwo;
            } else if (i == 2) {
                subjectModel = subjectModelthree;
            } else if (i == 3) {
                subjectModel = subjectModelfour;
            } else if (i == 4) {
                subjectModel = subjectModelfive;
            } else if (i == 5) {
                subjectModel = subjectModelsix;
            }
            NSURL *wantSeeCount = [NSURL URLWithString:[NSString stringWithFormat:@"https://douban-api.zce.now.sh/v2/movie/subject/%@", subjectModel.id]];
            NSURLRequest *wantSeeCountRequest = [NSURLRequest requestWithURL:wantSeeCount];
            NSURLSession *wantSeeCountSession = [NSURLSession sharedSession];
            NSURLSessionDataTask *wantSeeCountData = [wantSeeCountSession dataTaskWithRequest:wantSeeCountRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                if (!error) {
                    NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    self -> _wantLabelArray[i] = getDictionary[@"wish_count"];
                    NSLog(@" getDictionary[@wish_count] = %@", getDictionary[@"wish_count"]);
//                    dispatch_async(dispatch_get_main_queue(), ^(){
//                        int i = 0;
//                        for (UILabel *exLabel in self -> _wantLabelArray) {
//                            exLabel.text = [NSString stringWithFormat:@"%@人想看", self -> _wantNumberArray[i]];
//                        }
//                    });
                } else {
                    NSLog(@"wantSeeCount -- Error");
                }
            }];
            [wantSeeCountData resume];
        }
        
//        self -> _wantNumberArray[0] = subjectModelone.collect_count;
        self -> _filmNameArray[0] = subjectModelone.title;
        self -> _dayShowArray[0] = [subjectModelone.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[0] = [subjectModelone.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        NSString *imageStrOne = [NSString stringWithFormat:@"%@", subjectModelone.images.medium];
        NSData *imageDataOne = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStrOne]];
        UIImage *imageOne = [UIImage imageWithData:imageDataOne];
        
//        self -> _wantNumberArray[1] = subjectModeltwo.collect_count;
        self -> _filmNameArray[1] = subjectModeltwo.title;
        self -> _dayShowArray[1] = [subjectModeltwo.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[1] = [subjectModeltwo.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        NSString *imageStrTwo = [NSString stringWithFormat:@"%@", subjectModeltwo.images.medium];
        NSData *imageDataTwo = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStrTwo]];
        UIImage *imageTwo = [UIImage imageWithData:imageDataTwo];
        
//        self -> _wantNumberArray[2] = subjectModelthree.collect_count;
        self -> _filmNameArray[2] = subjectModelthree.title;
        self -> _dayShowArray[2] = [subjectModelthree.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[2] = [subjectModelthree.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        NSString *imageStrThree = [NSString stringWithFormat:@"%@", subjectModelthree.images.medium];
        NSData *imageDataThree = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStrThree]];
        UIImage *imageThree = [UIImage imageWithData:imageDataThree];
        
//        self -> _wantNumberArray[3] = subjectModelfour.collect_count;
        self -> _filmNameArray[3] = subjectModelfour.title;
        self -> _dayShowArray[3] = [subjectModelfour.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[3] = [subjectModelfour.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        NSString *imageStrFour = [NSString stringWithFormat:@"%@", subjectModelfour.images.medium];
        NSData *imageDataFour = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStrFour]];
        UIImage *imageFour = [UIImage imageWithData:imageDataFour];
        
//        self -> _wantNumberArray[4] = subjectModelfive.collect_count;
        self -> _filmNameArray[4] = subjectModelfive.title;
        self -> _dayShowArray[4] = [subjectModelfive.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[4] = [subjectModelfive.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        NSString *imageStrFive = [NSString stringWithFormat:@"%@", subjectModelfive.images.medium];
        NSData *imageDataFive = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStrFive]];
        UIImage *imageFive = [UIImage imageWithData:imageDataFive];
        
//        self -> _wantNumberArray[5] = subjectModelsix.collect_count;
        self -> _filmNameArray[5] = subjectModelsix.title;
        self -> _dayShowArray[5] = [subjectModelsix.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[5] = [subjectModelsix.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        NSString *imageStrSix = [NSString stringWithFormat:@"%@", subjectModelsix.images.medium];
        NSLog(@"imageStrSix = %@", imageStrSix);
        NSData *imageDataSix = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStrSix]];
        UIImage *imageSix = [UIImage imageWithData:imageDataSix];
        
        NSLog(@"_wantNumberArray == %@", self -> _wantNumberArray);
//        NSLog(@"_dayShowArray == %@", self -> _dayShowArray);
//        NSLog(@"_filmNameArray == %@", self -> _filmNameArray);
//        NSLog(@"_filmImageArray == %@", self -> _filmImageArray);
        
        int i = 0, j = 0, k = 0, h = 0;
        
        
        for (UILabel *exLabel in self -> _dayLabelArray) {
            exLabel.text = self -> _dayShowArray[j];
            exLabel.text = [NSString stringWithFormat:@"  %@月%@日", self -> _monthShowArray[j], self -> _dayShowArray[j]];
            j++;
        }
        for (UILabel *exLabel in self -> _filmLabelArray) {
            exLabel.text = self -> _filmNameArray[k];
            k++;
        }
        
        for (UIButton *exButton in self -> _filmButtonArray) {
            /*NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self -> _filmImageArray[h]]];
            NSLog(@"imageUrl == %@", imageUrl);
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage *image = [UIImage imageWithData:imageData];
            NSLog(@"%@", image);
            [exButton setImage:image forState:UIControlStateNormal];
            h++;*/
            if (h == 0) {
                [exButton setImage:imageOne forState:UIControlStateNormal];
                NSLog(@"imageOne == %@", imageOne);
            } else if (h == 1) {
                [exButton setImage:imageTwo forState:UIControlStateNormal];
                NSLog(@"imageTwo == %@", imageTwo);
            } else if (h == 2) {
                [exButton setImage:imageThree forState:UIControlStateNormal];
            } else if (h == 3) {
                [exButton setImage:imageFour forState:UIControlStateNormal];
            } else if (h == 4) {
                [exButton setImage:imageFive forState:UIControlStateNormal];
            } else {
                [exButton setImage:imageSix forState:UIControlStateNormal];
            }
            h++;
        }
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (int j = 0; j < 2; j++) {
        for (int i = 0; i < 3; i++) {
            
            [_filmButtonArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 10));
                make.top.equalTo(@(33 + j * 262));
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 15));
                make.height.equalTo(@(180));
            }];
            
            [_pickButtonArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 10));
                make.top.equalTo(@(33 + j * 262));
                make.width.equalTo(@(30));
                make.height.equalTo(@(30));
            }];
            
            [_filmLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(218 + j * 262));
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 15));
                make.height.equalTo(@(33));
            }];
            
            [_wantLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(240 + j * 262));
                make.width.equalTo(@(85));
                make.height.equalTo(@(27));
            }];
            
            [_dayLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(262 + j * 262));
                make.width.equalTo(@(62));
                make.height.equalTo(@(20));
            }];
        }
    }
}

- (void)pick:(UIButton *)button {
    [button setImage:[[UIImage imageNamed:@"BeanFlapFilmPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pickCancel:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pickCancel:(UIButton *)button {
    [button setImage:[[UIImage imageNamed:@"BeanFlapFilmUnPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc {
    NSLog(@"willShowDelloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
