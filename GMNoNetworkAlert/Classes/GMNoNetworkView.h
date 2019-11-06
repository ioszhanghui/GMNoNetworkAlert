//
//  GMNoNetworkView.h
//  GMNoNetworkAlert
//
//  Created by 小飞鸟 on 2019/11/06.
//

#import <UIKit/UIKit.h>

@protocol GMNoNetworkViewProtocol <NSObject>

@optional;
/*点击屏幕 重新加载*/
-(void)tapClickReload;

@end

NS_ASSUME_NONNULL_BEGIN

@interface GMNoNetworkView : UIView
/*配置 代理*/
@property(nonatomic,assign)id<GMNoNetworkViewProtocol>delegate;

@end

NS_ASSUME_NONNULL_END
