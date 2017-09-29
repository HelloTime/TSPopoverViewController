//
//  TSPopMenuTableViewCell.h
//  CollectionView
//
//  Created by Ken on 2017/9/29.
//  Copyright © 2017年 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSPopMenuModel : NSObject

@property (nonatomic, strong) UIImage *icon;

@property (nonatomic, copy) NSString *title;

-(instancetype)initWithIcon:(UIImage *)icon title:(NSString *)title;

@end

@interface TSPopMenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *lineView;

@end
