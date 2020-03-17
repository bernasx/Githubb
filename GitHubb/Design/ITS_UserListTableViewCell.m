//
//  ITS_UserListTableViewCell.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_UserListTableViewCell.h"
@implementation ITS_UserListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [self.userImageView setClipsToBounds:YES];
    [self.userImageView.layer setCornerRadius:10];
}


@end
