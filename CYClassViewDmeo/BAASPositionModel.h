//
//  BAASPositionModel.h
//  BAAService
//
//  Created by cao yu on 2017/3/16.
//  Copyright © 2017年 cao yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAASPositionModel : NSObject

@property (nonatomic,copy) NSString *companyCode;
@property (nonatomic,copy) NSString *created;
@property (nonatomic,copy) NSString *deptCode;
@property (nonatomic,copy) NSString *lastModifyTime;
@property (nonatomic,copy) NSString *metadata;
@property (nonatomic,copy) NSString *parentCode;
@property (nonatomic,copy) NSString *positionCode;
@property (nonatomic,copy) NSString *positionId;
@property (nonatomic,copy) NSString *positionName;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *isChoose;

@end
