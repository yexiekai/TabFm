//
//  PageManager.h
//  HTAppTabFramework
//
//  Created by yxk on 16/4/25.
//  Copyright © 2016年 HengTian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tab : NSObject
@property (nonatomic) NSString *tabId;
@property (nonatomic) NSString *tabPageArray;
@end

@interface Page : NSObject
@property (nonatomic) NSString *pageId;
@property (nonatomic) NSString *pageLevel;
@end

@interface PageManager : NSObject
@property (nonatomic, strong) NSMutableArray *tabs;
@property (nonatomic, strong) NSMutableArray *pages;
+ (instancetype)shareInstance;
@end
