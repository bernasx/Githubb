//
//  ITS_ServiceUtils.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_ServiceUtils.h"

@implementation ITS_ServiceUtils

//Completes when it checks if you can reach a network
+(void)connectedCompletionBlock:(void(^)(BOOL connected))block {

[[AFNetworkReachabilityManager sharedManager] startMonitoring];
[[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

    BOOL con;
    NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    
    if(status == AFNetworkReachabilityStatusNotReachable){
        con = NO;
    }else{
        con = YES;
    }
    
    if (block) {
        [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
        block(con);
    }

}];
    
}

//Compares status codes and return an appropriate string
+ (NSString *)checkStatusCode:(NSError *) error{
    switch ([error code]) {
        case 42:
            return @"No internet!";
            break;
        case -1001:
            return @"Request timeout.";
        default:
            return @"Error";
            break;
    }
}



@end
