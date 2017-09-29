//
//  ViewController.m
//  TSPopoverViewController
//
//  Created by Ken on 2017/9/29.
//  Copyright © 2017年 Ken. All rights reserved.
//

#import "ViewController.h"
#import "TSPopoverViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSArray <TSPopMenuModel *>*menuData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)rightItemAction:(UIBarButtonItem *)sender {
    [self presentViewController:[TSPopoverViewController popWithBarButtonItem:self.navigationItem.rightBarButtonItem contentWidth:100 menuData:self.menuData permittedArrowDirections:UIPopoverArrowDirectionUp completion:^(NSInteger index) {
        NSLog(@"点击了第%ld行",index);
    }] animated:YES completion:nil];
}
- (IBAction)menuAction1:(UIButton *)sender {
    [self presentViewController:[TSPopoverViewController popWithSourceView:sender contentWidth:100 menuData:self.menuData permittedArrowDirections:UIPopoverArrowDirectionDown completion:^(NSInteger index) {
        NSLog(@"点击了第%ld行",index);
    }] animated:YES completion:nil];
}
- (IBAction)menuAction2:(UIButton *)sender {
    [self presentViewController:[TSPopoverViewController popWithSourceView:sender contentWidth:100 menuData:self.menuData permittedArrowDirections:UIPopoverArrowDirectionRight completion:^(NSInteger index) {
        NSLog(@"点击了第%ld行",index);
    }] animated:YES completion:nil];
}
- (IBAction)menuAction3:(UIButton *)sender {
    [self presentViewController:[TSPopoverViewController popWithSourceView:sender contentWidth:100 menuData:self.menuData permittedArrowDirections:UIPopoverArrowDirectionUp completion:^(NSInteger index) {
        NSLog(@"点击了第%ld行",index);
    }] animated:YES completion:nil];
}

- (NSArray<TSPopMenuModel *> *)menuData {
    if (!_menuData) {
        _menuData = @[
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"default"] title:@"分类查找"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"new"] title:@"热门话题"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"time"] title:@"时间分类"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"distance"] title:@"我的位置"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"default"] title:@"分类查找"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"new"] title:@"热门话题"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"time"] title:@"时间分类"],
                              [[TSPopMenuModel alloc] initWithIcon:[UIImage imageNamed:@"distance"] title:@"我的位置"],
                              ].copy;
    }
    return _menuData;
}

@end
