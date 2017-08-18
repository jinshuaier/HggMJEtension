//
//  HggOne.h
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/17.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    SexMale,
    SexFemale
} Sex;

@interface HggOne : NSObject
/** 名称 */
@property (copy, nonatomic) NSString *name;
/** 头像 */
@property (copy, nonatomic) NSString *icon;
/** 年龄 */
@property (assign, nonatomic) unsigned int age;
/** 身高 */
@property (strong, nonatomic) NSNumber *height;
/** 财富 */
@property (strong, nonatomic) NSDecimalNumber *money;
/** 性别 */
@property (assign, nonatomic) Sex sex;
/** 同性恋 */
@property (assign, nonatomic, getter=isGay) BOOL gay;


@end
