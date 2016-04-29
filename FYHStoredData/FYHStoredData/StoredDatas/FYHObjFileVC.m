//
//  FYHObjFileVC.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHObjFileVC.h"
#import "Person.h"

@interface FYHObjFileVC () {
    UIImageView *imgView;
}

@property (nonatomic, strong) NSString *storagePath;
@property (nonatomic, strong) NSString *storageListPath;
@property (nonatomic, strong) NSMutableArray *personArr;

@end

@implementation FYHObjFileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     将对象写入文件保存在磁盘的文件内,以二进制形式进行存储,再次打开程序时,可以还原这些对象,也可成为对象序列化;
     常用的文件存储方法之一,基本任何对象都可被归档,可以自定义对象存储在文件中;
     优点:通过归档保存的数据在文件中打开是乱码,安全性能高
     缺点:只能对数据进行一次性归档和解档,从而对数据操作不方便
     */
    
    [self createObjFile];
//    [self encodeWithCoder:<#(nonnull NSCoder *)#>];
}

- (void)createObjFile {
    NSLog(@"*** *** 对象归档相关 *** ***");
    /*
     归档形式:
        对 Foundation 库中对象进行归档
        自定义对象进行归档（需要实现归档协议,NSCoding）
     */
    
    NSArray *codePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _storagePath = [codePath[0] stringByAppendingPathComponent:@"person.plist"];
    _storageListPath = [codePath[0] stringByAppendingPathComponent:@"person.plist"];
    
#pragma mark - 单个
    //单个存档
    Person *person = [[Person alloc] init];
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    person.icon = img;
    person.name = @"数据";
    person.email = @"qwe@123.com";
    person.phone = @"1234556";
    person.sex = @"男";
    if ([NSKeyedArchiver archiveRootObject:person toFile:_storagePath]) {
        NSLog(@"数据存储成功 --- 单个存档");
    }
    
    //单个压缩
    Person *decodePerson = [NSKeyedUnarchiver unarchiveObjectWithFile:_storagePath];
    imgView.image = decodePerson.icon;
    NSLog(@"单个存档成功:icon:%@ --- name:%@", decodePerson.icon, decodePerson.name);
    
#pragma mark - 多个
    //多个存档
    self.personArr = [NSMutableArray array];
    for (NSInteger i = 1; i < 3; i++) {
        Person *person = [[Person alloc] init];
        NSString *imgName = [NSString stringWithFormat:@"Code%ld.jpg",(long)i];
        UIImage *img = [UIImage imageNamed:imgName];
        person.icon = img;
        person.name = [NSString stringWithFormat:@"name%ld",(long)i];
        person.email = [NSString stringWithFormat:@"email%ld",(long)i];
        person.phone = [NSString stringWithFormat:@"phone%ld",(long)i];
        person.sex = [NSString stringWithFormat:@"sex%ld",(long)i];
        [self.personArr addObject:person];
    }
    if ([NSKeyedArchiver archiveRootObject:self.personArr toFile:_storageListPath]) {
        NSLog(@"数据存储成功 --- 多个存档");
    }
    
    //多个解档
    self.personArr = [NSKeyedUnarchiver unarchiveObjectWithFile:_storageListPath];
    Person *newPerson = self.personArr[1];
    imgView.image = newPerson.icon;
    NSLog(@"解档成功!");
}

#pragma mark - 对 Foundation 库中对象进行归档
//归档方法
//- (void)encodeObject:(nullable id)object;
//- (void)encodeObject:(nullable id)objv forKey:(NSString *)key;
//- (void)encodeBool:(BOOL)boolv forKey:(NSString *)key;
//- (void)encodeInt:(int)intv forKey:(NSString *)key;
//- (void)encodeFloat:(float)realv forKey:(NSString *)key;
//- (void)encodeDouble:(double)realv forKey:(NSString *)key;
//- (void)encodeBytes:(nullable const uint8_t *)bytesp length:(NSUInteger)lenv forKey:(NSString *)key;
//解档方法
//- (nullable id)decodeObjectForKey:(NSString *)key;
//- (BOOL)decodeBoolForKey:(NSString *)key;
//- (int)decodeIntForKey:(NSString *)key;
//- (int32_t)decodeInt32ForKey:(NSString *)key;
//- (int64_t)decodeInt64ForKey:(NSString *)key;
//- (float)decodeFloatForKey:(NSString *)key;
//- (double)decodeDoubleForKey:(NSString *)key;
//- (nullable const uint8_t *)decodeBytesForKey:(NSString *)key returnedLength:(nullable NSUInteger *)lengthp NS_RETURNS_INNER_POINTER;

/*
#pragma mark - 自定义对象进行归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //把成员变量的值写入 coder 中
    Person *person = [[Person alloc] init];
    person.name = @"数据";
    person.email = @"qwe@123.com";
    person.phone = @"123456";
    person.sex = @"男";
    
    //新建二进制内容
    NSMutableData *data = [NSMutableData data];
    //设置二进制内存数据内容
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //加载内容
    [archiver encodeObject:person forKey:@"person"];
    [archiver finishEncoding];//进行编码
    //获取保存的文件名
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/person.archi"];
    //保存数据归档
    [data writeToFile:path atomically:YES];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    //从一个 coder 中读取数据,然后将数据赋值给成员变量
    //读取保存的文件名
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/person.archi"];
    //读取归档文件至内存
    NSData *data = [NSData dataWithContentsOfFile:path];
    //解码内存数据
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //对应赋值
    Person *person = [unarchiver decodeObjectForKey:@"person"];
    [unarchiver finishDecoding];
    NSLog(@"name:%@ --- email:%@ --- phone:%@ --- sex:%@", person.name, person.email, person.phone, person.sex);
    return self;
}

#pragma mark - 快速归档对象
//NSKeyedArchiver 归档方法
//+ (NSData *)archivedDataWithRootObject:(id)rootObject;
//+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;
//NSKeyedUnarchiver 解档方法
//+ (nullable id)unarchiveObjectWithData:(NSData *)data;
//+ (nullable id)unarchiveObjectWithFile:(NSString *)path;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
