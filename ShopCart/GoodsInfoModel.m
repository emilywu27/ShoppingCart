//
//  GoodsInfoModel.m
//  ShopCart
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodsInfoModel.h"

@implementation GoodsInfoModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.imageName = dict[@"imageName"];
        self.goodsTitle = dict[@"goodsTitle"];
        self.goodsPrice = dict[@"goodsPrice"];
        self.goodsNum = [dict[@"goodsNum"]integerValue];
        self.selectState = [dict[@"selectState"]boolValue];
        self.allNum=[dict[@"allNum"]integerValue];
        self.remainedNum=[dict[@"remainedNum"]integerValue];        
    }
    
    return  self;
}
@end
