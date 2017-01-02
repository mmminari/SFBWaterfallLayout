//
//  User.h
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface User : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userJoinType;
@property (nonatomic, strong) NSString *userNation;
@property (nonatomic, assign) BOOL isBlockUserPhoto;
@property (nonatomic, strong) NSString *isMailling;
@property (nonatomic, assign) id agreeTerms;
@property (nonatomic, strong) NSString *skinText;
@property (nonatomic, strong) NSString *userLevel;
@property (nonatomic, strong) NSString *userPhoto;
@property (nonatomic, strong) NSString *userCellPhoneCountryCode;
@property (nonatomic, assign) BOOL blockUserPhoto;
@property (nonatomic, strong) NSString *userNick;
@property (nonatomic, strong) NSString *userCellPhone;
@property (nonatomic, strong) NSString *userUUID;
@property (nonatomic, assign) NSString *lang;
@property (nonatomic, strong) NSString *userBirthDay;
@property (nonatomic, strong) NSString *userTimeZone;
@property (nonatomic, assign) double authorRequest;
@property (nonatomic, assign) id userAcceessToken;
@property (nonatomic, strong) NSString *fanbookUrl;
@property (nonatomic, assign) id userSns;
@property (nonatomic, strong) NSString *isActive;
@property (nonatomic, assign) double latestLoginDate;
@property (nonatomic, assign) id userDeviceUUID;
@property (nonatomic, strong) NSString *userLanguage;
@property (nonatomic, assign) double deviceType;
@property (nonatomic, assign) id createDate;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userGender;
@property (nonatomic, strong) NSString *userTitle;
@property (nonatomic, assign) id modifyDate;
@property (nonatomic, assign) id userTel;
@property (nonatomic, strong) NSString *birthMM;
@property (nonatomic, assign) double isActiveDate;
@property (nonatomic, assign) id agreeService;
@property (nonatomic, assign) id userRePassword;
@property (nonatomic, assign) double userIdx;
@property (nonatomic, strong) NSString *userNameFirst;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *isActiveDesc;
@property (nonatomic, strong) NSString *birthYY;
@property (nonatomic, strong) NSString *birthDD;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
