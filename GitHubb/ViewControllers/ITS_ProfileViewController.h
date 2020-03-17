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

NS_ASSUME_NONNULL_BEGIN

@interface ITS_ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;
@property (weak, nonatomic) IBOutlet UIView *topContainerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (nonatomic) ITS_UserProfileViewModel *viewModel;
@property (nonatomic) UIActivityIndicatorView * spinner;
@property (nonatomic) NSString *stringUrl;
@property (nonatomic) User *user;
- (void)fetchData;
- (void)showAlert: (NSString *) alertMsg;
- (void)spinnerAnimate;
- (void)configView;
@end

NS_ASSUME_NONNULL_END
