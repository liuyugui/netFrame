//
//  FDToMoudelTool.m
//  FDDPlus
//
//  Created by liuyugui on 16/5/30.
//  Copyright © 2016年 liuyugui. All rights reserved.
//

#import "FDToMoudelTool.h"
#import "MBProgressHUD+FDHUD.h"


@implementation FDToMoudelTool

+ (id)toMoudelWithDict:(NSDictionary *)dict andType:(DOWNLOAD_TYPE)type{

    
        __block id requestDate = dict;
    
        
        //根据类型不同解析数据
        if (
            type == TYPE_SS_FT_LIST_URL
            ){
            
            //可以 转成模型后返回
            
            requestDate = dict;
            
        }
    
        return requestDate;
        
        
}

@end
