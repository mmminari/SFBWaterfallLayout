//
//  WatarfallCell.h
//  FBWaterfallLayout
//
//  Created by 김민아 on 2016. 12. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WatarfallCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ivColor;


- (void)setThumbnailImageWithImageUrl:(NSString *)urlString imageHeight:(CGFloat)height;
- (void)setTitle:(NSString *)title Desc:(NSString *)desc;
- (void)setViewCount:(NSInteger)viewCount CommentCount:(NSInteger)commentCount LikeCount:(NSInteger)likeCount;
- (void)setUserProfileWithUrl:(NSString *)urlString;
- (void)setUserNick:(NSString *)userNick;
- (void)setCurationName:(NSString *)curationName curatedBy:(NSString *)curatedBy curationCount:(NSInteger)curationCount;



@end
