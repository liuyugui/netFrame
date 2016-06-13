//
//  FDDownManage.h
//
//
//  Created by liuyugui  on 16/3/23.
//  Copyright © 2016年 liuyugui . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DOWNLOAD_MOUDEL.h"
#import "DOWNLOAD_URL_TYPE.h"


@interface FDDownManage : NSObject


/**
 *  获取单例
 *
 *  @return 返回当前单例
 */
+ (instancetype)sheaderFDDownManage;



#pragma mark 其他接口

//column_id=375250&from=0&size=15

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
- (void)SSListWithColumn_id:(NSString *)column_id andFrom:(NSString *)from andSize:(NSString *)size andSuccessBlock:(void (^)(id dict))successBlock andFailureBlock:(void (^)(id dict))failureBlock andMake:(NSString *)make;





@end
