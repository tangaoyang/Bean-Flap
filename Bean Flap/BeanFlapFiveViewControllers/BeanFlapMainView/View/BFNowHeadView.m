//
//  BFNowHeadView.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/2.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFNowHeadView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@implementation BFNowHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pickButtonArray = [[NSMutableArray alloc] init];
        self.filmGradeLabelArray = [[NSMutableArray alloc] init];
        self.filmButtonArray = [[NSMutableArray alloc] init];
        self.filmnameLabelArray = [[NSMutableArray alloc] init];
        self.filmGradeArray = [[NSMutableArray alloc] init];
        self.filmGradeImageArray = [[NSMutableArray alloc] init];
        self.filmNameArray = [[NSMutableArray alloc] init];
        self.filmImageArray = [[NSMutableArray alloc] init];
        self.buttonImageArray = [[NSMutableArray alloc] init];
        self.filmIdArray = [[NSMutableArray alloc] init];
        
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"123"];
        [self.filmNameArray addObject:@"中国机长"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        [self.filmNameArray addObject:@"我和我的祖国"];
        
        for (int i = 0; i < 6; i++) {
            [_filmGradeArray addObject:[NSString stringWithFormat:@"%d", rand()%10]];
        }
        for (int i = 0; i < 6; i++) {
            int grade = [_filmGradeArray[i] intValue];
            UIImageView *starImageView = [[UIImageView alloc] init];
            for (int j = 0; j < 5; j++) {
                UIImageView *starSingleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16 * j, 0, 15, 15)];
                if (grade - 2 >= 0) {
                    [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarLight.png"]];
                } else if ((grade - 2 < 0) && (grade - 2 > -2)) {
                    [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarPart.png"]];
                } else {
                    [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
                }
                grade -= 2;
                [starImageView addSubview:starSingleImageView];
            }
            [self addSubview:starImageView];
            [_filmGradeImageArray addObject:starImageView];
        }
        
        for (int j = 0; j < 6; j++) {
            UIButton *filmButton = [[UIButton alloc] init];
            [self addSubview:filmButton];
            [self.filmButtonArray addObject:filmButton];
            filmButton.layer.masksToBounds = YES;
            filmButton.layer.cornerRadius = 10;
            
            UILabel *filmLabel = [[UILabel alloc] init];
            filmLabel.text = self.filmNameArray[j];
            filmLabel.numberOfLines = 0;
            [self addSubview:filmLabel];
            [self.filmnameLabelArray addObject:filmLabel];
            
            UILabel *starLabel = [[UILabel alloc] init];
            starLabel.text = self.filmGradeArray[j];
            starLabel.font = [UIFont systemFontOfSize:12];
            [starLabel setTextColor:[UIColor grayColor]];
            [self addSubview:starLabel];
            [self.filmGradeLabelArray addObject:starLabel];
            
            UIButton *pickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [pickButton setImage:[[UIImage imageNamed:@"BeanFlapFilmUnPick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            [pickButton addTarget:self action:@selector(pick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:pickButton];
            [self.pickButtonArray addObject:pickButton];
            
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive) name:@"relate" object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)receive {
//    NSLog(@"receive");
    
    BFSubjectsModel *subjectModelone = [[BFSubjectsModel alloc] init];
    subjectModelone = _myModel.subjects[0];
    [_filmIdArray addObject:subjectModelone.id];
    
    BFSubjectsModel *subjectModeltwo = [[BFSubjectsModel alloc] init];
    subjectModeltwo = _myModel.subjects[1];
    [_filmIdArray addObject:subjectModeltwo.id];
    
    BFSubjectsModel *subjectModelthree = [[BFSubjectsModel alloc] init];
    subjectModelthree = _myModel.subjects[2];
    [_filmIdArray addObject:subjectModelthree.id];
    
    BFSubjectsModel *subjectModelfour = [[BFSubjectsModel alloc] init];
    subjectModelfour = _myModel.subjects[3];
    [_filmIdArray addObject:subjectModelfour.id];
    
    BFSubjectsModel *subjectModelfive = [[BFSubjectsModel alloc] init];
    subjectModelfive = _myModel.subjects[4];
    [_filmIdArray addObject:subjectModelfive.id];
    
    BFSubjectsModel *subjectModelsix = [[BFSubjectsModel alloc] init];
    subjectModelsix = _myModel.subjects[5];
    [_filmIdArray addObject:subjectModelsix.id];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self -> _filmNameArray[0] = subjectModelone.title;
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", subjectModelone.images.medium]];
        self -> _filmGradeArray[0]  = [NSString stringWithFormat:@"%0.1f", subjectModelone.rating.average];
        
        self -> _filmNameArray[1] = subjectModeltwo.title;
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", subjectModeltwo.images.medium]];
        self -> _filmGradeArray[1]  = [NSString stringWithFormat:@"%0.1f", subjectModeltwo.rating.average];
        
        self -> _filmNameArray[2] = subjectModelthree.title;
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", subjectModelthree.images.medium]];
        self -> _filmGradeArray[2]  = [NSString stringWithFormat:@"%0.1f", subjectModelthree.rating.average];
        
        self -> _filmNameArray[3] = subjectModelfour.title;
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", subjectModelfour.images.medium]];
        self -> _filmGradeArray[3]  = [NSString stringWithFormat:@"%0.1f", subjectModelfour.rating.average];
        
        self -> _filmNameArray[4] = subjectModelfive.title;
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", subjectModelfive.images.medium]];
        self -> _filmGradeArray[4]  = [NSString stringWithFormat:@"%0.1f", subjectModelfive.rating.average];
        
        self -> _filmNameArray[5] = subjectModelsix.title;
        [self -> _filmImageArray addObject:[NSString stringWithFormat:@"%@", subjectModelsix.images.medium]];
        self -> _filmGradeArray[5]  = [NSString stringWithFormat:@"%0.1f", subjectModelsix.rating.average];
        
        NSArray *labelArray = [NSArray arrayWithArray:self -> _filmnameLabelArray];
        NSArray *buttonArray = [NSArray arrayWithArray:self -> _filmButtonArray];
        NSArray *gradeArray = [NSArray arrayWithArray:self -> _filmGradeLabelArray];
        
        int i = 0, j = 0, k = 0;
        for (UILabel *exLabel in labelArray) {
            exLabel.text = self -> _filmNameArray[i];
            self -> _filmnameLabelArray[i] = exLabel;
            i++;
        }
        for (UILabel *exLabel in gradeArray) {
            if ([self -> _filmGradeArray[j] isEqualToString:@"0.0"]) {
                exLabel.text = @"";
            } else {
                exLabel.text = self -> _filmGradeArray[j];
            }
            self -> _filmGradeLabelArray[j] = exLabel;
            j++;
        }
        for (UIButton *exButton in buttonArray) {
            exButton.tag = [self -> _filmIdArray[k] integerValue];
            [exButton.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", self -> _filmImageArray[k]]] placeholderImage:[UIImage imageNamed:@"loading.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                [exButton setImage:image forState:UIControlStateNormal];
            }];
            k++;
        }
       
        for (int i = 0; i < 6; i++) {
            double grade = [self -> _filmGradeArray[i] doubleValue];
            if (grade == 0) {
                UIImageView *nilImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeanFlapNilImageView.jpg"]];
                [self -> _filmGradeImageArray[i] removeFromSuperview];
                [self addSubview:nilImageView];
                self -> _filmGradeImageArray[i] = nilImageView;
            } else {
                UIImageView *starImageView = [[UIImageView alloc] init];
                for (int j = 0; j < 5; j++) {
                    UIImageView *starSingleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16 * j, 0, 15, 15)];
                    if (grade - 2 >= 0) {
                        [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarLight.png"]];
                    } else if ((grade - 2 < 0) && (grade - 2 > -1)) {
                        [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarPart.png"]];
                    } else {
                        [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
                    }
                    grade -= 2;
                    [starImageView addSubview:starSingleImageView];
                }
                [self -> _filmGradeImageArray[i] removeFromSuperview];
                [self addSubview:starImageView];
                self -> _filmGradeImageArray[i] = starImageView;
            }
         
        }
        
    });
}

-(void)layoutSubviews {
    for (int j = 0; j < 2; j++) {
        for (int i = 0; i < 3; i++) {
            [self.filmButtonArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 10));
                make.top.equalTo(@(33 + j * 250));
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 15));
                make.height.equalTo(@(180));
            }];
            
            [self.pickButtonArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 10));
                make.top.equalTo(@(33 + j * 250));
                make.width.equalTo(@(30));
                make.height.equalTo(@(30));
            }];
            
            [_filmnameLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(218 + j * 250));
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 - 15));
                make.height.equalTo(@(35));
            }];

            [_filmGradeImageArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 15));
                make.top.equalTo(@(250 + j * 250));
                make.width.equalTo(@(85));
                make.height.equalTo(@(27));
            }];
            
            [_filmGradeLabelArray[i + j * 3] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@([UIScreen mainScreen].bounds.size.width / 3 * i + 102));
                make.top.equalTo(@(245 + j * 250));
                make.width.equalTo(@(30));
                make.height.equalTo(@(27));
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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
