//
//  TSPopoverViewController.h
//  CollectionView
//
//  Created by Ken on 2017/9/29.
//  Copyright © 2017年 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSPopMenuTableViewCell.h"


@interface TSPopoverViewController : UITableViewController

/**
 根据导航栏BarButtonItem展开

 @param barButtonItem 导航栏按钮
 @param width 菜单宽度
 @param menuData 菜单资源
 @param permittedArrowDirections 箭头方向
 @param completion 点击回调
 @return TSPopoverViewController实例
 */
+ (instancetype)popWithBarButtonItem:(UIBarButtonItem *)barButtonItem contentWidth:(CGFloat)width menuData:(NSArray <TSPopMenuModel *>*)menuData permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections completion:(void(^)(NSInteger index))completion;

/**
 根据一般View展开

 @param view 点击的View
 @param width 菜单宽度
 @param menuData 菜单资源
 @param permittedArrowDirections 箭头方向
 @param completion 点击回调
 @return TSPopoverViewController实例
 */
+ (instancetype)popWithSourceView:(UIView *)view contentWidth:(CGFloat)width menuData:(NSArray <TSPopMenuModel *>*)menuData permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections completion:(void(^)(NSInteger index))completion;

@end
