//
//  SFBHTTPClient.m
//  Fanbook
//
//  Created by DEV_TEAM1_IOS on 2016. 2. 25..
//  Copyright © 2016년 S.M Entertainment. All rights reserved.
//

#import "SFBHTTPClient.h"
#import "AFURLRequestSerialization.h"


#if DEBUG || INHOUSE
//NSString *const baseURL = @"https://apidev.fanbook.me";
NSString *const baseURL = @"https://api.fanbook.me";

#else
//NSString *const baseURL = @"https://apidev.fanbook.me";
NSString *const baseURL = @"https://api.fanbook.me";
#endif

@implementation SFBHTTPClient

- (instancetype)init
{
    if (self = [super initWithBaseURL:[NSURL URLWithString:@"https://apidev.fanbook.me"]]) {
        LogYellow(@"API BaseURL : %@",baseURL);
        
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
    }
    
    return self;
}

// 범용
- (void) callHttpAPIWithMethod:(NSString *) method
                            path:(NSString *) path
                            Parameters:(id)parameters
                            success:(void (^)(id result))success
                            failure:(void (^)(NSError *error))failure
{
    
    NSMutableDictionary *mutPar = (NSMutableDictionary *)parameters;
    if (mutPar){
        [mutPar setObject:@"2" forKey:@"deviceType"];
        [mutPar setObject:@"ko" forKey:@"lang" ];
        [mutPar setObject:@"1" forKey:@"version"];
    }
    
    if ([method isEqualToString:@"POST"]) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];

        [self requestPOST:path parameters:parameters success:success failure:failure];
    }
    else if ([method isEqualToString:@"GET"]) {
        [self requestGET:path parameters:parameters success:success failure:failure];
    }
    else if ([method isEqualToString:@"DELETE"])
    {
        [self requestDELETE:path parameters:parameters success:success failure:failure];
    }
}

- (void)searchAPIWithPath:(NSString *)path
                  parameters:(id)parameters
                  success:(void (^)(id result))success
                  failure:(void (^)(NSError *error))failure
{
    [self.operationQueue cancelAllOperations];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,path]];
    
    NSParameterAssert(url);
    
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc] initWithURL:url
                                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                   timeoutInterval:3.0f];
    mutableRequest.HTTPMethod = @"POST";
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    mutableRequest = [[self.requestSerializer requestBySerializingRequest:mutableRequest withParameters:parameters error:nil] mutableCopy];
    
    AFHTTPRequestOperation *operation = [self request:mutableRequest parameters:parameters success:success failure:failure];
    
    [self.operationQueue addOperation:operation];
    
    LogGreen(@"Request operation name : %@ totalCount : %zd",operation.name, self.operationQueue.operationCount);
}
@end
