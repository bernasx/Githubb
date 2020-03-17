//
//  ITS_RepoCollectionViewCell.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_RepoCollectionViewCell.h"

@implementation ITS_RepoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews{
    [self.cellContentView setClipsToBounds:YES];
    [self.cellContentView.layer setCornerRadius:10];
   
}

@end
