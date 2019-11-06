//
//  GMNetworkManager.h
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GMNetworkManager : NSObject

@property(nonatomic,class,readonly)GMNetworkManager * shareNetworkManager;
/*是否有网*/
@property(nonatomic,assign)BOOL availableNetwork;
/*开启网络监控 通知发送*/
+(void)startNetworkNotifier;

@end

NS_ASSUME_NONNULL_END
