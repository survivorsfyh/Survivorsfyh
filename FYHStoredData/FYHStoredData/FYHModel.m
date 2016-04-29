//
//  FYHModel.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/26.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHModel.h"

@implementation FYHModel

+ (FYHModel *)modelWithSet:(FMResultSet *)set {
    return [[FYHModel alloc] initWithSet:set];
}

- (id)initWithSet:(FMResultSet *)set {
    if (self = [super init]) {
        //根据字段名字取
        _sId = [set intForColumn:@"sId"];
        //根据索引取
        _username = [set stringForColumnIndex:1];
        _password = [set stringForColumnIndex:2];
        _changePassWord = [set stringForColumnIndex:3];
        _score = [set intForColumnIndex:4];
    }
    return self;
}

@end
