//
//  GoodsInfoModel.h
//  ShopCart
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsInfoModel : NSObject
@property(strong,nonatomic)NSString *imageName;//商品图片

@property(strong,nonatomic)NSString *goodsTitle;//商品标题

@property(strong,nonatomic)NSString *goodsPrice;//商品单价

@property(assign,nonatomic)BOOL selectState;//是否选中状态

@property(assign,nonatomic)NSInteger goodsNum;//商品个数

@property(assign,nonatomic)NSInteger allNum;

@property(assign,nonatomic)NSInteger remainedNum;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
/**
 @property (nonatomic,strong) UIView *mainView;
 @property (nonatomic,strong) UIButton *selectBtn;
 @property (nonatomic,strong) UIImageView *goodsImg;
 @property (nonatomic,strong) UILabel *introductionLab;
 @property (nonatomic,strong) UILabel *needLab;
 @property (nonatomic,strong) UILabel *needNumLab;
 @property (nonatomic,strong) UILabel *remainedLab;
 @property (nonatomic,strong) UILabel *remianedNumLab;
 @property (nonatomic,strong) UIButton *addBtn;
 @property (nonatomic,strong) UITextField *goodsNumTF;
 @property (nonatomic,strong) UIButton *minusBtn;
 @property (nonatomic,strong) UILabel *winLab;
 @property (nonatomic,strong) UILabel *winNumLab;
 */