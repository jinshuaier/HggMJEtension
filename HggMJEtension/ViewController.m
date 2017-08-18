//
//  ViewController.m
//  HggMJEtension
//
//  Created by 胡高广 on 2017/8/17.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "HggOne.h"
#import "HggTwo.h"
#import "HggThree.h"
#import "Hggfour.h"
#import "HggAD.h"
#import "HggStudent.h"
#import "HggBag.h"
#import "HggDog.h"
#import "HggBox.h"
#import "HggBook.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建视图
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

/** 视图 **/
- (void)createUI
{
    /**
     *  简单的字典 -> 模型
     */
    // 1.定义一个字典
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @"20",
                           @"height" : @1.75,
                           @"money" : @"100.9",
                           @"sex" : @25,
                           @"gay" : @"1"
                           };
    
    // 2.将字典转为模型
    HggOne *oneModel = [HggOne mj_objectWithKeyValues:dict];
    // 3.打印MJUser模型的属性
    NSLog(@"name=%@, icon=%@, age=%zd, height=%@, money=%@, sex=%d, gay=%d", oneModel.name, oneModel.icon, oneModel.age, oneModel.height, oneModel.money, oneModel.sex, oneModel.gay);
    
    
    /**
     *  JSON字符串 -> 模型
     */
 
        // 1.定义一个JSON字符串
        NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20, \"height\":333333.7}";
        
        // 2.将JSON字符串转为MJUser模型
        HggOne *user = [HggOne mj_objectWithKeyValues:jsonString];
        
        // 3.打印MJUser模型的属性
        MJExtensionLog(@"name=%@, icon=%@, age=%d, height=%@", user.name, user.icon, user.age, user.height);
    
    
    /**
     *  复杂的字典 -> 模型 (模型里面包含了模型)
     */
      // 1.定义一个字典
       NSDictionary *dict1 = @{
                               @"text" : @"是啊，今天天气确实不错！",
                               
                               @"user" : @{
                                       @"name" : @"Jack",
                                       @"icon" : @"lufy.png"
                                       },
                               
                               @"retweetedStatus" : @{
                                       @"text" : @"今天天气真不错！",
                                       
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       }
                               };
        
        // 2.将字典转为Status模型
        HggTwo *status = [HggTwo mj_objectWithKeyValues:dict1];
        
        // 3.打印status的属性
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        MJExtensionLog(@"text=%@, name=%@, icon=%@", text, name, icon);
        
        // 4.打印status.retweetedStatus的属性
        NSString *text2 = status.retweetedStatus.text;
        NSString *name2 = status.retweetedStatus.user.name;
        NSString *icon2 = status.retweetedStatus.user.icon;
        MJExtensionLog(@"text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
    
    
    
    /**
     *  复杂的字典 -> 模型 (模型的数组属性里面又装着模型)
     */
        // 1.定义一个字典
        NSDictionary *dict2 = @{
                               @"statuses" : @[
                                       @{
                                           @"text" : @"今天天气真不错！",
                                           
                                           @"user" : @{
                                                   @"name" : @"Rose",
                                                   @"icon" : @"nami.png"
                                                   }
                                           },
                                       
                                       @{
                                           @"text" : @"明天去旅游了",
                                           
                                           @"user" : @{
                                                   @"name" : @"Jack",
                                                   @"icon" : @"lufy.png"
                                                   }
                                           }
                                       
                                       ],
                               
                               @"ads" : @[
                                       @{
                                           @"image" : @"ad01.png",
                                           @"url" : @"http://www.小码哥ad01.com"
                                           },
                                       @{
                                           @"image" : @"ad02.png",
                                           @"url" : @"http://www.小码哥ad02.com"
                                           }
                                       ],
                               
                               @"totalNumber" : @"2014",
                               @"previousCursor" : @"13476589",
                               @"nextCursor" : @"13476599"
                               };
        
        // 2.将字典转为Hggfour模型
        Hggfour *result = [Hggfour mj_objectWithKeyValues:dict2];
        
        // 3.打印Hggfour模型的简单属性
        MJExtensionLog(@"totalNumber=%@, previousCursor=%lld, nextCursor=%lld", result.totalNumber, result.previousCursor, result.nextCursor);
        
        // 4.打印statuses数组中的模型属性
        for (HggTwo *status in result.statuses) {
            NSString *text = status.text;
            NSString *name = status.user.name;
            NSString *icon = status.user.icon;
            MJExtensionLog(@"text=%@, name=%@, icon=%@", text, name, icon);
        }
        
        // 5.打印ads数组中的模型属性
        for (HggAD *ad in result.ads) {
            MJExtensionLog(@"image=%@, url=%@", ad.image, ad.url);
        }
    
    
    
    /**
     * 简单的字典 -> 模型（key替换，比如ID和id。多级映射，比如 oldName 和 name.oldName）
     */

        // 1.定义一个字典
        NSDictionary *dict3 = @{
                               @"id" : @"20",
                               @"desciption" : @"好孩子",
                               @"name" : @{
                                       @"newName" : @"lufy",
                                       @"oldName" : @"kitty",
                                       @"info" : @[
                                               @"test-data",
                                               @{@"nameChangedTime" : @"2013-08-07"}
                                               ]
                                       },
                               @"other" : @{
                                       @"bag" : @{
                                               @"name" : @"小书包",
                                               @"price" : @100.7
                                               }
                                       }
                               };
        
        // 2.将字典转为MJStudent模型
        HggStudent *stu1 = [HggStudent mj_objectWithKeyValues:dict3];
        
        // 3.打印MJStudent模型的属性
        MJExtensionLog(@"ID=%@, desc=%@, otherName=%@, oldName=%@, nowName=%@, nameChangedTime=%@", stu1.ID, stu1.desc, stu1.otherName, stu1.oldName, stu1.nowName, stu1.nameChangedTime);
        MJExtensionLog(@"bagName=%@, bagPrice=%f", stu1.bag.name, stu1.bag.price);
    
    
    
    /**
     *  字典数组 -> 模型数组
     */
        // 1.定义一个字典数组
        NSArray *dictArray = @[
                               @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png",
                                   },
                               
                               @{
                                   @"name" : @"Rose",
                                   @"icon" : @"nami.png",
                                   }
                               ];
        
        // 2.将字典数组转为HggOne模型数组
        NSArray *userArray = [HggOne mj_objectArrayWithKeyValuesArray:dictArray];
        
        // 3.打印userArray数组中的MJUser模型属性
        for (HggOne *user in userArray) {
            MJExtensionLog(@"name=%@, icon=%@", user.name, user.icon);
        }

    
    
    /**
     *  模型 -> 字典
     */
     // 1.新建模型
        HggOne *user1 = [[HggOne alloc] init];
        user1.name = @"Jack";
        user1.icon = @"lufy.png";
        
        HggTwo *status1 = [[HggTwo alloc] init];
        status1.user = user;
        status1.text = @"今天的心情不错！";
        
        // 2.将模型转为字典
        NSDictionary *statusDict = status1.mj_keyValues;
        MJExtensionLog(@"%@", statusDict);
        
        MJExtensionLog(@"%@", [status1 mj_keyValuesWithKeys:@[@"text"]]);
        
        // 3.新建多级映射的模型
        HggStudent *stu = [[HggStudent alloc] init];
        stu.ID = @"123";
        stu.oldName = @"rose";
        stu.nowName = @"jack";
        stu.desc = @"handsome";
        stu.nameChangedTime = @"2018-09-08";
        stu.books = @[@"Good book", @"Red book"];
        
        HggBag *bag = [[HggBag alloc] init];
        bag.name = @"小书包";
        bag.price = 205;
        stu.bag = bag;
        
        NSDictionary *stuDict = stu.mj_keyValues;
        MJExtensionLog(@"%@", stuDict);
        MJExtensionLog(@"%@", [stu mj_keyValuesWithIgnoredKeys:@[@"bag", @"oldName", @"nowName"]]);
        MJExtensionLog(@"%@", stu.mj_JSONString);
        
        [HggStudent mj_referenceReplacedKeyWhenCreatingKeyValues:NO];
        MJExtensionLog(@"\n模型转字典时，字典的key参考replacedKeyFromPropertyName等方法:\n%@", stu.mj_keyValues);


    
    /**
     *  CoreData示例
     */
        NSDictionary *dict5 = @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png",
                               @"age" : @20,
                               @"height" : @1.55,
                               @"money" : @"100.9",
                               @"sex" : @(SexFemale),
                               @"gay" : @"true"
                               };
        
        // 这个Demo仅仅提供思路，具体的方法参数需要自己创建
        NSManagedObjectContext *context = nil;
        HggOne *user2 = [HggOne mj_objectWithKeyValues:dict5 context:context];
        
        // 利用CoreData保存模型
        [context save:nil];
        
        MJExtensionLog(@"name=%@, icon=%@, age=%zd, height=%@, money=%@, sex=%d, gay=%d", user2.name, user2.icon, user2.age, user2.height, user2.money, user2.sex, user2.gay);
    
    
    /**
     * NSCoding示例
     */
    // 创建模型
        HggBag *bag1 = [[HggBag alloc] init];
        bag1.name = @"Red bag";
        bag1.price = 200.8;
        
        NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"bag.data"];
        // 归档
        [NSKeyedArchiver archiveRootObject:bag1 toFile:file];
        
        // 解档
        HggBag *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
        MJExtensionLog(@"name=%@, price=%f", decodedBag.name, decodedBag.price);
    
    
    /**
     *  统一转换属性名（比如驼峰转下划线）
     */
     // 1.定义一个字典
        NSDictionary *dict6 = @{
                               @"nick_name" : @"旺财",
                               @"sale_price" : @"10.5",
                               @"run_speed" : @"100.9"
                               };
        
        // 2.将字典转为HggDog模型
        HggDog *dog = [HggDog mj_objectWithKeyValues:dict6];
        
        // 3.打印MJUser模型的属性
        MJExtensionLog(@"nickName=%@, scalePrice=%f runSpeed=%f", dog.nickName, dog.salePrice, dog.runSpeed);
    
    
    /**
     *  过滤字典的值（比如字符串日期处理为NSDate、字符串nil处理为@""）
     */
        // 1.定义一个字典
        NSDictionary *dict7 = @{
                               @"name" : @"5分钟突破iOS开发",
                               @"publishedTime" : @"2011-09-10"
                               };
        
        // 2.将字典转为HggBook模型
        HggBook *book = [HggBook mj_objectWithKeyValues:dict7];
        
        // 3.打印MJUser模型的属性
        MJExtensionLog(@"name=%@, publisher=%@, publishedTime=%@", book.name, book.publisher, book.publishedTime);


    
    
    /**
     *  使用MJExtensionLog打印模型的所有属性
     */
        HggOne *user8 = [[HggOne alloc] init];
        user8.name = @"MJ";
        user8.age = 10;
        user8.sex = SexMale;
        user8.icon = @"test.png";
        
        MJExtensionLog(@"%@", user8);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
