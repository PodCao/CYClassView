//
//  ViewController.m
//  CYClassViewDmeo
//
//  Created by cao yu on 2017/3/29.
//  Copyright © 2017年 cao yu. All rights reserved.
//

#import "ViewController.h"
#import "CYClassView.h"
#import "BAASDeptModel.h"
#import "AFNManager.h"
#import "NetWorkUrl.h"
#import <MJExtension.h>

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define MAKEURL(A,B)   [NSString stringWithFormat:@"%@%@",A,B]


@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) CYClassView *classView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    self.classView = [[CYClassView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    [self.view addSubview:self.classView];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)requestData{
    NSString *token = @"123456abcdef!@#$%^";
    NSDictionary *parma = @{@"pageNo":@"",@"pageSize":@"",@"parentCode":@"",@"token":token};
    [AFNManager postNetWorkWithUrl:MAKEURL(BASEURL, QUERYDEPTINFOLIST) body:parma success:^(id data) {
        self.dataArr = [BAASDeptModel mj_objectArrayWithKeyValuesArray:[data objectForKey:@"data"]];
        for (BAASDeptModel *model in self.dataArr) {
            model.choosed = @"0";
        }
        [self initData];
    } failure:^(NSError *error) {
        
    } progress:^(unsigned long long size, unsigned long long total) {
        
    }];
}
- (void)initData{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < self.dataArr.count; i++) {
        BAASDeptModel *model = [self.dataArr objectAtIndex:i];
        if ([model.parentCode isEqualToString:@"0"]) {
            [arr addObject:model];
        }
    }
    self.classView.firClassArr = self.dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
