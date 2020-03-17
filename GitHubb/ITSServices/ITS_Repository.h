//
//  ITS_Repository.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITS_ServiceManager.h"

NS_ASSUME_NONNULL_BEGIN
@interface ITS_Repository : NSObject
@property (nonatomic) ITS_ServiceManager *serviceManager;

- (void) fetchUsersWithPage:(int) page completion:(void(^)(NSArray *responseObject, NSError *error)) completion; //fetch users in page
- (void) fetchUserWithUrl:(NSString *) url completion:(void(^)(NSDictionary *responseObject, NSError *error)) completion; //fetch user givenUrl

-(void) fetchUserInfoWithUrl:(NSString *)url withPage:(int) page completion:(void(^)(NSArray *responseObject, NSError *error)) completion; //Fetch repos with url from user

@end

NS_ASSUME_NONNULL_END
