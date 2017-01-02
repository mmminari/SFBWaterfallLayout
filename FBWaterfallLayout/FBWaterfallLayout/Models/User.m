//
//  User.m
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "User.h"


NSString *const kUserUserJoinType = @"userJoinType";
NSString *const kUserUserNation = @"userNation";
NSString *const kUserIsBlockUserPhoto = @"isBlockUserPhoto";
NSString *const kUserIsMailling = @"isMailling";
NSString *const kUserAgreeTerms = @"agreeTerms";
NSString *const kUserSkinText = @"skinText";
NSString *const kUserUserLevel = @"userLevel";
NSString *const kUserUserPhoto = @"userPhoto";
NSString *const kUserUserCellPhoneCountryCode = @"userCellPhoneCountryCode";
NSString *const kUserBlockUserPhoto = @"blockUserPhoto";
NSString *const kUserUserNick = @"userNick";
NSString *const kUserUserCellPhone = @"userCellPhone";
NSString *const kUserUserUUID = @"userUUID";
NSString *const kUserLang = @"lang";
NSString *const kUserUserBirthDay = @"userBirthDay";
NSString *const kUserUserTimeZone = @"userTimeZone";
NSString *const kUserAuthorRequest = @"authorRequest";
NSString *const kUserUserAcceessToken = @"userAcceessToken";
NSString *const kUserFanbookUrl = @"fanbookUrl";
NSString *const kUserUserSns = @"userSns";
NSString *const kUserIsActive = @"isActive";
NSString *const kUserLatestLoginDate = @"latestLoginDate";
NSString *const kUserUserDeviceUUID = @"userDeviceUUID";
NSString *const kUserUserLanguage = @"userLanguage";
NSString *const kUserDeviceType = @"deviceType";
NSString *const kUserCreateDate = @"createDate";
NSString *const kUserUserID = @"userID";
NSString *const kUserUserGender = @"userGender";
NSString *const kUserUserTitle = @"userTitle";
NSString *const kUserModifyDate = @"modifyDate";
NSString *const kUserUserTel = @"userTel";
NSString *const kUserBirthMM = @"birthMM";
NSString *const kUserIsActiveDate = @"isActiveDate";
NSString *const kUserAgreeService = @"agreeService";
NSString *const kUserUserRePassword = @"userRePassword";
NSString *const kUserUserIdx = @"userIdx";
NSString *const kUserUserNameFirst = @"userNameFirst";
NSString *const kUserUserName = @"userName";
NSString *const kUserIsActiveDesc = @"isActiveDesc";
NSString *const kUserBirthYY = @"birthYY";
NSString *const kUserBirthDD = @"birthDD";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

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
            self.userJoinType = [self objectOrNilForKey:kUserUserJoinType fromDictionary:dict];
            self.userNation = [self objectOrNilForKey:kUserUserNation fromDictionary:dict];
            self.isBlockUserPhoto = [[self objectOrNilForKey:kUserIsBlockUserPhoto fromDictionary:dict] boolValue];
            self.isMailling = [self objectOrNilForKey:kUserIsMailling fromDictionary:dict];
            self.agreeTerms = [self objectOrNilForKey:kUserAgreeTerms fromDictionary:dict];
            self.skinText = [self objectOrNilForKey:kUserSkinText fromDictionary:dict];
            self.userLevel = [self objectOrNilForKey:kUserUserLevel fromDictionary:dict];
            self.userPhoto = [self objectOrNilForKey:kUserUserPhoto fromDictionary:dict];
            self.userCellPhoneCountryCode = [self objectOrNilForKey:kUserUserCellPhoneCountryCode fromDictionary:dict];
            self.blockUserPhoto = [[self objectOrNilForKey:kUserBlockUserPhoto fromDictionary:dict] boolValue];
            self.userNick = [self objectOrNilForKey:kUserUserNick fromDictionary:dict];
            self.userCellPhone = [self objectOrNilForKey:kUserUserCellPhone fromDictionary:dict];
            self.userUUID = [self objectOrNilForKey:kUserUserUUID fromDictionary:dict];
            self.lang = [self objectOrNilForKey:kUserLang fromDictionary:dict];
            self.userBirthDay = [self objectOrNilForKey:kUserUserBirthDay fromDictionary:dict];
            self.userTimeZone = [self objectOrNilForKey:kUserUserTimeZone fromDictionary:dict];
            self.authorRequest = [[self objectOrNilForKey:kUserAuthorRequest fromDictionary:dict] doubleValue];
            self.userAcceessToken = [self objectOrNilForKey:kUserUserAcceessToken fromDictionary:dict];
            self.fanbookUrl = [self objectOrNilForKey:kUserFanbookUrl fromDictionary:dict];
            self.userSns = [self objectOrNilForKey:kUserUserSns fromDictionary:dict];
            self.isActive = [self objectOrNilForKey:kUserIsActive fromDictionary:dict];
            self.latestLoginDate = [[self objectOrNilForKey:kUserLatestLoginDate fromDictionary:dict] doubleValue];
            self.userDeviceUUID = [self objectOrNilForKey:kUserUserDeviceUUID fromDictionary:dict];
            self.userLanguage = [self objectOrNilForKey:kUserUserLanguage fromDictionary:dict];
            self.deviceType = [[self objectOrNilForKey:kUserDeviceType fromDictionary:dict] doubleValue];
            self.createDate = [self objectOrNilForKey:kUserCreateDate fromDictionary:dict];
            self.userID = [self objectOrNilForKey:kUserUserID fromDictionary:dict];
            self.userGender = [self objectOrNilForKey:kUserUserGender fromDictionary:dict];
            self.userTitle = [self objectOrNilForKey:kUserUserTitle fromDictionary:dict];
            self.modifyDate = [self objectOrNilForKey:kUserModifyDate fromDictionary:dict];
            self.userTel = [self objectOrNilForKey:kUserUserTel fromDictionary:dict];
            self.birthMM = [self objectOrNilForKey:kUserBirthMM fromDictionary:dict];
            self.isActiveDate = [[self objectOrNilForKey:kUserIsActiveDate fromDictionary:dict] doubleValue];
            self.agreeService = [self objectOrNilForKey:kUserAgreeService fromDictionary:dict];
            self.userRePassword = [self objectOrNilForKey:kUserUserRePassword fromDictionary:dict];
            self.userIdx = [[self objectOrNilForKey:kUserUserIdx fromDictionary:dict] doubleValue];
            self.userNameFirst = [self objectOrNilForKey:kUserUserNameFirst fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kUserUserName fromDictionary:dict];
            self.isActiveDesc = [self objectOrNilForKey:kUserIsActiveDesc fromDictionary:dict];
            self.birthYY = [self objectOrNilForKey:kUserBirthYY fromDictionary:dict];
            self.birthDD = [self objectOrNilForKey:kUserBirthDD fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userJoinType forKey:kUserUserJoinType];
    [mutableDict setValue:self.userNation forKey:kUserUserNation];
    [mutableDict setValue:[NSNumber numberWithBool:self.isBlockUserPhoto] forKey:kUserIsBlockUserPhoto];
    [mutableDict setValue:self.isMailling forKey:kUserIsMailling];
    [mutableDict setValue:self.agreeTerms forKey:kUserAgreeTerms];
    [mutableDict setValue:self.skinText forKey:kUserSkinText];
    [mutableDict setValue:self.userLevel forKey:kUserUserLevel];
    [mutableDict setValue:self.userPhoto forKey:kUserUserPhoto];
    [mutableDict setValue:self.userCellPhoneCountryCode forKey:kUserUserCellPhoneCountryCode];
    [mutableDict setValue:[NSNumber numberWithBool:self.blockUserPhoto] forKey:kUserBlockUserPhoto];
    [mutableDict setValue:self.userNick forKey:kUserUserNick];
    [mutableDict setValue:self.userCellPhone forKey:kUserUserCellPhone];
    [mutableDict setValue:self.userUUID forKey:kUserUserUUID];
    [mutableDict setValue:self.lang forKey:kUserLang];
    [mutableDict setValue:self.userBirthDay forKey:kUserUserBirthDay];
    [mutableDict setValue:self.userTimeZone forKey:kUserUserTimeZone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorRequest] forKey:kUserAuthorRequest];
    [mutableDict setValue:self.userAcceessToken forKey:kUserUserAcceessToken];
    [mutableDict setValue:self.fanbookUrl forKey:kUserFanbookUrl];
    [mutableDict setValue:self.userSns forKey:kUserUserSns];
    [mutableDict setValue:self.isActive forKey:kUserIsActive];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latestLoginDate] forKey:kUserLatestLoginDate];
    [mutableDict setValue:self.userDeviceUUID forKey:kUserUserDeviceUUID];
    [mutableDict setValue:self.userLanguage forKey:kUserUserLanguage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.deviceType] forKey:kUserDeviceType];
    [mutableDict setValue:self.createDate forKey:kUserCreateDate];
    [mutableDict setValue:self.userID forKey:kUserUserID];
    [mutableDict setValue:self.userGender forKey:kUserUserGender];
    [mutableDict setValue:self.userTitle forKey:kUserUserTitle];
    [mutableDict setValue:self.modifyDate forKey:kUserModifyDate];
    [mutableDict setValue:self.userTel forKey:kUserUserTel];
    [mutableDict setValue:self.birthMM forKey:kUserBirthMM];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isActiveDate] forKey:kUserIsActiveDate];
    [mutableDict setValue:self.agreeService forKey:kUserAgreeService];
    [mutableDict setValue:self.userRePassword forKey:kUserUserRePassword];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdx] forKey:kUserUserIdx];
    [mutableDict setValue:self.userNameFirst forKey:kUserUserNameFirst];
    [mutableDict setValue:self.userName forKey:kUserUserName];
    [mutableDict setValue:self.isActiveDesc forKey:kUserIsActiveDesc];
    [mutableDict setValue:self.birthYY forKey:kUserBirthYY];
    [mutableDict setValue:self.birthDD forKey:kUserBirthDD];

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

    self.userJoinType = [aDecoder decodeObjectForKey:kUserUserJoinType];
    self.userNation = [aDecoder decodeObjectForKey:kUserUserNation];
    self.isBlockUserPhoto = [aDecoder decodeBoolForKey:kUserIsBlockUserPhoto];
    self.isMailling = [aDecoder decodeObjectForKey:kUserIsMailling];
    self.agreeTerms = [aDecoder decodeObjectForKey:kUserAgreeTerms];
    self.skinText = [aDecoder decodeObjectForKey:kUserSkinText];
    self.userLevel = [aDecoder decodeObjectForKey:kUserUserLevel];
    self.userPhoto = [aDecoder decodeObjectForKey:kUserUserPhoto];
    self.userCellPhoneCountryCode = [aDecoder decodeObjectForKey:kUserUserCellPhoneCountryCode];
    self.blockUserPhoto = [aDecoder decodeBoolForKey:kUserBlockUserPhoto];
    self.userNick = [aDecoder decodeObjectForKey:kUserUserNick];
    self.userCellPhone = [aDecoder decodeObjectForKey:kUserUserCellPhone];
    self.userUUID = [aDecoder decodeObjectForKey:kUserUserUUID];
    self.lang = [aDecoder decodeObjectForKey:kUserLang];
    self.userBirthDay = [aDecoder decodeObjectForKey:kUserUserBirthDay];
    self.userTimeZone = [aDecoder decodeObjectForKey:kUserUserTimeZone];
    self.authorRequest = [aDecoder decodeDoubleForKey:kUserAuthorRequest];
    self.userAcceessToken = [aDecoder decodeObjectForKey:kUserUserAcceessToken];
    self.fanbookUrl = [aDecoder decodeObjectForKey:kUserFanbookUrl];
    self.userSns = [aDecoder decodeObjectForKey:kUserUserSns];
    self.isActive = [aDecoder decodeObjectForKey:kUserIsActive];
    self.latestLoginDate = [aDecoder decodeDoubleForKey:kUserLatestLoginDate];
    self.userDeviceUUID = [aDecoder decodeObjectForKey:kUserUserDeviceUUID];
    self.userLanguage = [aDecoder decodeObjectForKey:kUserUserLanguage];
    self.deviceType = [aDecoder decodeDoubleForKey:kUserDeviceType];
    self.createDate = [aDecoder decodeObjectForKey:kUserCreateDate];
    self.userID = [aDecoder decodeObjectForKey:kUserUserID];
    self.userGender = [aDecoder decodeObjectForKey:kUserUserGender];
    self.userTitle = [aDecoder decodeObjectForKey:kUserUserTitle];
    self.modifyDate = [aDecoder decodeObjectForKey:kUserModifyDate];
    self.userTel = [aDecoder decodeObjectForKey:kUserUserTel];
    self.birthMM = [aDecoder decodeObjectForKey:kUserBirthMM];
    self.isActiveDate = [aDecoder decodeDoubleForKey:kUserIsActiveDate];
    self.agreeService = [aDecoder decodeObjectForKey:kUserAgreeService];
    self.userRePassword = [aDecoder decodeObjectForKey:kUserUserRePassword];
    self.userIdx = [aDecoder decodeDoubleForKey:kUserUserIdx];
    self.userNameFirst = [aDecoder decodeObjectForKey:kUserUserNameFirst];
    self.userName = [aDecoder decodeObjectForKey:kUserUserName];
    self.isActiveDesc = [aDecoder decodeObjectForKey:kUserIsActiveDesc];
    self.birthYY = [aDecoder decodeObjectForKey:kUserBirthYY];
    self.birthDD = [aDecoder decodeObjectForKey:kUserBirthDD];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userJoinType forKey:kUserUserJoinType];
    [aCoder encodeObject:_userNation forKey:kUserUserNation];
    [aCoder encodeBool:_isBlockUserPhoto forKey:kUserIsBlockUserPhoto];
    [aCoder encodeObject:_isMailling forKey:kUserIsMailling];
    [aCoder encodeObject:_agreeTerms forKey:kUserAgreeTerms];
    [aCoder encodeObject:_skinText forKey:kUserSkinText];
    [aCoder encodeObject:_userLevel forKey:kUserUserLevel];
    [aCoder encodeObject:_userPhoto forKey:kUserUserPhoto];
    [aCoder encodeObject:_userCellPhoneCountryCode forKey:kUserUserCellPhoneCountryCode];
    [aCoder encodeBool:_blockUserPhoto forKey:kUserBlockUserPhoto];
    [aCoder encodeObject:_userNick forKey:kUserUserNick];
    [aCoder encodeObject:_userCellPhone forKey:kUserUserCellPhone];
    [aCoder encodeObject:_userUUID forKey:kUserUserUUID];
    [aCoder encodeObject:_lang forKey:kUserLang];
    [aCoder encodeObject:_userBirthDay forKey:kUserUserBirthDay];
    [aCoder encodeObject:_userTimeZone forKey:kUserUserTimeZone];
    [aCoder encodeDouble:_authorRequest forKey:kUserAuthorRequest];
    [aCoder encodeObject:_userAcceessToken forKey:kUserUserAcceessToken];
    [aCoder encodeObject:_fanbookUrl forKey:kUserFanbookUrl];
    [aCoder encodeObject:_userSns forKey:kUserUserSns];
    [aCoder encodeObject:_isActive forKey:kUserIsActive];
    [aCoder encodeDouble:_latestLoginDate forKey:kUserLatestLoginDate];
    [aCoder encodeObject:_userDeviceUUID forKey:kUserUserDeviceUUID];
    [aCoder encodeObject:_userLanguage forKey:kUserUserLanguage];
    [aCoder encodeDouble:_deviceType forKey:kUserDeviceType];
    [aCoder encodeObject:_createDate forKey:kUserCreateDate];
    [aCoder encodeObject:_userID forKey:kUserUserID];
    [aCoder encodeObject:_userGender forKey:kUserUserGender];
    [aCoder encodeObject:_userTitle forKey:kUserUserTitle];
    [aCoder encodeObject:_modifyDate forKey:kUserModifyDate];
    [aCoder encodeObject:_userTel forKey:kUserUserTel];
    [aCoder encodeObject:_birthMM forKey:kUserBirthMM];
    [aCoder encodeDouble:_isActiveDate forKey:kUserIsActiveDate];
    [aCoder encodeObject:_agreeService forKey:kUserAgreeService];
    [aCoder encodeObject:_userRePassword forKey:kUserUserRePassword];
    [aCoder encodeDouble:_userIdx forKey:kUserUserIdx];
    [aCoder encodeObject:_userNameFirst forKey:kUserUserNameFirst];
    [aCoder encodeObject:_userName forKey:kUserUserName];
    [aCoder encodeObject:_isActiveDesc forKey:kUserIsActiveDesc];
    [aCoder encodeObject:_birthYY forKey:kUserBirthYY];
    [aCoder encodeObject:_birthDD forKey:kUserBirthDD];
}

- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    
    if (copy) {

        copy.userJoinType = [self.userJoinType copyWithZone:zone];
        copy.userNation = [self.userNation copyWithZone:zone];
        copy.isBlockUserPhoto = self.isBlockUserPhoto;
        copy.isMailling = [self.isMailling copyWithZone:zone];
        copy.agreeTerms = self.agreeTerms;//[self.agreeTerms copyWithZone:zone];
        copy.skinText = [self.skinText copyWithZone:zone];
        copy.userLevel = [self.userLevel copyWithZone:zone];
        copy.userPhoto = [self.userPhoto copyWithZone:zone];
        copy.userCellPhoneCountryCode = [self.userCellPhoneCountryCode copyWithZone:zone];
        copy.blockUserPhoto = self.blockUserPhoto;
        copy.userNick = [self.userNick copyWithZone:zone];
        copy.userCellPhone = [self.userCellPhone copyWithZone:zone];
        copy.userUUID = [self.userUUID copyWithZone:zone];
        copy.lang = self.lang;//[self.lang copyWithZone:zone];
        copy.userBirthDay = [self.userBirthDay copyWithZone:zone];
        copy.userTimeZone = [self.userTimeZone copyWithZone:zone];
        copy.authorRequest = self.authorRequest;
        copy.userAcceessToken = self.userAcceessToken;//[self.userAcceessToken copyWithZone:zone];
        copy.fanbookUrl = [self.fanbookUrl copyWithZone:zone];
        copy.userSns = self.userSns;//[self.userSns copyWithZone:zone];
        copy.isActive = [self.isActive copyWithZone:zone];
        copy.latestLoginDate = self.latestLoginDate;
        copy.userDeviceUUID = self.userDeviceUUID;//[self.userDeviceUUID copyWithZone:zone];
        copy.userLanguage = [self.userLanguage copyWithZone:zone];
        copy.deviceType = self.deviceType;
        copy.createDate = self.createDate;//[self.createDate copyWithZone:zone];
        copy.userID = [self.userID copyWithZone:zone];
        copy.userGender = [self.userGender copyWithZone:zone];
        copy.userTitle = [self.userTitle copyWithZone:zone];
        copy.modifyDate = self.modifyDate;//[self.modifyDate copyWithZone:zone];
        copy.userTel = self.userTel;//[self.userTel copyWithZone:zone];
        copy.birthMM = [self.birthMM copyWithZone:zone];
        copy.isActiveDate = self.isActiveDate;
        copy.agreeService = self.agreeService;//[self.agreeService copyWithZone:zone];
        copy.userRePassword = self.userRePassword;//[self.userRePassword copyWithZone:zone];
        copy.userIdx = self.userIdx;
        copy.userNameFirst = [self.userNameFirst copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.isActiveDesc = [self.isActiveDesc copyWithZone:zone];
        copy.birthYY = [self.birthYY copyWithZone:zone];
        copy.birthDD = [self.birthDD copyWithZone:zone];
    }
    
    return copy;
}


@end
