//
//  ITS_ServiceUtils.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
NS_ASSUME_NONNULL_BEGIN

@interface ITS_ServiceUtils : NSObject

+ (void)connectedCompletionBlock:(void(^)(BOOL connected))block;
+ (NSString *)checkStatusCode:(NSError *) error;

@end

NS_ASSUME_NONNULL_END
