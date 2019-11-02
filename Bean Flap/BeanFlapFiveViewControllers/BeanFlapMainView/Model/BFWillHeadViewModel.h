//
//  BFWillHeadViewModel.h
//  Bean Flap
//
//  Created by cinderella on 2019/10/30.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "JSONModel.h"

@protocol BFWillSubjectsModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface BFImageModel : JSONModel

@property (nonatomic, strong) NSString *medium;

@end

@interface BFWillSubjectsModel : JSONModel

@property (nonatomic, strong) NSString *collect_count;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *mainland_pubdate;
@property (nonatomic, strong) BFImageModel *images;

@end

@interface BFWillHeadViewModel : JSONModel

@property (nonatomic, strong) NSString *total;
@property (nonatomic, copy) NSArray<BFWillSubjectsModel> *subjects;

@end


NS_ASSUME_NONNULL_END
