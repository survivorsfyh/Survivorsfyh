//
//  Person.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "Person.h"

@implementation Person

//实现方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:UIImageJPEGRepresentation(self.icon, 1.0) forKey:@"image"];//存储 img 为 JPG 格式,1.0压缩比
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    [aCoder encodeObject:_sex forKey:@"sex"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.icon = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"image"]];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.email = [aDecoder decodeObjectForKey:@"email"];
    self.phone = [aDecoder decodeObjectForKey:@"phone"];
    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    return self;
}

@end
