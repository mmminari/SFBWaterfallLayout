//
//  YHHTTPClient.m
//  SMMEMBERSHIP
//
//  Created by DEV_TEAM1_IOS on 2016. 2. 19..
//  Copyright © 2016년 S.M Entertainment. All rights reserved.
//

#import "YHHTTPClient.h"
#import "AFHTTPRequestOperation.h"


@implementation YHHTTPClient

- (AFHTTPRequestOperation *)request:(NSURLRequest *)request
                         parameters:(id)parameter
                            success:(void (^)(id result))success
                            failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject){
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

- (void)requestGET:(NSString *)urlString parameters:(id)parameter success:(void (^)(id result))success failure:(void (^)(NSError *error))failure
{
    [self GET:urlString parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (AFHTTPRequestOperation *)requestPOST:(NSString *)urlString parameters:(id)parameter success:(void (^)(id result))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperation *operation =[self POST:urlString parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

- (void)requestPUT:(NSString *)urlString
        parameters:(id)parameter
           success:(void (^)(id result))success
           failure:(void (^)(NSError *error))failure
{
    [self PUT:urlString parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)requestPATCH:(NSString *)urlString
          parameters:(id)parameter
             success:(void (^)(id result))success
             failure:(void (^)(NSError *error))failure
{
    [self PATCH:urlString parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)requestDELETE:(NSString *)urlString
           parameters:(id)parameter
              success:(void (^)(id result))success
              failure:(void (^)(NSError *error))failure
{
    [self DELETE:urlString parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)requestUploadTask:(NSString *)urlString
                     data:(NSData *)data
                 fileName:(NSString *)fileName
                  success:(void (^)(id result))success
                  failure:(void (^)(NSError *error))failure;
{
    NSURLRequest *request = nil;
    
    request = [self POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/png"];
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }
        
    }].request;
    
    AFURLSessionManager *sessionManager = nil;
    sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask = [sessionManager uploadTaskWithStreamedRequest:request
                                                                              progress:nil
                                                                     completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                                         
                                                                         
                                                                     }];
    
    [uploadTask resume];
}

@end
