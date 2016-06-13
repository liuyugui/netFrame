//
//  FDDownManage.m
//
//
//  Created by liuyugui on 16/3/23.
//  Copyright © 2016年 liuyugui. All rights reserved.
//


#import "FDDownManage.h"
#import "MBProgressHUD+FDHUD.h"
#import "DownLoad.h"


#import <AFNetworking.h>

#import "FDToMoudelTool.h"

@interface FDDownManage()<DownLoadDelegete>

/**
 描述：下载任务字典
 */
@property(nonatomic,strong)NSMutableDictionary * taskDict;

/**
 描述：请求头
 */
@property(nonatomic,strong)NSDictionary * RequestHeadDic;

@end


@implementation FDDownManage


//登录后的下载管理类
static FDDownManage * _fdDownManage;


/**
 *  获取单利
 *
 *  @return 返回当前单利
 */
+ (instancetype)sheaderFDDownManage{
    
    if (_fdDownManage == nil) {
        
        _fdDownManage = [[FDDownManage alloc]init];
        
    }
    
    return _fdDownManage;
    
}


/**
 *  发送请求
 *
 *  @param UrlStr     下载地址
 *  @param LoadType   下载类型
 *  @param parameters 下载参数，3des加密了的
 *  @param block      下载完成后执行的代码块
 */
- (void)sendrequestWithUrlStr:(NSString *)UrlStr andLoadType:(DOWNLOAD_TYPE)LoadType andParameters:(NSDictionary *)parameters andSuccessBlock:(void (^)(id dict))successBlock andFailureBlock:(void (^)(id dict))failureBlock andMake:(NSString *)make{
    
    
    //发送请求
    
    //检查是否正在下载
    if ([_taskDict objectForKey:make]) {
        
        [MBProgressHUD showError:@"请不要重复请求"];
        
    }else{
        
        //        NSLog(@"创建 %@ 请求任务！",make);
        
        DownLoad * downLoad = [[DownLoad alloc]init];
        
        //代理代理
        downLoad.delegate = self;
        //添加下载地址
        downLoad.urlStr = UrlStr;
        //添加下载类型
        downLoad.downType = LoadType;
        //请求参数
        downLoad.parameters = parameters;
        //下载成功执行的代码
        downLoad.fdsuccessBlock = successBlock;
        //失败
        downLoad.fdfailureBlock = failureBlock;
        
        [downLoad startDownLoadAndMake:make];
        
        if (_taskDict == nil) {
            
            _taskDict = [[NSMutableDictionary alloc]init];
        }
        

        //存储下载任务
        [_taskDict setObject:downLoad forKey:make];
        
        
    }// end if ([_taskDict objectForKey:urlStr])
    
    
}

/**
 *  取消下载
 *
 *  @param make 下载标记
 */
- (void)cancelTaskWithmake:(NSString *)make{
    
    DownLoad * down = [_taskDict objectForKey:make];
    
    NSURLSessionDataTask * task = down.task;
    
    [task cancel];
    
    [_taskDict removeObjectForKey:make];
    
  
}


- (void)downLoadFishWith:(DownLoad *)downLade andSuccess:(id)data andFailure:(NSError *)error andMake:(NSString *)make{


#pragma mark 统一做下载失败的界面
    
    //这里做判断请求是否成功，可以做统一的界面提示
    
    
    
    downLade.fdsuccessBlock([FDToMoudelTool toMoudelWithDict:data andType:downLade.downType]);
    
    //从下载任务字典中移除
    [_taskDict removeObjectForKey:make];
    
    
}

/**
 *  素事
 *
 *  @param column_id    <#column_id description#>
 *  @param from         <#from description#>
 *  @param size         <#size description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 *  @param make         <#make description#>
 */
- (void)SSListWithColumn_id:(NSString *)column_id andFrom:(NSString *)from andSize:(NSString *)size andSuccessBlock:(void (^)(id dict))successBlock andFailureBlock:(void (^)(id dict))failureBlock andMake:(NSString *)make{

    //requestInfo请求体
    NSMutableDictionary * MuRequestInfoDict = [[NSMutableDictionary alloc]init];
    
    [MuRequestInfoDict setValue:column_id forKey:@"column_id"];
    [MuRequestInfoDict setValue:from forKey:@"from"];
    [MuRequestInfoDict setValue:size forKey:@"size"];
    
    [self sendrequestWithUrlStr:SS_FT_LIST_URL andLoadType:TYPE_SS_FT_LIST_URL andParameters:MuRequestInfoDict andSuccessBlock:successBlock andFailureBlock:failureBlock andMake:make];
    
}

@end
