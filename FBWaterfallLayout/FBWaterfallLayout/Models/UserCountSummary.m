//
//  UserCountSummary.m
//
//  Created by   on 2016. 12. 27.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "UserCountSummary.h"


NSString *const kUserCountSummaryCelebrity = @"celebrity";
NSString *const kUserCountSummaryFollowing = @"following";
NSString *const kUserCountSummaryUserIdx = @"userIdx";
NSString *const kUserCountSummaryHitTotalCount = @"hitTotalCount";
NSString *const kUserCountSummaryFollower = @"follower";
NSString *const kUserCountSummaryArtWork = @"artWork";
NSString *const kUserCountSummaryLike = @"like";
NSString *const kUserCountSummaryLikeTotalCount = @"likeTotalCount";
NSString *const kUserCountSummaryCuration = @"curation";


@interface UserCountSummary ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserCountSummary

@synthesize celebrity = _celebrity;
@synthesize following = _following;
@synthesize userIdx = _userIdx;
@synthesize hitTotalCount = _hitTotalCount;
@synthesize follower = _follower;
@synthesize artWork = _artWork;
@synthesize like = _like;
@synthesize likeTotalCount = _likeTotalCount;
@synthesize curation = _curation;


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
            self.celebrity = [self objectOrNilForKey:kUserCountSummaryCelebrity fromDictionary:dict];
            self.following = [self objectOrNilForKey:kUserCountSummaryFollowing fromDictionary:dict];
            self.userIdx = [[self objectOrNilForKey:kUserCountSummaryUserIdx fromDictionary:dict] doubleValue];
            self.hitTotalCount = [self objectOrNilForKey:kUserCountSummaryHitTotalCount fromDictionary:dict];
            self.follower = [self objectOrNilForKey:kUserCountSummaryFollower fromDictionary:dict];
            self.artWork = [self objectOrNilForKey:kUserCountSummaryArtWork fromDictionary:dict];
            self.like = [self objectOrNilForKey:kUserCountSummaryLike fromDictionary:dict];
            self.likeTotalCount = [self objectOrNilForKey:kUserCountSummaryLikeTotalCount fromDictionary:dict];
            self.curation = [self objectOrNilForKey:kUserCountSummaryCuration fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.celebrity forKey:kUserCountSummaryCelebrity];
    [mutableDict setValue:self.following forKey:kUserCountSummaryFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdx] forKey:kUserCountSummaryUserIdx];
    [mutableDict setValue:self.hitTotalCount forKey:kUserCountSummaryHitTotalCount];
    [mutableDict setValue:self.follower forKey:kUserCountSummaryFollower];
    [mutableDict setValue:self.artWork forKey:kUserCountSummaryArtWork];
    [mutableDict setValue:self.like forKey:kUserCountSummaryLike];
    [mutableDict setValue:self.likeTotalCount forKey:kUserCountSummaryLikeTotalCount];
    [mutableDict setValue:self.curation forKey:kUserCountSummaryCuration];

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

    self.celebrity = [aDecoder decodeObjectForKey:kUserCountSummaryCelebrity];
    self.following = [aDecoder decodeObjectForKey:kUserCountSummaryFollowing];
    self.userIdx = [aDecoder decodeDoubleForKey:kUserCountSummaryUserIdx];
    self.hitTotalCount = [aDecoder decodeObjectForKey:kUserCountSummaryHitTotalCount];
    self.follower = [aDecoder decodeObjectForKey:kUserCountSummaryFollower];
    self.artWork = [aDecoder decodeObjectForKey:kUserCountSummaryArtWork];
    self.like = [aDecoder decodeObjectForKey:kUserCountSummaryLike];
    self.likeTotalCount = [aDecoder decodeObjectForKey:kUserCountSummaryLikeTotalCount];
    self.curation = [aDecoder decodeObjectForKey:kUserCountSummaryCuration];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_celebrity forKey:kUserCountSummaryCelebrity];
    [aCoder encodeObject:_following forKey:kUserCountSummaryFollowing];
    [aCoder encodeDouble:_userIdx forKey:kUserCountSummaryUserIdx];
    [aCoder encodeObject:_hitTotalCount forKey:kUserCountSummaryHitTotalCount];
    [aCoder encodeObject:_follower forKey:kUserCountSummaryFollower];
    [aCoder encodeObject:_artWork forKey:kUserCountSummaryArtWork];
    [aCoder encodeObject:_like forKey:kUserCountSummaryLike];
    [aCoder encodeObject:_likeTotalCount forKey:kUserCountSummaryLikeTotalCount];
    [aCoder encodeObject:_curation forKey:kUserCountSummaryCuration];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserCountSummary *copy = [[UserCountSummary alloc] init];
    
    if (copy) {

        copy.celebrity = [self.celebrity copyWithZone:zone];
        copy.following = [self.following copyWithZone:zone];
        copy.userIdx = self.userIdx;
        copy.hitTotalCount = [self.hitTotalCount copyWithZone:zone];
        copy.follower = [self.follower copyWithZone:zone];
        copy.artWork = [self.artWork copyWithZone:zone];
        copy.like = [self.like copyWithZone:zone];
        copy.likeTotalCount = [self.likeTotalCount copyWithZone:zone];
        copy.curation = [self.curation copyWithZone:zone];
    }
    
    return copy;
}


@end
