//
//  FYHAnalysisVC.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHAnalysisVC.h"

@interface FYHAnalysisVC () <NSXMLParserDelegate>

@end

@implementation FYHAnalysisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     JSON - XML 文件比较
     1.编码角度
        json 比 xml 文件编码简单,虽然两者都有各自编码工具,但即使不适用编码工具也可写出 json 文件, xml 则有难度!
        json 与 xml 都是基于文本,且使用的 Unicode 编码
     2.解析角度
        普通 web 应用领域,开发常用 xml 解析,无论客户端还是服务器解析 xml,都会导致代码复杂性,开发效率极低!
     3.可读性角度
        xml 有明显优势,易于人说明结构,而 json 更像一个数据块,对机器则相反
     */
    
    //XML
    [self createXml];
    //JSON
    [self createJson];
}
#pragma mark - XML
- (void)createXml {
    NSLog(@"*** *** xml 文件读写相关 *** ***");
    /*
     适合 web 传输,提供统一方法描述和交换独立于应用程序或供应商的结构化数据
     优点:格式统一,符合标准,容易与其它系统远程交互,数据共享较方便
     缺点:文件庞大,格式复杂,输出占带宽,解析复杂
     */
    
    //初始化
    //构建 XML 解析器
    NSData *data = [[NSData alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;//设置代理,工作交由代理完成
    BOOL isSuc = [parser parse];//开始工作,并实现代相关理方法
}
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始解析文档,解析器已待命啦!");
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"解析至某一节点");
    /*
        parser          解析器
        elementName     元素名称
        namespaceURI    空格
        attributeDict   合格名称
     */
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"获取收尾节点间内容");
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"解析完当前节点");
}
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"解析结束,解析元素为 root 时调用");
}
#pragma mark - JSON
- (void)createJson {
    NSLog(@"*** *** json 文件读写相关 *** ***");
    /*
     一种轻量级的数据交换格式,可将 json 文件结构理解为无序的,可嵌套 key-value 键值对,是以结构体或数组形式来组织
     优点:格式简单,易读写,格式为压缩的,占用带宽小,易于解析,数据读取方式简单,简化服务器与客户端代码使用
     缺点:没有 xml 通用性大
     */
    
#pragma mark - json 文件存储相关 ***
    //初始化
    //1.构建路径
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/jsonFile.json"];
    //设置 json 数据(根类型 Dic)
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //2.设置键值对
    //key-value ...
    [dic setValue:@"数据" forKey:@"name"];
    [dic setValue:@"20" forKey:@"MB"];
    [dic setValue:@"100min" forKey:@"time"];
    //3.使用对数据进行封包
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    //4.写入数据
    BOOL success = [jsonData writeToFile:path atomically:YES];
    NSLog(@"YES即成功 --- %d", success);
    
#pragma mark - json 文件读取相关 ***
    //注:读写未分开,雷同地方注释掉了,分开写需添上
    //1.获取 json 路径
//    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/jsonFile.json"];
    NSData *jsonData1 = [[NSData alloc] initWithContentsOfFile:path];
    //2.读取 JSON 数据
//    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData1 options:NSJSONReadingAllowFragments error:&error];
    //3.如果读取的是上一步存储的数据,即成功
    NSDictionary *deserializerdDic = (NSDictionary *)jsonObject;
    NSLog(@"deserializerdDic --- %@", deserializerdDic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
