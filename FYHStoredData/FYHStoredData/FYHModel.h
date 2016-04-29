//
//  FYHModel.h
//  FYHStoredData
//
//  Created by cyberzone on 16/4/26.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface FYHModel : NSObject

@property (nonatomic, assign) NSInteger sId;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *changePassWord;

+ (FYHModel *)modelWithSet:(FMResultSet *)set;

@end
