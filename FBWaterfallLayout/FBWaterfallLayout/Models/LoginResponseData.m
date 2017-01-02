//
//  Data.m
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginResponseData.h"
#import "User.h"


NSString *const kDataUser = @"User";


@interface LoginResponseData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginResponseData



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
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kDataUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kDataUser];

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

    self.user = [aDecoder decodeObjectForKey:kDataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_user forKey:kDataUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginResponseData *copy = [[LoginResponseData alloc] init];
    
    if (copy) {

        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
