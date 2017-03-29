//
//  CYClassView.m
//  ClassChooseDemo
//
//  Created by cao yu on 2017/3/27.
//  Copyright © 2017年 cao yu. All rights reserved.
//

#import "CYClassView.h"
#import "TableViewChooseCell.h"
#import "BAASDeptModel.h"
#import "BAASPositionModel.h"
#import "AFNManager.h"
#import <MJExtension.h>
#import "NetWorkUrl.h"

#define MAKEURL(A,B)   [NSString stringWithFormat:@"%@%@",A,B]


@interface CYClassView ()<UITableViewDelegate,UITableViewDataSource,TableViewChooseCellDelegate>

@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *showArr;
@property (nonatomic,strong) NSMutableArray *positionArr;

@end

@implementation CYClassView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}
#pragma mark -------------PrivateMethod
- (void)setupUI{
    [self addSubview:self.table];
}
#pragma mark -------------UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewChooseCell class]) forIndexPath:indexPath];
    BAASDeptModel *model = [self.showArr objectAtIndex:indexPath.row];
    
    if ([model.choosed isEqualToString:@"1"]) {
        cell.positionArr = self.positionArr;
    }else{
        cell.positionArr = [NSMutableArray array];
    }
    [cell cellWithModel:[self.showArr objectAtIndex:indexPath.row]];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.showArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BAASDeptModel *model = [self.showArr objectAtIndex:indexPath.row];
    if ([model.choosed isEqualToString:@"0"]) {
        return 50;
    }else{
        return [TableViewChooseCell calculateCellHeightWithArr:self.positionArr];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BAASDeptModel *model = [self.showArr objectAtIndex:indexPath.row];
    if ([model.expand isEqualToString:@"1"]) {
        model.expand = @"0";
    }else{
        model.expand = @"1";
    }
    /*for (BAASDeptModel *mod in self.showArr) {
        if (model == mod) {
            if ([model.expand isEqualToString:@"1"]) {
                model.expand = @"0";
            }else{
                model.expand = @"1";
            }
        }
    }*/
    if ([model.expand isEqualToString:@"1"]) {
        for (int i = 0; i < self.firClassArr.count; i++) {
            BAASDeptModel *m = [self.firClassArr objectAtIndex:i];
            if ([model.deptCode isEqualToString:m.parentCode]) {
                m.index = model.index + 1;
                m.expand = @"0";
                [self.showArr insertObject:m atIndex:(indexPath.row + 1)];
            }
        }
    }else{
        NSMutableArray *showArr = [NSMutableArray arrayWithArray:self.showArr];
        for (int i = indexPath.row + 1; i < showArr.count; i++) {
            BAASDeptModel *m = [showArr objectAtIndex:i];
            if (m.index > model.index) {
                m.expand = @"0";
                [self.showArr removeObject:m];
            }else{
                break ;
            }
        }
    }
    [self.table reloadData];
}
- (void)transferWithModel:(BAASDeptModel *)model{
    if ([model.choosed isEqualToString:@"0"]) {
        for (BAASDeptModel *mo in self.showArr) {
            mo.choosed = @"0";
        }
        model.choosed = @"1";
    }else{
        model.choosed = @"0";
    }
    
    NSString *token = @"123456abcdef!@#$%^";
    NSDictionary *parma = @{@"pageNo":@"1",@"pageSize":@"20",@"token":token,@"deptCode":model.deptCode};
    [AFNManager postNetWorkWithUrl:MAKEURL(BASEURL, QUERYDEPTTOPOSITIONLIST) body:parma success:^(id data) {
        self.positionArr = [BAASPositionModel mj_objectArrayWithKeyValuesArray:[data objectForKey:@"data"]];
        [self.table reloadData];

    } failure:^(NSError *error) {
        
    } progress:^(unsigned long long size, unsigned long long total) {
        
    }];
}
#pragma mark -------------SetGetMethod
- (UITableView *)table{
    if (_table == nil) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[TableViewChooseCell class] forCellReuseIdentifier:NSStringFromClass([TableViewChooseCell class])];
    }
    return _table;
}
- (void)setFirClassArr:(NSMutableArray *)firClassArr{
    _firClassArr = firClassArr;
    for (BAASDeptModel *model in firClassArr) {
        if ([model.parentCode isEqualToString:@"0"]) {
            model.expand = @"0";
            model.index = 0;
            [self.showArr addObject:model];
        }
    }
    [self.table reloadData];
    
}
- (NSMutableArray *)showArr{
    if (_showArr == nil) {
        _showArr = [NSMutableArray array];
    }
    return _showArr;
}
- (NSMutableArray *)positionArr{
    if (_positionArr == nil) {
        _positionArr = [NSMutableArray array];
    }
    return _positionArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
