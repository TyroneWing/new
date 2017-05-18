//
//  NSObject+AnalyticalModel.h
//  json-Model
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AnalyticalModel)

/**
 通过字典来创建一个模型
 
 @param keyValues 字典(可以是NSDictionary、NSData、NSString)
 @return 新建的对象
 */
+ (instancetype)zy_modelWithKeyValues:(id)keyValues;

/**
 通过字典数组来创建一个模型数组
 
 @param keyValuesArray 字典数组(可以是NSDictionary、NSData、NSString)
 @return 模型数组
 */
+ (NSMutableArray *)zy_modelArrayWithKeyValuesArray:(id)keyValuesArray;

/**
 将模型转成字典
 
 @return 字典
 */
- (NSDictionary *)zy_keyValues;

@end
