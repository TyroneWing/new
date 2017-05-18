//
//  NSObject+AnalyticalModel.m
//  json-Model
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "NSObject+AnalyticalModel.h"
#import <MJExtension.h>

@implementation NSObject (AnalyticalModel)
+ (NSMutableArray *)zy_modelArrayWithKeyValuesArray:(id)keyValuesArray {
    
    return [self mj_objectArrayWithKeyValuesArray:keyValuesArray];
}

+ (instancetype)zy_modelWithKeyValues:(id)keyValues {
    
    return [self mj_objectWithKeyValues:keyValues];
}

- (NSDictionary *)zy_keyValues {
    
    return [self mj_keyValues];
}

@end
