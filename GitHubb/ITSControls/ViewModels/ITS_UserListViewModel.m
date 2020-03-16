//
//  ITS_UserListViewModel.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_UserListViewModel.h"

@implementation ITS_UserListViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchUsersWithPage:(int)page completion:(void (^)(NSArray * _Nullable, NSString * _Nullable))completion{
    ITS_Repository *repository = [[ITS_Repository alloc] init];
     [repository fetchUsersWithPage:page completion:^(NSArray * _Nullable responseObject, NSError * _Nullable error) {
          if(error){
              completion(nil,[ITS_ServiceUtils checkStatusCode:error]);
          }else{
              NSMutableArray *userArray = [NSMutableArray arrayWithArray:responseObject];
      
              for(NSDictionary *dict in userArray){
                 User *user = [[User alloc] initWithDict:dict];
                 [self.userArray addObject:user];
              }
          completion(self.userArray,nil);
         }
     }];
}

@end
