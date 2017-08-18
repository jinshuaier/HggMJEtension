//
//  HggBook.h
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/18.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HggBox;

@interface HggBook : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *publisher;
@property (strong, nonatomic) NSDate *publishedTime;
@property (strong, nonatomic) HggBox *box;
@end
