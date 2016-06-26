//
//  StatementViewController.m
//  ShopCart
//
//  Created by mac on 16/6/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "StatementViewController.h"
#import "SC.pch"
@interface StatementViewController ()
@end

@implementation StatementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *allPrice=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 160)];
    allPrice.text= [NSString stringWithFormat:@"-----%ld-------",(long)self.price];
    [self.view addSubview:allPrice];
    
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
