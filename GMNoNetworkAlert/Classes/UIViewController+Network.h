//
//  UIScrollView+Network.h
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/11/06.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


/*点击无网 回调*/
typedef void(^NetWorkClickBlock)(void);

@class GMNoNetworkView;


NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Network)

/*无网的提示View*/
@property(nonatomic,strong) GMNoNetworkView * networkView;
/*无网状态的 点击回调*/
@property(nonatomic,copy) NetWorkClickBlock networkClickBlock;


/*显示 无网络状态占位*/
-(void)showNetWorkAlert;
/*隐藏网络占位 展示图*/
-(void)hiddenNetworkAlert;
/*添加 白名单*/
+(void)addViewControllerWhiteList:(NSArray*)whiteList;

@end

NS_ASSUME_NONNULL_END
