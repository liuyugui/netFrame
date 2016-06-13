//
//  DownLoadManager.m
//  downLoad
//
//  Created by MS on 12-12-15.
//  Copyright (c) 2012年 liuyugui. All rights reserved.
//  下载类，只负责下载

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

#import "DOWNLOAD_URL_TYPE.h"

@class DownLoad;
@protocol DownLoadDelegete <NSObject>

- (void)downLoadFishWith:(DownLoad *)downLade andSuccess:(id)data andFailure:(NSError *)error andMake:(NSString *)make;

@end

@interface DownLoad : NSObject

/**
 描述：下载urlstr
 */
@property(nonatomic,copy)NSString * urlStr;

/**
 描述：下载类型
 */
@property(nonatomic,assign)DOWNLOAD_TYPE downType;

/**
 描述：代理
 */
@property(nonatomic,weak)id<DownLoadDelegete> delegate;

/**
 描述：下载参数
 */
@property(nonatomic,strong)NSDictionary *parameters;

/**
 描述：下载任务
 */
@property(nonatomic,strong)NSURLSessionDataTask * task;

/**
 描述：是否取消的下载
 */
@property(nonatomic,assign)BOOL isCancel;


/**
 描述：成功执行的代码
 */
@property(nonatomic,copy)void (^fdsuccessBlock)(id responseObject);

/**
 描述：失败执行的代码
 */
@property(nonatomic,copy)void (^fdfailureBlock)(NSError * error);

/**
 *  开始下载
 */
- (void)startDownLoadAndMake:(NSString *)make;

@end
