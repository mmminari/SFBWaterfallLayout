//
//  MainListModel.m
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainListModel.h"
#import "MainListData.h"


NSString *const kMainListModelMessage = @"message";
NSString *const kMainListModelData = @"data";
NSString *const kMainListModelCode = @"code";


@interface MainListModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainListModel


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.message = [self objectOrNilForKey:kMainListModelMessage fromDictionary:dict];
            self.data = [MainListData modelObjectWithDictionary:[dict objectForKey:kMainListModelData]];
            self.code = [[self objectOrNilForKey:kMainListModelCode fromDictionary:dict] integerValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kMainListModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMainListModelData];
    [mutableDict setValue:[NSNumber numberWithInteger:self.code] forKey:kMainListModelCode];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.message = [aDecoder decodeObjectForKey:kMainListModelMessage];
    self.data = [aDecoder decodeObjectForKey:kMainListModelData];
    self.code = [aDecoder decodeIntegerForKey:kMainListModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kMainListModelMessage];
    [aCoder encodeObject:_data forKey:kMainListModelData];
    [aCoder encodeInteger:_code forKey:kMainListModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainListModel *copy = [[MainListModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
