//
//  ITS_UserProfileViewModel.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITS_Repository.h"
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_UserProfileViewModel : NSObject
@property (nonatomic) User *user;
- (void) fetchUserWithUrl:(NSString *) url completion:(void(^)(User *user, NSString *error)) completion; //fetch user givenUrl
@end

NS_ASSUME_NONNULL_END
