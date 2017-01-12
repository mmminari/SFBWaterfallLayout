//
//  WatarfallCell.m
//  FBWaterfallLayout
//
//  Created by 김민아 on 2016. 12. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "WatarfallCell.h"
#import "LibraryClass.h"

@interface WatarfallCell ()

#pragma mark - UI
@property (weak, nonatomic) IBOutlet UIImageView *ivThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDesc;
@property (weak, nonatomic) IBOutlet UILabel *lbView;
@property (weak, nonatomic) IBOutlet UILabel *lbComment;
@property (weak, nonatomic) IBOutlet UILabel *lbLike;
@property (weak, nonatomic) IBOutlet UIImageView *ivUserProfile;
@property (weak, nonatomic) IBOutlet UILabel *lbUserNick;
@property (weak, nonatomic) IBOutlet UIImageView *ivFollowing;
@property (weak, nonatomic) IBOutlet UILabel *lbCurationName;
@property (weak, nonatomic) IBOutlet UILabel *lbCuratedBy;
@property (weak, nonatomic) IBOutlet UILabel *lbCurationCounting;

#pragma mark - Data
@property (strong, nonatomic) LibraryClass *lib;

#pragma mark - Alc
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfDesc;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfCountLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUserProfile;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUserPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfUserPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfUserPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfUserPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfUserNIck;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfFollowingButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfFollowingButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfFollowingIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfFollowingIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfThumbnail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCountLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfViewIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCommentIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfLikeIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfCommentLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfCurationIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfCurationIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCurationIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCurationIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidhtOfCurationCount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCurationCount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCurationView;



@end

@implementation WatarfallCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.lib = [LibraryClass sharedInstance];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.alcTopOfTitle.constant = WRATIO_WIDTH(17.0f);
    self.alcLeadingOfTitle.constant = WRATIO_WIDTH(13.0f);
    self.alcTrailingOfTitle.constant = WRATIO_WIDTH(13.0f);
    self.alcTopOfDesc.constant = WRATIO_WIDTH(11.0f);
    self.alcTopOfCountLabel.constant = WRATIO_WIDTH(15.0f);
    self.alcTopOfUserProfile.constant = WRATIO_WIDTH(18.0f);
    self.alcTopOfUserPhoto.constant = WRATIO_WIDTH(10.0f);
    self.alcLeadingOfUserPhoto.constant = WRATIO_WIDTH(13.0f);
    self.alcLeadingOfUserNIck.constant = WRATIO_WIDTH(9.0f);
    self.alcHeightOfFollowingButton.constant = WRATIO_WIDTH(40.0f);
    self.alcWidthOfFollowingButton.constant = WRATIO_WIDTH(40.0f);
    self.alcHeightOfFollowingIcon.constant = WRATIO_WIDTH(8.0f);
    self.alcWidthOfFollowingIcon.constant = WRATIO_WIDTH(8.0f);
    self.alcCenterOfCommentLabel.constant = self.alcWidthOfCommentIcon.constant /2;
    self.alcWidthOfViewIcon.constant = WRATIO_WIDTH(17.0f);
    self.alcWidthOfCommentIcon.constant = WRATIO_WIDTH(14.0f);
    self.alcWidthOfLikeIcon.constant = WRATIO_WIDTH(13.0f);
    self.alcHeightOfCountLabel.constant = WRATIO_WIDTH(13.0f);
    self.alcTopOfCurationIcon.constant = WRATIO_WIDTH(13.0f);
    self.alcLeadingOfCurationIcon.constant = WRATIO_WIDTH(15.0f);
    self.alcWidthOfCurationIcon.constant = WRATIO_WIDTH(17.0f);
    self.alcHeightOfCurationIcon.constant = WRATIO_WIDTH(15.0f);
    self.alcHeightOfCurationCount.constant = WRATIO_WIDTH(18.0f);
    self.alcWidhtOfCurationCount.constant = WRATIO_WIDTH(18.0f);
    self.alcHeightOfCurationView.constant = WRATIO_WIDTH(43.0f);
    
    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.lbTitle.textColor = [self.lib.util getColorWithRGBCode:@"4a498d"];
    self.lbTitle.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(17.0f)];
    
    self.lbDesc.textColor = [self.lib.util getColorWithRGBCode:@"646464"];
    self.lbDesc.font = [UIFont systemFontOfSize:WRATIO_WIDTH(13.0f)];
    
    self.lbView.textColor = [self.lib.util getColorWithRGBCode:@"909090"];
    self.lbView.font = [UIFont systemFontOfSize:WRATIO_WIDTH(11.0f)];
    
    self.lbComment.textColor = self.lbView.textColor;
    self.lbComment.font = self.lbView.font;
    
    self.lbLike.textColor = self.lbView.textColor;
    self.lbLike.font = self.lbView.font;
    
    self.lbUserNick.textColor = [self.lib.util getColorWithRGBCode:@"4a498d"];
    self.lbUserNick.font = [UIFont systemFontOfSize:WRATIO_WIDTH(12.0f)];
    
    self.ivUserProfile.layer.cornerRadius = self.alcHeightOfUserPhoto.constant / 2;
    self.ivUserProfile.clipsToBounds = YES;
    
    self.lbCurationName.font = [UIFont systemFontOfSize:WRATIO_WIDTH(12.0f)];
    self.lbCurationName.textColor = [self.lib.util getColorWithRGBCode:@"4a498d"];
    
    self.lbCuratedBy.font = [UIFont systemFontOfSize:WRATIO_WIDTH(11.0f)];
    self.lbCuratedBy.textColor = [self.lib.util getColorWithRGBCode:@"646464"];
    
    self.lbCurationCounting.font = [UIFont systemFontOfSize:WRATIO_WIDTH(10.0f)];
    self.lbCurationCounting.textColor = [self.lib.util getColorWithRGBCode:@"ffffff"];
}

#pragma mark - Public Method

- (void)setThumbnailImageWithImageUrl:(NSString *)urlString imageHeight:(CGFloat)height
{
    [self.lib setImageView:self.ivThumbnail urlString:urlString placeholderImage:nil animation:YES];
    
    self.alcHeightOfThumbnail.constant = height;
}

- (void)setTitle:(NSString *)title Desc:(NSString *)desc
{
    self.lbTitle.text = title;
    self.lbDesc.text = desc;
}

- (void)setViewCount:(NSInteger)viewCount CommentCount:(NSInteger)commentCount LikeCount:(NSInteger)likeCount
{
    self.lbView.text = [NSString stringWithFormat:@"%zd", viewCount];
    self.lbComment.text = [NSString stringWithFormat:@"%zd", commentCount];
    self.lbLike.text = [NSString stringWithFormat:@"%zd", likeCount];
}

- (void)setUserProfileWithUrl:(NSString *)urlString
{
    [self.lib setImageView:self.ivUserProfile urlString:urlString placeholderImage:nil animation:YES];
}

- (void)setUserNick:(NSString *)userNick
{
    self.lbUserNick.text = userNick;
}

- (void)setCurationViewHeightWithCurationCount:(NSInteger)curationCount
{
    if(curationCount == 0)
    {
        self.alcHeightOfCurationView.constant = WRATIO_WIDTH(0.0f);
    }
    else
    {
        self.alcHeightOfCurationView.constant = WRATIO_WIDTH(40.0f);
    }
    
    [self layoutIfNeeded];
}

- (void)setCurationName:(NSString *)curationName curatedBy:(NSString *)curatedBy curationCount:(NSInteger)curationCount
{
    self.lbCurationName.text = curationName;
    self.lbCuratedBy.text = [NSString stringWithFormat:@"Curated by %@", curatedBy];
    self.lbCurationCounting.text = [NSString stringWithFormat:@"%zd", curationCount];
}




@end
