//
//  HggTwo.h
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/18.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HggOne;
@interface HggTwo : NSObject
/** 微博文本内容 */
@property (copy, nonatomic) NSString *text;
/** 微博作者 */
@property (strong, nonatomic) HggOne *user;
/** 转发的微博 */
@property (strong, nonatomic) HggTwo *retweetedStatus;
@end
