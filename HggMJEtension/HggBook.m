//
//  HggBook.m
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/18.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggBook.h"
#import "MJExtension.h"

@implementation HggBook
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"publisher"]) {
        if (oldValue == nil) return @"";
    } else if (property.type.typeClass == [NSDate class]) {
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt dateFromString:oldValue];
    }

    return oldValue;
}
@end
