//
//  PageManager.m
//  HTAppTabFramework
//
//  Created by yxk on 16/4/25.
//  Copyright © 2016年 HengTian. All rights reserved.
//

#import "PageManager.h"

@implementation Tab

@end

@implementation Page

@end

@implementation PageManager

- (instancetype)init
{
    if (self == [super init]) {
        _tabs = [[NSMutableArray alloc] init];
        _pages = [[NSMutableArray alloc] init];
        [self getDicFromJSON];
    }
    return self;
}

+ (instancetype)shareInstance
{
    static PageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PageManager alloc] init];
    });
    return manager;
}

- (void)getDicFromJSON
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"PageConfig" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@", dic);
    [self setValuesForKeysWithDictionary:dic];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"tab"]) {
        NSArray *array = value;
        for (NSDictionary *dic in array) {
            Tab *tab = [[Tab alloc] init];
            [tab setValuesForKeysWithDictionary:dic];
            [_tabs addObject:tab];
        }
    }
    if ([key isEqualToString:@"page"]) {
        NSArray *array = value;
        for (NSDictionary *dic in array) {
            Page *page = [[Page alloc] init];
            [page setValuesForKeysWithDictionary:dic];
            [_pages addObject:page];
        }
    }
}

- (NSString *)getPageLevel:(NSString *)pageId
{
    for (Page *page in _pages) {
        if ([page.pageId isEqualToString:pageId]) {
            return page.pageLevel;
        }
    }
    return nil;
}

//- (void)getPagesFromDic:(NSDictionary *)dic
//{
//    
//}

//- (instancetype)initWithDic:(NSDictionary *)dic
//{
//    if (self == [super init]) {
//        
//    }
//    return self;
//}

@end
