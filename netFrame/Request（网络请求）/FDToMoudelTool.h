//
//  FDToMoudelTool.h
//  FDDPlus
//
//  Created by liuyugui on 16/5/30.
//  Copyright © 2016年 fadada. All rights reserved.
//  转模型工具

#import <Foundation/Foundation.h>
#import "DOWNLOAD_URL_TYPE.h"
#import "DOWNLOAD_MOUDEL.h"

@interface FDToMoudelTool : NSObject


+ (id)toMoudelWithDict:(NSDictionary *)dict andType:(DOWNLOAD_TYPE)type;

@end
