//
//  ITS_RepoCollectionViewCell.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_RepoCollectionViewCell : UICollectionViewCell
@property (nonatomic) Repo *repo;
@property (weak, nonatomic) IBOutlet UIView *cellContentView;
@property (weak, nonatomic) IBOutlet UILabel *repoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *repoDescriptionLabel;

@end

NS_ASSUME_NONNULL_END
