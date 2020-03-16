//
//  ITS_UserListViewModel.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITS_Repository.h"
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_UserListViewModel : NSObject
@property (nonatomic) NSMutableArray *userArray;
- (void) fetchUsersWithPage:(int) page completion:(void(^)(NSArray *userArray, NSString *error)) completion; //fetch users in page
@end

NS_ASSUME_NONNULL_END
