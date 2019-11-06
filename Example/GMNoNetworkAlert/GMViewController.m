//
//  GMViewController.m
//  GMNoNetworkAlert
//
//  Created by ioszhanghui@163.com on 11/06/2019.
//  Copyright (c) 2019 ioszhanghui@163.com. All rights reserved.
//

#import "GMViewController.h"
#import "UIViewController+Network.h"

@interface GMViewController ()

@end

@implementation GMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.networkClickBlock = ^{
        NSLog(@"刷新网络");
    };
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
