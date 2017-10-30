//
//  WDTestController.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDTestController.h"
#import "WDTestNavigationHeader.h"

@interface WDTestController ()

@end

@implementation WDTestController


- (void)viewDidLoad {
    
    self.title = @"Title";
    
    self.view.backgroundColor = [UIColor randomColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
}

- (void)didTapNextButton {
    
    WDTestController * vc = [[WDTestController alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}
@end
