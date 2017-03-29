//
//  BAASDeptModel.h
//  BAAService
//
//  Created by cao yu on 2017/3/16.
//  Copyright © 2017年 cao yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAASDeptModel : NSObject

@property (nonatomic,copy) NSString *companyCode;
@property (nonatomic,copy) NSString *created;
@property (nonatomic,copy) NSString *depName;
@property (nonatomic,copy) NSString *deptCode;
@property (nonatomic,copy) NSString *deptId;
@property (nonatomic,copy) NSString *lastModifyTime;
@property (nonatomic,copy) NSString *metadata;
@property (nonatomic,copy) NSString *parentCode;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSMutableArray *subArr;
@property (nonatomic,copy) NSString *expand;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) NSString *choosed;

@end
