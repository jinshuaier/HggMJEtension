//
//  HggStudent.m
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/18.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggStudent.h"

@implementation HggStudent
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID" : @"id",
             @"desc" : @"desciption",
             @"oldName" : @"name.oldName",
             @"nowName" : @"name.newName",
             @"nameChangedTime" : @"name.info[1].nameChangedTime",
             @"bag" : @"other.bag"
             };
}
@end
