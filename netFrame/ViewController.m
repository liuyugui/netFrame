//
//  ViewController.m
//  netFrame
//
//  Created by liuyugui on 16/6/13.
//  Copyright © 2016年 liuyugui. All rights reserved.
//

#import "ViewController.h"
#import "FDDownManage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self requesetData];
    
}

- (void)requesetData{

    [[FDDownManage sheaderFDDownManage]SSListWithColumn_id:@"#375250" andFrom:@"0" andSize:@"15" andSuccessBlock:^(id dict) {
        
        NSLog(@"%@",dict);
        
    } andFailureBlock:^(id dict) {
        
        NSLog(@"%@",dict);
        
    } andMake:@"SSListWithColumn_id"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
