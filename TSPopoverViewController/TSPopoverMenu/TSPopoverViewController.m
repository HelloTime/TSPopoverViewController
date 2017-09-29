//
//  TSPopoverViewController.m
//  CollectionView
//
//  Created by Ken on 2017/9/29.
//  Copyright © 2017年 Ken. All rights reserved.
//

#import "TSPopoverViewController.h"
#import "TSPopMenuTableViewCell.h"

#define CELL_HEIGHT 30


@interface TSPopoverViewController () <UIPopoverPresentationControllerDelegate>

@property (nonatomic, copy) NSArray <TSPopMenuModel *>*menuData;

@property (nonatomic, copy) void(^completion)(NSInteger);

@end

@implementation TSPopoverViewController

+ (instancetype)popWithBarButtonItem:(UIBarButtonItem *)barButtonItem contentWidth:(CGFloat)width menuData:(NSArray <TSPopMenuModel *>*)menuData permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections completion:(void(^)(NSInteger))completion {
    return [[TSPopoverViewController alloc] initWithBarButtonItem:barButtonItem contentWidth:width menuData:menuData permittedArrowDirections:permittedArrowDirections completion:completion];
}

+ (instancetype)popWithSourceView:(UIView *)view contentWidth:(CGFloat)width menuData:(NSArray <TSPopMenuModel *>*)menuData permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections completion:(void(^)(NSInteger))completion {
    return [[TSPopoverViewController alloc] initWithSourceView:view contentWidth:width menuData:menuData permittedArrowDirections:permittedArrowDirections completion:completion];
}

- (instancetype)initWithBarButtonItem:(UIBarButtonItem *)barButtonItem contentWidth:(CGFloat)width menuData:(NSArray <TSPopMenuModel *>*)menuData permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections completion:(void(^)(NSInteger))completion {
    if (self = [super init]) {
        self.completion = completion;
        self.menuData = menuData;
        // --设置过度样式
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        // --显示内容的size大小
        self.preferredContentSize = CGSizeMake(width, CELL_HEIGHT * menuData.count);
        
        UIPopoverPresentationController *popController = [self popoverPresentationController];
        // --展开时参照的barButtonItem
        popController.barButtonItem = barButtonItem;
        // --设置箭头的方向
        popController.permittedArrowDirections = permittedArrowDirections;
        popController.delegate = self;
    }
    return self;
}

- (instancetype)initWithSourceView:(UIView *)view contentWidth:(CGFloat)width menuData:(NSArray <TSPopMenuModel *>*)menuData permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections completion:(void(^)(NSInteger))completion {
    if (self = [super init]) {
        self.completion = completion;
        self.menuData = menuData;
        // --设置过度样式
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        // --显示内容的size大小
        self.preferredContentSize = CGSizeMake(width, CELL_HEIGHT * menuData.count);
        
        UIPopoverPresentationController *popController = [self popoverPresentationController];
        // --展开时参照的View
        popController.sourceView = view;
        popController.sourceRect = view.bounds;
        // --设置箭头的方向
        popController.permittedArrowDirections = permittedArrowDirections;
        popController.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = CELL_HEIGHT;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = false;
    self.tableView.bounces = false;
    [self.tableView registerClass:TSPopMenuTableViewCell.class forCellReuseIdentifier:NSStringFromClass(TSPopMenuTableViewCell.class)];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSPopMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TSPopMenuTableViewCell.class) forIndexPath:indexPath];
    TSPopMenuModel *menu = [self.menuData objectAtIndex:indexPath.row];
    cell.iconView.image = menu.icon;
    cell.titleLabel.text = menu.title;
    cell.lineView.backgroundColor = indexPath.row == self.menuData.count - 1 ? [UIColor clearColor] : [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.completion) {
            self.completion(indexPath.row);
            self.completion = nil;
        }
    }];
}


@end
