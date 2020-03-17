//
//  ITS_UserProfileViewModel.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_UserProfileViewModel.h"

@implementation ITS_UserProfileViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.repoArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchUserWithUrl:(NSString *)url completion:(void (^)(User * _Nullable, NSString * _Nullable))completion{
    ITS_Repository *repository = [[ITS_Repository alloc] init];
    [repository fetchUserWithUrl:url completion:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if(error){
            completion(nil,[ITS_ServiceUtils checkStatusCode:error]);
        }else{
            User *user = [[User alloc] initWithDetailDict:responseObject];
            self.user = user;
        }
        completion(self.user,nil);
    }];
}

- (void)fetchReposWithUrl:(NSString *)url withPage:(int)page completion:(void (^)(NSArray * _Nullable, NSString * _Nullable))completion{
     ITS_Repository *repository = [[ITS_Repository alloc] init];
    [repository fetchReposWithUrl:url withPage:page completion:^(NSArray * _Nullable responseObject, NSError * _Nullable error) {
        if(error){
            completion(nil,[ITS_ServiceUtils checkStatusCode:error]);
        }else{
            NSMutableArray *repoArray = [NSMutableArray arrayWithArray:responseObject];
            for(NSDictionary *dict in repoArray){
                Repo *repo = [[Repo alloc] initWithDict:dict];
                [self.repoArray addObject:repo];
            }
            completion(self.repoArray,nil);
        }
    }];
}

@end
