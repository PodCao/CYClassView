//
//  TableViewChooseCell.h
//  ClassChooseDemo
//
//  Created by cao yu on 2017/3/27.
//  Copyright © 2017年 cao yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAASDeptModel.h"
#import "BAASPositionModel.h"

@protocol  TableViewChooseCellDelegate <NSObject>

- (void)transferWithModel:(BAASDeptModel *)model;

@end

@interface TableViewChooseCell : UITableViewCell

- (void)cellWithModel:(BAASDeptModel *)model;
@property (nonatomic,assign) id<TableViewChooseCellDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *positionArr;

+ (CGFloat)calculateCellHeightWithArr:(NSMutableArray *)arr;


@end

