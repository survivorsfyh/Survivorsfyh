//
//  FYHFMDB.h
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

/*
 1.创建数据库--并打开
 2.创建表
 3.增
 4.删
 5.改
 6.查
 7.关闭数据库
 
 创建数据库并打开 --- 设置路径,放在桌面
 1.2 讲数据库放在沙盒目录下 Documents 文件夹下
 
 沙盒:每一个应用程序都有一个沙盒,沙盒就是手机给应用程序开辟的一块空间.
 默认情况下,每个沙盒下面有三个文件夹.
 1.3.Documents,Library 和 tmp ,因为是沙盒机制,只能在这几个目录下读写文件.
 
 Documents:苹果官方建议将程序中建立的或在程序中浏览的文件数据保存到此目录下.
 Library: 存储程序默认的设置和其他状态信息;
 Library/Caches: 存放缓存文件, iTunes 不会备份这个目录,此目录下的文件不会在应用退出的时候删除掉.
 
 //缓存:内存缓存,硬盘缓存
 //读取数据的顺序: 内存缓存-内存条(第一次从硬盘中读取)>----硬盘缓存----硬盘
 //缓存可以减少用户流量,增加用户体验,减少用户读取数据时间 ,增加效率.
 
 tmp-- 提供一个临时的创建文件的地方, iPhone重启的时候这个文件夹会删除.
 会丢失 tmp 文件夹下所有的数据
 
 //.rdb---是一种数据库文件, relation database 的缩写,关系数据库,表示的是数据和表之间的一种对应关系.
 */

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FYHModel.h"

typedef enum {
    FYHFMDBCreateTable = 1,//创建表
    FYHFMDBDataInsert,//增
    FYHFMDBDataDelete,//删
    FYHFMDBDataChange,//改
    FYHFMDBDataSelect//查
}FYHFMDBType;

@interface FYHFMDB : NSObject

@property (nonatomic, strong) FMDatabase *myDataBase;

@property (nonatomic, assign) NSInteger *myID;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *passWord;
@property (nonatomic, strong) NSString *changePassWord;

@property (nonatomic, strong) NSMutableArray *dataArr;

- (void)createTable;//建表
- (void)dataInsert;//增
- (void)dataDelete;//删
- (void)dataChange;//改
- (NSMutableArray *)dataSelect;//查

- (FYHFMDB *)fmdbWithName:(FYHFMDBType)name AndPassWord:(FYHFMDBType)passWord;

@end
