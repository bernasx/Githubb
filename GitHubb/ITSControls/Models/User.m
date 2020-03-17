//
//  User.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        
        [self setUserLoginName:dict[@"login"]];
        [self setUserId:[dict[@"id"] intValue]];
        [self setUserUrl:dict[@"url"]];
        [self setUserAvatarUrl:dict[@"avatar_url"]];
        [self setUserFollowerUrl:dict[@"followers_url"]];
        
        NSString *followingUrl = [[NSString alloc] initWithString:dict[@"following_url"]];
        followingUrl = [followingUrl stringByReplacingOccurrencesOfString:@"{/other_user}" withString:@""];
        [self setUserFollowingUrl:followingUrl];
        
        [self setUserGistUrl:dict[@"gists_url"]];
        [self setUserStarredUrl:dict[@"starred_url"]];
        [self setUserSubscriptionsUrl:dict[@"subscriptions_url"]];
        [self setUserOrgUrl:dict[@"organizations_url"]];
        [self setUserReposUrl:dict[@"repos_url"]];
        [self setUserEventsUrl:dict[@"events_url"]];
        
    }
    return self;
}

- (instancetype)initWithDetailDict:(NSDictionary *)dict{
    
    self = [super init];
       if (self) {
    
           [self setUserLoginName:dict[@"login"]];
           [self setUserId:[dict[@"id"] intValue]];
           [self setUserUrl:dict[@"url"]];
           [self setUserAvatarUrl:dict[@"avatar_url"]];
           [self setUserFollowerUrl:dict[@"followers_url"]];
           
           NSString *followingUrl = [[NSString alloc] initWithString:dict[@"following_url"]];
           followingUrl = [followingUrl stringByReplacingOccurrencesOfString:@"{/other_user}" withString:@""];
           [self setUserFollowingUrl:followingUrl];
           
           [self setUserGistUrl:dict[@"gists_url"]];
           [self setUserStarredUrl:dict[@"starred_url"]];
           [self setUserSubscriptionsUrl:dict[@"subscriptions_url"]];
           [self setUserOrgUrl:dict[@"organizations_url"]];
           [self setUserReposUrl:dict[@"repos_url"]];
           [self setUserEventsUrl:dict[@"events_url"]];
           
           //only show up in userdetail
           [self setUserName:dict[@"name"]];
           [self setUserCompany:dict[@"company"]];
           [self setUserBlog:dict[@"blog"]];
           [self setUserEmail:dict[@"email"]];
           [self setUserLocation:dict[@"location"]];
           [self setUserBio:dict[@"bio"]];
        }
       return self;
    
}
@end
