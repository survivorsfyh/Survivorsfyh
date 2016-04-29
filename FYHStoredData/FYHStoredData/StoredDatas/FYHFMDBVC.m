//
//  FYHFMDBVC.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHFMDBVC.h"
#import "FYHFMDB.h"

@interface FYHFMDBVC ()

@end

@implementation FYHFMDBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createBaseFMDB];
    
    [self createFMDB];
}
- (void)createBaseFMDB {
    FYHFMDB *data = [[FYHFMDB alloc] init];
    
    [data createTable];
    
    [data dataInsert];
    [data dataDelete];
    [data dataChange];
    
    NSMutableArray *arr = [data dataSelect];
    NSLog(@"array --- %@", arr);
    for (FYHModel *model in arr) {
        NSLog(@"model.name --- %@", model.username);
    }
    
}

- (void)createFMDB {
    FYHFMDB *data = [[FYHFMDB alloc] init];
    


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
