//
//  ITS_UserListTableViewController.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITS_UserListTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ITS_UserListViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_UserListTableViewController : UITableViewController
@property (nonatomic) ITS_UserListViewModel *viewModel;
@property (nonatomic) NSArray *userArray;
@property (nonatomic) UIActivityIndicatorView * spinner;
@property (nonatomic) int currentPage;

- (void)fetchData;
- (void)showAlert: (NSString *) alertMsg;
- (void)spinnerAnimate;
- (void)dismissKeyboard;
@end

NS_ASSUME_NONNULL_END
