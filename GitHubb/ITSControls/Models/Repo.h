//
//  Repo.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface Repo : NSObject

@property (nonatomic) int repoId;
@property (nonatomic) NSString * repoName;
@property (nonatomic) NSString *repoFullName;
@property (nonatomic) User *repoOwner;
@property (nonatomic) NSString *repoDescription;
//urls
@property (nonatomic) NSString *repoUrl;


- (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
