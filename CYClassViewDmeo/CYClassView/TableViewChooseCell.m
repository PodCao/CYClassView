//
//  TableViewChooseCell.m
//  ClassChooseDemo
//
//  Created by cao yu on 2017/3/27.
//  Copyright © 2017年 cao yu. All rights reserved.
//

#import "TableViewChooseCell.h"
#import "BAASChoosePositionCollectionViewCell.h"

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface TableViewChooseCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UIImageView *chooseIma;
@property (nonatomic,strong) UIImageView *downDrawIma;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UICollectionView *positionCollection;
@property (nonatomic,strong) BAASDeptModel *model;

@end

@implementation TableViewChooseCell
+ (CGFloat)calculateCellHeightWithArr:(NSMutableArray *)arr{
    if (arr.count == 0) {
        return 50;
    }else{
        return 50 + ((((arr.count - 1)/3)+ 1)*60);
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.chooseIma];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.downDrawIma];
    [self.contentView addSubview:self.positionCollection];
}
- (void)chooseTapAction:(UITapGestureRecognizer *)tap{
    
    if (self.delegate) {
        [self.delegate transferWithModel:self.model];
    }
}
- (void)cellWithModel:(BAASDeptModel *)model{
    self.model = model;
    self.nameLab.text = model.depName;
    if ([model.expand isEqualToString:@"0"]) {
        self.downDrawIma.backgroundColor = [UIColor blueColor];
    }else{
        self.downDrawIma.backgroundColor = [UIColor redColor];
    }
    if ([model.choosed isEqualToString:@"0"]) {
        self.chooseIma.backgroundColor = [UIColor redColor];
        self.positionCollection.hidden = YES;
    }else{
        self.chooseIma.backgroundColor = [UIColor grayColor];
        self.positionCollection.hidden = NO;
    }
    self.positionCollection.frame = CGRectMake(0, 50, SCREEN_WIDTH, [TableViewChooseCell calculateCellHeightWithArr:self.positionArr] - 50);
    NSLog(@"opopopopopopop%@  %@",self.positionArr,self.model.choosed);
    self.nameLab.frame = CGRectMake(10 + model.index * 30, 10, 190, 30);
    [self.positionCollection reloadData];
    
}
- (UIImageView *)chooseIma{
    if (_chooseIma == nil) {
        _chooseIma = [[UIImageView alloc]initWithFrame:CGRectMake(14, 15, 20, 20)];
        _chooseIma.userInteractionEnabled = YES;
        _chooseIma.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseTapAction:)];
        [_chooseIma addGestureRecognizer:tap];
    }
    return _chooseIma;
}
- (UILabel *)nameLab{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(self.chooseIma.frame.size.width + 14 + 5, 10, 190, 30)];
        
    }
    return _nameLab;
}
- (UIImageView *)downDrawIma{
    if (_downDrawIma == nil) {
        _downDrawIma = [[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width - 30, 17, 16, 16)];
        _downDrawIma.backgroundColor = [UIColor redColor];
    }
    return _downDrawIma;
}
- (UICollectionView *)positionCollection{
    if (_positionCollection == nil) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //根据自己的需求设置宽高
        [flowLayout setItemSize:CGSizeMake(90, 33)];
        //竖直滑动
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //内边距，列、行间距
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 30, 15, 30);
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _positionCollection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        //注册（xib）
        [_positionCollection registerNib:[BAASChoosePositionCollectionViewCell nib] forCellWithReuseIdentifier:NSStringFromClass([BAASChoosePositionCollectionViewCell class])];
        //代理、数据源（也可以拖线）
        _positionCollection.delegate = self;
        _positionCollection.dataSource = self;
        _positionCollection.backgroundColor = [UIColor clearColor];
    }
    return _positionCollection;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BAASChoosePositionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BAASChoosePositionCollectionViewCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.positionArr.count;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
