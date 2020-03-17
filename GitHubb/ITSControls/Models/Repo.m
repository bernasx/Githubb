//
//  Repo.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setRepoId:[dict[@"id"] intValue]];
        [self setRepoName:dict[@"name"]];
        [self setRepoFullName:dict[@"full_name"]];
        [self setRepoDescription:dict[@"description"]];
        [self setRepoUrl:dict[@"url"]];
        [self setRepoOwner:[[User alloc]initWithDict:dict[@"owner"]]];
    }
    return self;
}

@end
