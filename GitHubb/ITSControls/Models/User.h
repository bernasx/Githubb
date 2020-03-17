//
//  User.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (nonatomic) NSString *userLoginName;
@property (nonatomic) int userId;
@property (nonatomic) NSString *userUrl;
@property (nonatomic) NSString *userAvatarUrl;
@property (nonatomic) NSString *userFollowerUrl;
@property (nonatomic) NSString *userFollowingUrl;
@property (nonatomic) NSString *userGistUrl;
@property (nonatomic) NSString *userStarredUrl;
@property (nonatomic) NSString *userSubscriptionsUrl;
@property (nonatomic) NSString *userOrgUrl;
@property (nonatomic) NSString *userReposUrl;
@property (nonatomic) NSString *userEventsUrl;

//only show up in user detail
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *userCompany;
@property (nonatomic) NSString *userBlog;
@property (nonatomic) NSString *userLocation;
@property (nonatomic) NSString *userEmail;
@property (nonatomic) NSString *userBio;

- (instancetype)initWithDict:(NSDictionary *)dict;
- (instancetype)initWithDetailDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
