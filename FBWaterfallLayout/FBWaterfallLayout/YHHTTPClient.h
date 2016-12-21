//
//  YHHTTPClient.h
//  SMMEMBERSHIP
//
//  Created by DEV_TEAM1_IOS on 2016. 2. 19..
//  Copyright © 2016년 S.M Entertainment. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface YHHTTPClient : AFHTTPRequestOperationManager

- (AFHTTPRequestOperation *)request:(NSURLRequest *)request
                         parameters:(id)parameter
                            success:(void (^)(id result))success
                            failure:(void (^)(NSError *error))failure;

- (void)requestGET:(NSString *)urlString
        parameters:(id)parameter
           success:(void (^)(id result))success
           failure:(void (^)(NSError *error))failure;

- (AFHTTPRequestOperation *)requestPOST:(NSString *)urlString
         parameters:(id)parameter
            success:(void (^)(id result))success
            failure:(void (^)(NSError *error))failure;

- (void)requestPUT:(NSString *)urlString
        parameters:(id)parameter
           success:(void (^)(id result))success
           failure:(void (^)(NSError *error))failure;

- (void)requestPATCH:(NSString *)urlString
          parameters:(id)parameter
             success:(void (^)(id result))success
             failure:(void (^)(NSError *error))failure;

- (void)requestDELETE:(NSString *)urlString
           parameters:(id)parameter
              success:(void (^)(id result))success
              failure:(void (^)(NSError *error))failure;

- (void)requestUploadTask:(NSString *)urlString
                     data:(NSData *)data
                 fileName:(NSString *)fileName
                  success:(void (^)(id result))success
                  failure:(void (^)(NSError *error))failure;

@end
