//
//  NetWorkUrl.h
//  XJChain
//
//  Created by 曹宇 on 16/12/19.
//  Copyright © 2016年 曹宇. All rights reserved.
//

#ifndef NetWorkUrl_h
#define NetWorkUrl_h

#define BASEURL   @"http://119.29.73.138:3000/"

//  #define   BASEURL  @"http://192.168.0.104:3000/"  //  王峰

//#define  BASEURL @"http://192.168.0.107:3000/"

//  用户注册
#define REGISTER  @"publicInterface/register"
//   用户登录
#define LOGIN     @"publicInterface/login"
//   请求用户信息
#define QUERYACCINFO    @"privateInterface/queryAccInfo"
//    用户发行产品
#define PUBLISH          @"privateInterface/publish"
//     请求产品列表
#define GETPRODUCTLIST   @"publicInterface/getProductList"
//     查询当前挂牌产品信息详情
#define GETPRODUCTINFO     @"publicInterface/getProductInfo"
//     交易（认购）
#define  TRADE             @"privateInterface/trade"
//      查找单个用户下的资金信息列表
#define QUERYFUNDINFO       @"privateInterface/queryFundInfo"
//     查找单个用户下的资产信息列表
#define QUERYASSETINFO      @"privateInterface/queryAssetInfo"
//     用户充值
#define RECHARGE            @"privateInterface/recharge"
//      用户提现
#define WITHDRAWAL          @"privateInterface/withdrawal"
//      查找交易列表
#define GETTRADELIST        @"privateInterface/getTradeList"
//     查询用户列表
#define QUERYACCLIST        @"managerAuth/queryAccList"
//    添加用户信息
#define ADDACCINFO            @"managerAuth/addAccInfo"
//    修改用户信息
#define EDITACCINFO              @"managerAuth/editAccInfo"
//    查询单个用户
#define QUERYACCINF         @"managerAuth/queryAccInfo"
//    删除某个用户
#define DELACCINFO           @"managerAuth/delAccInfo"
//    查找部门列表
#define QUERYDEPTINFOLIST      @"managerAuth/queryDeptInfoList"
//    查询部门下岗位
#define QUERYDEPTTOPOSITIONLIST   @"managerAuth/queryDeptToPositionList"
//    查看岗位下面所有员工
#define QUERYPOSITIONTOACCLIST    @"managerAuth/queryPositionToAccList"
//   查询没有分配部门岗位的用户列表
#define QUERYACCLISTNODEPT         @"managerAuth/queryAccListNoDept"
//   批量修改用户的部门岗位
#define BTCHACCINFO               @"managerAuth/batchAccInfo"
//   查找角色列表
#define QUERYROLEINFOLIST           @"managerAuth/queryRoleInfoList"
//   查看角色下面所有员工
#define QEURYROLETOACCLIST           @"managerAuth/querRoleToAccList"
//   查询没有分配角色的用户列表
#define QUERYACCLISTNOROLE            @"managerAuth/queryAccListNoRole"
//      查找角色对应功能列表
#define QUERYURLINFOLIST              @"managerAuth/queryUrlInfoList"
//     添加角色信息
#define ADDROLEINFO                @"managerAuth/addRoleInfo"
//    查看角色下面所有功能
#define QUERYROLETOURLLIST           @"managerAuth/querRoleToUrlList"
//     菜单批量绑定角色
#define BATCHURLTOROLE           @"managerAuth/batchUrlToRole"
#endif /* NetWorkUrl_h */
