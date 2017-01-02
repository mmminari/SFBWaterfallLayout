//
//  Data.h
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainListData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, strong) NSArray *responseArtWork;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
