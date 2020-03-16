//
//  ITS_ServiceManager.h
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ITS_ServiceUtils.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_ServiceManager : NSObject

@property (nonatomic) NSURLSessionConfiguration *configuration;
@property (nonatomic) AFURLSessionManager *manager;
@property (nonatomic) NSURLRequest *request;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSString *method;

- (void)setRequestWithParameters:(NSDictionary *) parameters withMethod: (NSString *) method;
- (void) fetchData:(void (^)(id responseObject, NSError *error)) completion;

@end

NS_ASSUME_NONNULL_END
