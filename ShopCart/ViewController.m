//
//  ViewController.m
//  ShopCart
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "ShopCartViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainViewController * mainVC=[[MainViewController alloc]init];
    mainVC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"explor"] selectedImage:[UIImage imageNamed:@"explor"]];
    UINavigationController * mainNav=[[UINavigationController alloc]initWithRootViewController:mainVC];
    
    ShopCartViewController * shopCartVC=[[ShopCartViewController alloc]init];
    shopCartVC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"购物车" image:[UIImage imageNamed:@"find"] selectedImage:[UIImage imageNamed:@"find"]];
    UINavigationController * shopCartNav=[[UINavigationController alloc]initWithRootViewController:shopCartVC];
    
    UITabBarController * tab=[[UITabBarController alloc]init];
    tab.tabBar.tintColor=[UIColor redColor];//tabBar默认颜色
  
    tab.viewControllers=@[mainNav,shopCartNav];
    
    
    UIWindow * window=[UIApplication sharedApplication].delegate.window;
    window.rootViewController=tab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
