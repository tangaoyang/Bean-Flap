//
//  BeanFlapMainViewModel.m
//  Bean Flap
//
//  Created by cinderella on 2019/10/24.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "BeanFlapMainViewModel.h"

@implementation BeanFlapMainViewModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFSubjectsModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

//+ (JSONKeyMapper *)keyMapper{
//    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
//                                                       @"original_title": @"original_title",
//                                                       @"rating.average": @"average",
//                                                       @"images.medium": @"image"}];
//}

@end

@implementation BFRatingModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation BFImagesModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}


@end
