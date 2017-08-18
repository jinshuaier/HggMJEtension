//
//  HggDog.m
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/18.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggDog.h"
#import "MJExtension.h"
@implementation HggDog
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    // nickName -> nick_name
    return [propertyName underlineFromCamel];
}
@end
