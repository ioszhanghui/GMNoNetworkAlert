//
//  UIScrollView+Network.m
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/11/06.
//

#import "UIViewController+Network.h"
#import <objc/runtime.h>
#import "GMNoNetworkView.h"

@interface UIViewController ()<GMNoNetworkViewProtocol>

@end

@interface GMWhiteList : NSObject
/*白名单数据*/
@property(nonatomic,strong)NSMutableArray * whiteList;
/*白名单*/
@property(nonatomic,class,readonly)GMWhiteList * shareWhiteList;

@end


@implementation GMWhiteList

+(GMWhiteList *)shareWhiteList{
    
    static dispatch_once_t onceToken;
   static GMWhiteList * whiteList = nil;
    dispatch_once(&onceToken, ^{
        whiteList = [GMWhiteList new];
    });
    return whiteList;
}

-(NSMutableArray *)whiteList{
    if (!_whiteList) {
        _whiteList = [NSMutableArray array];
    }
    return _whiteList;
}
@end


static const void * _Nonnull  networkView = &networkView; //无网的提示View
static const void * _Nonnull  networkBlockClick = &networkBlockClick; //无网的提示View

@implementation UIViewController (Network)

/*添加 白名单*/
+(void)addViewControllerWhiteList:(NSArray*)whiteList{
    
    if (whiteList) {
        [[GMWhiteList shareWhiteList].whiteList addObjectsFromArray:whiteList];
    }
}

-(void)tapClickReload{
    
    if (self.networkClickBlock) {
        self.networkClickBlock();
    }
}

/*显示 无网络状态占位*/
-(void)showNetWorkAlert{
    
    if ([self isWhiteList]) {
        //如果是 白名单 不再添加
        return;
    }
    if ([GMNetworkManager shareNetworkManager].availableNetwork) {
        //有网络时
        return;
    }
    //获取当前的网络展示占位
    GMNoNetworkView * networkView = [self networkView];
    if (networkView&&[networkView superview]) {
        //如果当前的 网络占位图 已经添加了 打开隐藏
        networkView.hidden = NO;
        return;
    }
    
    networkView = [[GMNoNetworkView alloc]initWithFrame:self.view.bounds];
    [self setNetworkView:networkView];
        
    networkView.delegate = self;
    [self.view addSubview:networkView];
    
    [networkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

/*当前类 是否是 白名单*/
-(BOOL)isWhiteList{
    
    NSString * className = NSStringFromClass([self class]);
    if ([[GMWhiteList shareWhiteList].whiteList containsObject:className]) {
        return YES;
    }
    return NO;
}

/*隐藏网络占位 展示图*/
-(void)hiddenNetworkAlert{
    
    if ([self isWhiteList]) {
        //如果是 白名单 直接 return  白名单 不会添加 无网占位图
        
        return;
    }
    if (![GMNetworkManager shareNetworkManager].availableNetwork) {
        //无网络时  不再执行 隐藏
        return;
    }
    
     GMNoNetworkView * networkView = [self networkView];
    if (networkView) {
        networkView.hidden = YES;
    }    
}

-(void)setNetworkClickBlock:(NetWorkClickBlock)networkClickBlock{
    objc_setAssociatedObject(self, networkBlockClick,networkClickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)setNetworkView:(GMNoNetworkView *)NetWorkView{
    objc_setAssociatedObject(self, networkView,NetWorkView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NetWorkClickBlock)networkClickBlock{
     return objc_getAssociatedObject(self, networkBlockClick);
}

-(GMNoNetworkView *)networkView{
    return objc_getAssociatedObject(self, networkView);
}

@end
