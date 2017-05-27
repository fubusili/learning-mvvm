//
//  PublicCell.m
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "PublicCell.h"

@interface PublicCell ()
@property (strong, nonatomic) UILabel *userName;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UITextView *weiboText;
@end

@implementation PublicCell

#pragma Public methods
- (void)setValueWithDic:(PublicModel *)publicModel {
    _userName.text = publicModel.userName;
    _date.text = publicModel.date;
    _weiboText.text = publicModel.text;
    [_headImageView setImageWithURL:publicModel.imageUrl];
}

#pragma Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma Private method

- (void)setUpSubviews {
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.date];
    [self.contentView addSubview:self.weiboText];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma Setter and getter

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 15, 89, 84)];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImageView;
}

- (UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(115, 26, 217, 21)];
    }
    return _userName;
}

- (UILabel *)date {
    if (!_date) {
        _date = [[UILabel alloc] initWithFrame:CGRectMake(115, 65, 217, 21)];
    }
    return _date;
}

- (UITextView *)weiboText {
    if (!_weiboText) {
        _weiboText = [[UITextView alloc] initWithFrame:CGRectMake(30, 112, 291, 89)];
    }
    return _weiboText;
}

@end
