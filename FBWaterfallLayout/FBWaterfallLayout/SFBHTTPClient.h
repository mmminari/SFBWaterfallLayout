//
//  SFBHTTPClient.h
//  Fanbook
//
//  Created by DEV_TEAM1_IOS on 2016. 2. 25..
//  Copyright © 2016년 S.M Entertainment. All rights reserved.
//

#import "YHHTTPClient.h"

@interface SFBHTTPClient : YHHTTPClient

// 범용
- (void) callHttpAPIWithMethod:(NSString *) method
                            path:(NSString *) path
                            Parameters:(id)parameters
                            success:(void (^)(id result))success
                            failure:(void (^)(NSError *error))failure;

- (void)searchAPIWithPath:(NSString *)path
               parameters:(id)parameters
                  success:(void (^)(id result))success
                  failure:(void (^)(NSError *error))failure;
@end
