//
//  ITS_UserProfileViewModel.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_UserProfileViewModel.h"

@implementation ITS_UserProfileViewModel


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

@end
