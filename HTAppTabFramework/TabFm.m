//
//  TabFm.m
//  HTAppTabFramework
//
//  Created by yxk on 16/4/25.
//  Copyright © 2016年 HengTian. All rights reserved.
//

#import "TabFm.h"
#import "PageManager.h"
#import "NavFm.h"

@implementation TabFm

- (instancetype)init
{
    if (self = [super init]) {
        _mainTabBar = [[UITabBarController alloc] init];
    }
    return self;
}

- (void)createMainTab
{
    NSMutableArray *tabItems = [[NSMutableArray alloc] init];
    PageManager *pageManager = [PageManager shareInstance];
    for (Tab *tab in pageManager.tabs) {
        NavFm *nav = [[NavFm alloc] init];
        [tabItems addObject:nav];
    }
    _mainTabBar.viewControllers = tabItems;
}

@end
