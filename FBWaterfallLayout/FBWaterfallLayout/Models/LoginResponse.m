//
//  LoginResponse.m
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginResponse.h"
#import "LoginResponseData.h"


NSString *const kLoginResponseMessage = @"message";
NSString *const kLoginResponseData = @"data";
NSString *const kLoginResponseCode = @"code";


@interface LoginResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginResponse


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
            self.message = [self objectOrNilForKey:kLoginResponseMessage fromDictionary:dict];
            self.data = [LoginResponseData modelObjectWithDictionary:[dict objectForKey:kLoginResponseData]];
            self.code = [[self objectOrNilForKey:kLoginResponseCode fromDictionary:dict] integerValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kLoginResponseMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kLoginResponseData];
    [mutableDict setValue:[NSNumber numberWithInteger:self.code] forKey:kLoginResponseCode];

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

    self.message = [aDecoder decodeObjectForKey:kLoginResponseMessage];
    self.data = [aDecoder decodeObjectForKey:kLoginResponseData];
    self.code = [aDecoder decodeIntegerForKey:kLoginResponseCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kLoginResponseMessage];
    [aCoder encodeObject:_data forKey:kLoginResponseData];
    [aCoder encodeInteger:_code forKey:kLoginResponseCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginResponse *copy = [[LoginResponse alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
