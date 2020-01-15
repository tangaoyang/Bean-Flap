//
//  BFSmallFilmModel.m
//  Bean Flap
//
//  Created by cinderella on 2019/11/9.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BFSmallFilmModel.h"

@implementation BFSmallRatingDetailsModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"grade1":@"1",
                                                                  @"grade2":@"2",
                                                                  @"grade3":@"3",
                                                                  @"grade4":@"4",
                                                                  @"grade5":@"5",
                                                                  }];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSmallRatingModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSmallImageModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSmallFilmModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSmallCommentModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSmallCommentAuthorModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSmallCommentRatingModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
