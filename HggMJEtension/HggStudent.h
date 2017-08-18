//
//  HggStudent.h
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/18.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HggBag;

@interface HggStudent : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *otherName;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (copy, nonatomic) NSString *desc;
@property (strong, nonatomic) HggBag *bag;
@property (strong, nonatomic) NSArray *books;
@end
