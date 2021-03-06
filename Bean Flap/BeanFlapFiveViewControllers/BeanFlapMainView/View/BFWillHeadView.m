//
//  BFWillHeadView.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/27.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFWillHeadView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@implementation BFWillHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSLog(@"123132");
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
        self.filmIdArray = [[NSMutableArray alloc] init];
        
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

-(void)showData {
    self.subjectModelone = [[BFWillSubjectsModel alloc] init];
    _subjectModelone = _willModel.subjects[0];
    [_filmIdArray addObject:_subjectModelone.id];
    
    self.subjectModeltwo = [[BFWillSubjectsModel alloc] init];
    _subjectModeltwo = _willModel.subjects[1];
    [_filmIdArray addObject:_subjectModeltwo.id];
    
    self.subjectModelthree = [[BFWillSubjectsModel alloc] init];
    _subjectModelthree = _willModel.subjects[2];
    [_filmIdArray addObject:_subjectModelthree.id];
    
    self.subjectModelfour = [[BFWillSubjectsModel alloc] init];
    _subjectModelfour = _willModel.subjects[3];
    [_filmIdArray addObject:_subjectModelfour.id];
    
    self.subjectModelfive = [[BFWillSubjectsModel alloc] init];
    _subjectModelfive = _willModel.subjects[4];
    [_filmIdArray addObject:_subjectModelfive.id];
    
    self.subjectModelsix = [[BFWillSubjectsModel alloc] init];
    _subjectModelsix = _willModel.subjects[5];
    [_filmIdArray addObject:_subjectModelsix.id];
    
    dispatch_async(dispatch_get_main_queue(), ^() {
        
        self -> _filmNameArray[0] = self -> _subjectModelone.title;
        self -> _dayShowArray[0] = [self -> _subjectModelone.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[0] = [self -> _subjectModelone.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", self -> _subjectModelone.images.medium]];
        
        self -> _filmNameArray[1] = self -> _subjectModeltwo.title;
        self -> _dayShowArray[1] = [self -> _subjectModeltwo.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[1] = [self -> _subjectModeltwo.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        [self -> _filmImageArray addObject: [NSString stringWithFormat:@"%@", self -> _subjectModeltwo.images.medium]];
        
        self -> _filmNameArray[2] = self -> _subjectModelthree.title;
        self -> _dayShowArray[2] = [self -> _subjectModelthree.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[2] = [self -> _subjectModelthree.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", self -> _subjectModelthree.images.medium]];
        
        self -> _filmNameArray[3] = self -> _subjectModelfour.title;
        self -> _dayShowArray[3] = [self -> _subjectModelfour.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[3] = [self -> _subjectModelfour.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", self -> _subjectModelfour.images.medium]];
        
        self -> _filmNameArray[4] = self -> _subjectModelfive.title;
        self -> _dayShowArray[4] = [self -> _subjectModelfive.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[4] = [self -> _subjectModelfive.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", self -> _subjectModelfive.images.medium]];
        
        self -> _filmNameArray[5] = self -> _subjectModelsix.title;
        self -> _dayShowArray[5] = [self -> _subjectModelsix.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
        self -> _monthShowArray[5] = [self -> _subjectModelsix.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", self -> _subjectModelsix.images.medium]];
        int i = 0, j = 0, k = 0, h = 0;
        for (UILabel *exLabel in self -> _dayLabelArray) {
            exLabel.text = self -> _dayShowArray[j];
//            NSLog(@"self -> _monthShowArray[j] == %@", self -> _monthShowArray[j]);
            exLabel.text = [NSString stringWithFormat:@"  %@月%@日", self -> _monthShowArray[j], self -> _dayShowArray[j]];
            j++;
        }
        
        for (UILabel *exLabel in self -> _filmLabelArray) {
            exLabel.text = self -> _filmNameArray[k];
            k++;
        }
        
        for (UIButton *exButton in self -> _filmButtonArray) {
            NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self -> _filmImageArray[h]]];
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            [exButton setImage:[[UIImage imageWithData:imageData] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            exButton.tag = [self -> _filmIdArray[h] integerValue];
            h++;
        }
        
        for (UILabel *exLabel in self -> _wantLabelArray) {
            BFWillSubjectsModel *subjectModel;
            if (i == 0) {
                subjectModel = self -> _subjectModelone;
            } else if (i == 1) {
                subjectModel = self -> _subjectModeltwo;
            } else if (i == 2) {
                subjectModel = self -> _subjectModelthree;
            } else if (i == 3) {
                subjectModel = self -> _subjectModelfour;
            } else if (i == 4) {
                subjectModel = self -> _subjectModelfive;
            } else if (i == 5) {
                subjectModel = self -> _subjectModelsix;
            }
            [self LabelText:subjectModel label:exLabel];
            i++;
        }
        
        
    });
}

- (void)LabelText:(BFWillSubjectsModel *)subjectModel label:(UILabel *)label {
    NSURL *wantSeeCount = [NSURL URLWithString:[NSString stringWithFormat:@"https://douban-api.zce.now.sh/v2/movie/subject/%@", subjectModel.id]];
    NSURLRequest *wantSeeCountRequest = [NSURLRequest requestWithURL:wantSeeCount];
    NSURLSession *wantSeeCountSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *wantSeeCountData = [wantSeeCountSession dataTaskWithRequest:wantSeeCountRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            [self -> _wantLabelArray addObject:getDictionary[@"wish_count"]];
            dispatch_async(dispatch_get_main_queue(), ^() {
                [label setText:[NSString stringWithFormat:@"%@人想看", getDictionary[@"wish_count"]]];
            });
//            NSLog(@" getDictionary[@wish_count] = %@", getDictionary[@"wish_count"]);
        } else {
            NSLog(@"wantSeeCount -- Error");
        }
    }];
    [wantSeeCountData resume];
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
