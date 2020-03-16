//
//  ITS_ServiceManager.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_ServiceManager.h"

@implementation ITS_ServiceManager

NSString * const urlConst = @"https://api.github.com/";

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.url = [NSURL URLWithString:urlConst];
        self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:self.configuration];
    }
    return self;
}

//custom setter with parameter and method
- (void)setRequestWithParameters:(NSDictionary *) parameters withMethod: (NSString *) method{
    self.request = [[AFHTTPRequestSerializer serializer] requestWithMethod:method URLString: self.url.absoluteString parameters:parameters error:nil];
    NSLog(self.request.URL.absoluteString);
}




- (void)fetchData:(void (^)(id  _Nullable responseObject, NSError *error))completion{

    [ITS_ServiceUtils connectedCompletionBlock:^(BOOL connected) {
        
        if(connected){
            NSURLSessionDataTask *afDataTask = [self.manager dataTaskWithRequest:self.request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
                NSLog(@"Upload Progress = %@" ,uploadProgress);
            } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"Download Progress = %@" ,downloadProgress);
            } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                if(error){
                    self.url = [NSURL URLWithString:urlConst]; //reset to default url
                    completion(nil,error);
                }else{
                    self.url = [NSURL URLWithString:urlConst]; //reset to default url
                    completion(responseObject, nil);
                }
            }];
            
            [afDataTask resume];
        }else{
            NSError * noInternetError = [NSError errorWithDomain:@"com.its.githubb" code:42 userInfo:@{@"Error reason": @"No internet"}];
            completion(nil,noInternetError);
        }
        
    }];
    
}
@end
