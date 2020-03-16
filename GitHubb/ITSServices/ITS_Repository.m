//
//  ITS_Repository.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_Repository.h"
@implementation ITS_Repository
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.serviceManager = [[ITS_ServiceManager alloc] init];
    }
    return self;
}

- (void)fetchUsersWithPage:(int)page completion:(void (^)(NSArray * _Nullable, NSError * _Nullable))completion{
    NSString *path = @"/users";
    NSString *method = @"GET";
    
    NSDictionary *parameters = @{@"since":[[NSString alloc] initWithFormat:@"%i",page]
                                };
                                      
       self.serviceManager.url = [NSURL URLWithString:path relativeToURL: self.serviceManager.url];
       

       [self.serviceManager setRequestWithParameters:parameters withMethod:method];
       self.serviceManager.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
       [self.serviceManager fetchData:^(NSArray * _Nullable responseObject, NSError * _Nullable error) {
           completion(responseObject, error);
       }];
}

@end
