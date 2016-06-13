//
//  DownLoadManager.m
//  downLoad
//
//  Created by MS on 12-12-15.
//  Copyright (c) 2012年 liuyugui. All rights reserved.
//  下载类，只负责下载

#import "DownLoad.h"



@implementation DownLoad

/**
 *  开始下载
 */
- (void)startDownLoadAndMake:(NSString *)make{

    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
     NSURLSessionDataTask * task = [manager GET:self.urlStr parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         if (self.delegate) {
             
             [self.delegate downLoadFishWith:self andSuccess:responseObject andFailure:nil andMake:make];
             
         }

     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
         if (self.delegate) {
             
             [self.delegate downLoadFishWith:self andSuccess:nil andFailure:error andMake:make];
             
         }
     }];
    
//    NSURLSessionDataTask * task = [manager POST:self.urlStr parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        
//        if (self.delegate) {
//            
//            [self.delegate downLoadFishWith:self andSuccess:responseObject andFailure:nil andMake:make];
//            
//        }
//        
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        if (self.delegate) {
//        
//            [self.delegate downLoadFishWith:self andSuccess:nil andFailure:error andMake:make];
//            
//        }
//        
//        
//    }];
    
    
    self.task = task;
    
}


@end
