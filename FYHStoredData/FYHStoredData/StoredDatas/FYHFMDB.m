//
//  FYHFMDB.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHFMDB.h"

@implementation FYHFMDB

//创建
- (id)init {
    if (self = [super init]) {
        _dataArr = [NSMutableArray array];
        
        //设置数据库路径保存至桌面
        NSString *destopPath = @"/Users/cyberzone/Desktop/my.rdb";
        NSFileManager *manger = [NSFileManager defaultManager];
        //获取沙河目录下文件夹
        NSArray *arr = [manger contentsOfDirectoryAtPath:NSHomeDirectory() error:nil];
        NSLog(@"沙盒路径:%@ --- array:%@", NSHomeDirectory() ,arr);
        //存储至沙河目录 Documents 下
        NSString *homePath = [NSString stringWithFormat:@"%@/Documents/cyberzone.rdb", NSHomeDirectory()];
        _myDataBase = [[FMDatabase alloc] initWithPath:homePath];
        //打开
//        [_myDataBase open];
        if (_myDataBase.open == NO) {
            NSLog(@"开启失败");
        }
    }
    return self;
}

- (FYHFMDB *)fmdbWithName:(FYHFMDBType)name AndPassWord:(FYHFMDBType)passWord {
    /*
     FYHFMDBCreateTable = 1,//创建表
     FYHFMDBDataInsert,//增
     FYHFMDBDataDelete,//删
     FYHFMDBDataChange,//改
     FYHFMDBDataSelect//查
     */
    FYHFMDB *fmdb = [[FYHFMDB alloc] init];
    
    switch (name) {
        case FYHFMDBCreateTable:
            //建表
            [self createTable];
            break;
        case FYHFMDBDataInsert:
            //增
            [self dataInsert];
            break;
        case FYHFMDBDataDelete:
            //删
            [self dataDelete];
            break;
        case FYHFMDBDataChange:
            //改
            [self dataChange];
            break;
        case FYHFMDBDataSelect:
            //查
            [self dataSelect];
            break;
            
        default:
            break;
    }
    
    switch (passWord) {
        case FYHFMDBCreateTable:
            //建表
            [self createTable];
            break;
        case FYHFMDBDataInsert:
            //增
            [self dataInsert];
            break;
        case FYHFMDBDataDelete:
            //删
            [self dataDelete];
            break;
        case FYHFMDBDataChange:
            //改
            [self dataChange];
            break;
        case FYHFMDBDataSelect:
            //查
            [self dataSelect];
            break;
            
        default:
            break;
    }
    
    return nil;
}

#pragma mark - 具体操作相关
//建表
- (void)createTable {
    //CREATE TABLE IF NOT EXISTS 固定部分
    //CREATE TABLE IF NOT EXISTS+表名+参数
    NSString *createTab = @"CREATE TABLE IF NOT EXISTS StudentInfo(sId INTEGER,name varchar(32),password varchar(32),score INTEGER)";
    
    BOOL isSuc = [_myDataBase executeUpdate:createTab];
    
    isSuc ? NSLog(@"建表成功") : NSLog(@"建表失败");
    
//    if (isSuc) {
//        NSLog(@"建表成功");
//    } else {
//        NSLog(@"建表失败");
//    }
}

#pragma mark - To do somethings
//增
- (void)dataInsert {
    _myID = 2;
    _name = @"名字";
    _passWord = @"mima";
    _score = @"4";
    
    NSString *insertsql = @"INSERT INTO StudentInfo(sId,name,password,score) values(?,?,?,?)";
    
    BOOL isSuc = [_myDataBase executeUpdate:insertsql, [NSString stringWithFormat:@"%i", _myID], _name, _passWord, [NSString stringWithFormat:@"%@",_score]];
    
    isSuc ? NSLog(@"增加成功") : NSLog(@"增加失败");
    
    _myID++;
}
//删
- (void)dataDelete {
    //DELETE FROM StudentInfo WHERE name = ? 从表格StudentInfo里面删除 name 为某个名字下面的数据
    NSString *deleteSql = @"DELETE FROM StudentInfo WHERE name = ?";
    
    BOOL isSuc = [_myDataBase executeUpdate:deleteSql,@"新名字"];
    
    isSuc ? NSLog(@"删除成功") : NSLog(@"删除失败");
}
//改
- (void)dataChange {
    _name = @"名字";
    _changePassWord = @"newmima";
    
    NSString *updateSql = @"UPDATE StudentInfo SET password = ? WHERE name = ?";
    
    BOOL isSuc = [_myDataBase executeUpdate:updateSql,_changePassWord,_name];
    
    isSuc ? NSLog(@"删除成功") : NSLog(@"删除失败");
}
//查
- (NSMutableArray *)dataSelect {
    NSString *selectSql = @"SELECT * FROM StudentInfo";
    
    //FMResultSet是一个集合类,结果集合
    //增删改 都是executeUpdate
    //查询数据 是executeQuery 这个方法
    FMResultSet *set = [_myDataBase executeQuery:selectSql];
    
    //next取到当前行的数据,如果娶不到,就结束循环
    while ([set next]) {
        
//        NSString *name = [NSString stringWithFormat:@"%@",[set stringForColumn:@"name"]];
//        NSLog(@"name----%@",name);
        FYHModel *model = [FYHModel modelWithSet:set];
        [_dataArr addObject:model];
    }
    return _dataArr;
}

@end
