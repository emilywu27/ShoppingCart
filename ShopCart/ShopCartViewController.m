//
//  ShopCartViewController.m
//  ShopCart
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopCartViewController.h"
#import "ShopCartCell.h"
#import "SC.pch"
#import "SettlementView.h"
#import "GoodsInfoModel.h"

#import "StatementViewController.h"
@interface ShopCartViewController ()<UITableViewDataSource,UITableViewDelegate,ShopCartCellDelegate>
@property(nonatomic,strong)UITableView *goodsTableView;
@property(nonatomic,strong)SettlementView *settlementView;
@property(nonatomic,assign)NSInteger allPrice;
@property(nonatomic,assign)NSInteger goodsNum;;
@property(nonatomic,strong)NSMutableArray *infoArr;;
@end
@implementation ShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [self setInfo];
    [self setGoodsTableView];
    [self setupSettlement];

}
-(void)setInfo{
    self.allPrice=0;
    self.goodsNum = 0;
    self.infoArr = [[NSMutableArray alloc]init];
    /**
     
     *  初始化一个数组，数组里面放字典。字典里面放的是单元格需要展示的数据
     
     */
    
    for (int i = 0; i<7; i++)
        
    {
        
        NSMutableDictionary *infoDict = [[NSMutableDictionary alloc]init];
        
        [infoDict setValue:@"4.png" forKey:@"imageName"];
        
        [infoDict setValue:@"这是商品标题" forKey:@"goodsTitle"];
        
//        [infoDict setValue:@"2000" forKey:@"goodsPrice"];
        
        [infoDict setValue:[NSNumber numberWithBool:NO] forKey:@"selectState"];
        
        [infoDict setValue:[NSNumber numberWithInt:1] forKey:@"goodsNum"];
        /*
         @property(assign,nonatomic)int allNum;
         
         @property(assign,nonatomic)int remainedNum;
         */
        [infoDict setValue:[NSNumber numberWithInt:1000] forKey:@"allNum"];
        [infoDict setValue:[NSNumber numberWithInt:999] forKey:@"remainedNum"];
        
        //封装数据模型
        GoodsInfoModel *goodsModel = [[GoodsInfoModel alloc]initWithDict:infoDict];
        
        //将数据模型放入数组中
        
        [self.infoArr addObject:goodsModel];
        
    }
}
-(void)setupSettlement{
    SettlementView *settlementView=[[SettlementView alloc]initWithFrame:CGRectMake(0, kScreen_Height-100, kScreen_Width, 60)];
    [settlementView.statementBtn addTarget:self action:@selector(goStatement) forControlEvents:UIControlEventTouchUpInside];
    
    [settlementView.allSelecteBtn addTarget:self action:@selector(goAllSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settlementView];
    self.settlementView=settlementView;
    
    
}
-(void)setGoodsTableView{
    UITableView *goodsTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-20)];//0, 44, kScreen_Width, kScreen_Height-20)
    [self.view addSubview:goodsTableView];
    goodsTableView.showsHorizontalScrollIndicator=NO;
    goodsTableView.showsVerticalScrollIndicator=NO;
//    goodsTableView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    goodsTableView.backgroundColor=[UIColor redColor];
    goodsTableView.delegate=self;
    goodsTableView.dataSource=self;
    [goodsTableView registerClass:[ShopCartCell class] forCellReuseIdentifier:@"SCCell"];
//    [goodsTableView registerNib:[UINib nibWithNibName:@"ShopCartTableCell" bundle:nil] forCellReuseIdentifier:@"SCCell"];
    goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.goodsTableView=goodsTableView;
}

#pragma mark-------
#pragma mark--------tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SCCell =  @"SCCell";
    ShopCartCell *cell=[tableView dequeueReusableCellWithIdentifier:SCCell forIndexPath:indexPath];
    if (!cell){
        cell=[[ShopCartCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:SCCell];
    }
    cell.delegate = self;
    [cell addTheValue:self.infoArr[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoArr.count;
}

#pragma mark -- 实现加减按钮点击代理事件
/**
 *  实现加减按钮点击代理事件
 *
 *  @param cell 当前单元格
 *  @param flag 按钮标识，11 为减按钮，12为加按钮
 */
-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag{
    NSIndexPath *index = [self.goodsTableView indexPathForCell:cell];
    switch (flag) {
        case 11:
        {
            //做减法
            //先获取到当期行数据源内容，改变数据源内容，刷新表格
            GoodsInfoModel *model = self.infoArr[index.row];
            if (model.goodsNum > 1)
            {
                model.goodsNum --;
                model.remainedNum++;
            }
           // [self.goodsTableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
            break;
        case 12:
        {
            //做加法
            GoodsInfoModel *model = self.infoArr[index.row];
            if (model.remainedNum>0) {
                model.remainedNum --;
                model.goodsNum++;
            }
            //[self.goodsTableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
            break;
        case 13:
        {    //先获取到当期行数据源内容，改变数据源内容，刷新表格
            GoodsInfoModel *model = self.infoArr[index.row];
            if (model.selectState)            {
                model.selectState = NO;
            }else {
                model.selectState = YES;

            }
            //刷新当前行
            //[self.goodsTableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        default:
            break;
    }
    //刷新表格
    [self.goodsTableView reloadData];
    
    //计算总价
    [self totalPrice];
    
}
#pragma mark -- 计算价格
-(void)totalPrice
{
    //遍历整个数据源，然后判断如果是选中的商品，就计算价格（单价 * 商品数量）
    for ( int i =0; i<self.infoArr.count; i++)    {
        GoodsInfoModel *model = [self.infoArr objectAtIndex:i];
        if (model.selectState)
        {
            self.allPrice +=  model.goodsNum ;//[model.goodsPrice intValue];
            self.goodsNum +=model.goodsNum;
        }
    }
    //给总价文本赋值
    self.settlementView.sumLab.text = [NSString stringWithFormat:@"%ld 元",(long)self.allPrice];
    self.settlementView.goodsNumLab.text=[NSString stringWithFormat:@"共计：%ld　件商品 ",(long)self.goodsNum];
    //每次算完要重置为0，因为每次的都是全部循环算一遍
    self.allPrice = 0;
    self.goodsNum = 0;
}
//结算
-(void)goStatement{
    NSInteger total=[self.settlementView.sumLab.text integerValue];
    if (total>0) {
        StatementViewController *statementVC=[[StatementViewController alloc]init];
        statementVC.price=total;
        [self.navigationController pushViewController:statementVC animated:YES];
        
    }
}
//全选
-(void)goAllSelect:(UIButton *)sender{
    //判断是否选中，是改成否，否改成是，改变图片状态
    sender.tag = !sender.tag;
    if (sender.tag)    {
        [sender setImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
        
    }else{
        [sender setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    }
    //改变单元格选中状态
    for (int i=0; i<self.infoArr.count; i++)
    {
        GoodsInfoModel *model = [self.infoArr objectAtIndex:i];
        model.selectState = sender.tag;
    }
    //计算价格
    [self totalPrice];
    //刷新表格
    [self.goodsTableView reloadData];

}
@end
