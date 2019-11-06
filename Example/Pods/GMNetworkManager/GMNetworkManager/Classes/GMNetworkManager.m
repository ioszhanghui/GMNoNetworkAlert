//
//  GMNetworkManager.m
//  FBSnapshotTestCase
//
//  Created by 小飞鸟 on 2019/10/14.
//

#import "GMNetworkManager.h"
#import "Reachability.h"


@interface GMNetworkManager ()
@property(nonatomic,strong)Reachability * reachability;

@end


@implementation GMNetworkManager

-(instancetype)init{
    if (self=[super init]) {
        _reachability = [Reachability reachabilityForInternetConnection];
    }
    return self;
}

/*开启网络监控 通知发送*/
+(void)startNetworkNotifier{
    
    GMNetworkManager * manager = [GMNetworkManager shareNetworkManager];
    [[NSNotificationCenter defaultCenter]addObserver:manager
                                            selector:@selector(networkChange:) name:kReachabilityChangedNotification object:nil];
    
    // 开始监控网络(一旦网络状态发生改变, 就会发出通知kReachabilityChangedNotification)
    [manager.reachability startNotifier];
}

#pragma mark 网络环境变化
-(void)networkChange:(NSNotification*)noti{
    
    BOOL available = [self availableNetwork];
    self.availableNetwork = available;
}

+(GMNetworkManager *)shareNetworkManager{
    
    static dispatch_once_t onceToken;
    static GMNetworkManager * networkManager;
    dispatch_once(&onceToken, ^{
        networkManager = [GMNetworkManager new];
    });
    return networkManager;
}

-(BOOL)availableNetwork{
    
    //是否连接WiFi
  Reachability * wifiReachability =  [Reachability reachabilityForLocalWiFi];
  Reachability *  internetReachability = [Reachability reachabilityForInternetConnection];
    
    if ([wifiReachability currentReachabilityStatus]!=NotReachable) {
        return YES;
    }
    if ([internetReachability currentReachabilityStatus]!=NotReachable) {
        return YES;
    }
    return NO;
}

-(void)dealloc{
    //结束监听
    [self.reachability stopNotifier];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
