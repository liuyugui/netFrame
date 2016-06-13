
//
//  DownLoadManager.m
//  downLoad
//
//  Created by MS on 12-12-15.
//  Copyright (c) 2012年 liuyugui. All rights reserved.
//  项目下载的接口

typedef void (^CompletionDataBlock)(id data, NSError *error);


typedef enum{
    TYPE_SS_FT_LIST_URL,         //素事
    
} DOWNLOAD_TYPE;




//线上测试环境
#define ROOT_URL @"http://client-api.dingdone.com/"

//素事
#define SS_FT_LIST_URL ROOT_URL@"6944GS58RV/214101/listcontents"

//摄影
#define SS_SY_LIST_URL @"6944GS58RV/214101/listcontents?column_id=339169&from=0&size=15"

//文章
#define ARTICLE_URL @"6944GS58RV/content/%ld?&tplId=Tpl5"