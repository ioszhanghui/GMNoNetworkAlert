//
//  GMNoNetworkView.m
//  GMNoNetworkAlert
//
//  Created by 小飞鸟 on 2019/11/06.
//

#import "GMNoNetworkView.h"

@interface GMNoNetworkView ()
/*网络状态按钮*/
@property(nonatomic,strong)UIImageView * networkImageView;
/*状态按钮*/
@property(nonatomic,strong)UILabel * statusLabel;
/*点击提示按钮*/
@property(nonatomic,strong)UILabel * clickLabel;

@end

@implementation GMNoNetworkView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
     
        [self addSuperView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.networkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(195*kWidthRatio);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(115*kWidthRatio);
        make.height.mas_equalTo(100*kWidthRatio);
    }];
    
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(self);
        make.height.mas_equalTo(20*kWidthRatio);
        make.left.mas_equalTo(0);
        make.top.equalTo(self.networkImageView.mas_bottom).offset(19*kWidthRatio);
    }];
    
    
    [self.clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(self);
        make.height.mas_equalTo(15*kWidthRatio);
        make.left.mas_equalTo(0);
        make.top.equalTo(self.statusLabel.mas_bottom).offset(15*kWidthRatio);
    }];
}


#pragma mark 添加 父视图
-(void)addSuperView{
    
    self.networkImageView = [[UIImageView alloc]init];
    [self addSubview:self.networkImageView];
    self.networkImageView.image = [UIImage imageNamed:@"networkerror"];
    
//    //网络提示的
    self.statusLabel = [[UILabel alloc]init];
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    self.statusLabel.textColor = RGB(163, 162, 164);
    self.statusLabel.font = [UIFont systemFontOfSize:15];
    self.statusLabel.text = @"抱歉，网络异常";
    [self addSubview:self.statusLabel];

    //点击重新 加载的
    self.clickLabel = [[UILabel alloc]init];
    self.clickLabel.textAlignment = NSTextAlignmentCenter;
    self.clickLabel.textColor = RGB(43, 127, 242);
    self.clickLabel.font = [UIFont systemFontOfSize:15];
    self.clickLabel.text = @"点击屏幕 重新加载";
    [self addSubview:self.clickLabel];
    
    [self layoutIfNeeded];
    
    [self setNeedsDisplay];
    

    UIControl * ct = [[UIControl alloc]initWithFrame:self.bounds];
    [ct addTarget:self action:@selector(clickScren) forControlEvents:UIControlEventTouchDown];
    [self addSubview:ct];
}

#pragma mark 点击屏幕
-(void)clickScren{
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(tapClickReload)]) {
        [self.delegate tapClickReload];
    }
}

@end
