//
//  ITS_ProfileViewController.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITS_UserProfileViewModel.h"
#import "User.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ITS_RepoCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_ProfileViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;
@property (weak, nonatomic) IBOutlet UIView *topContainerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *repoCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *followerTableView;
@property (weak, nonatomic) IBOutlet UITableView *followingTableView;

@property (nonatomic) ITS_UserProfileViewModel *viewModel;
@property (nonatomic) UIActivityIndicatorView * spinner;
@property (nonatomic) NSString *stringUrl;
@property (nonatomic) User *user;

@property (nonatomic) int currentRepoPage;
@property (nonatomic) NSArray *repoArray;
@property (nonatomic) int currentFollowerPage;
@property (nonatomic) NSArray *followerArray;
@property (nonatomic) int currentFollowingPage;
@property (nonatomic) NSArray *followingArray;

- (void)fetchUserData;
- (void)fetchRepoData;
- (void)fetchFollowingData;
- (void)fetchFollowerData;

- (void)showAlert: (NSString *) alertMsg;
- (void)spinnerAnimate;
- (void)configView;
@end

NS_ASSUME_NONNULL_END
