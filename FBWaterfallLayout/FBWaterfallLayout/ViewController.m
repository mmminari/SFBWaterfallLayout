//
//  ViewController.m
//  FBWaterfallLayout
//
//  Created by 김민아 on 2016. 12. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "WatarfallCell.h"
#import "SFBHTTPClient.h"

#import "LoginResponseDataModels.h"
#import "MainListDataModels.h"


@interface ViewController () <CHTCollectionViewDelegateWaterfallLayout>

#pragma mark - UI
@property (weak, nonatomic) IBOutlet CHTCollectionViewWaterfallLayout *waterfallLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *cvMain;

#pragma mark - Data
@property (strong, nonatomic) LibraryClass *lib;
@property (strong, nonatomic) SFBHTTPClient *httpClient;
@property (strong, nonatomic) NSArray *cellHeights;
@property (strong, nonatomic) NSArray *artworkList;
@property (assign, nonatomic) NSInteger totalCount;
@property (assign, nonatomic) NSInteger currentPage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"WatarfallCell" bundle:nil] forCellWithReuseIdentifier:@"WatarfallCell"];
    
    self.waterfallLayout.minimumInteritemSpacing = 10.0f;
    self.waterfallLayout.minimumColumnSpacing = 10.0f;
    
    self.lib = [LibraryClass sharedInstance];
    
    self.httpClient = [[SFBHTTPClient alloc] init];
    
    self.cellHeights = [self cellHeights];
    
    [self reqLogIn];
    
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger result = self.artworkList.count;
    
    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    WatarfallCell *cell = [self.cvMain dequeueReusableCellWithReuseIdentifier:@"WatarfallCell" forIndexPath:indexPath];
    
    //cell.ivColor.backgroundColor = [self randomBackgroundColor];
    
    ResponseArtWork *artwork = self.artworkList[indexPath.item];
    
    NSString *urlString = artwork.thumb.imageKey;
    
    CGFloat imageHeight = [self.cellHeights[indexPath.item] floatValue];
    
    [cell setThumbnailImageWithImageUrl:urlString imageHeight:imageHeight];
    
    [cell setTitle:artwork.artWorkTitle Desc:artwork.artWorkDesc];
    
    [cell setUserProfileWithUrl:artwork.user.userPhoto];
    
    [cell setUserNick:artwork.user.userNick];
    
    [cell setViewCount:artwork.hitCount CommentCount:artwork.commentCount LikeCount:artwork.likeCount];
    
    [cell setCurationName:artwork.cuTitle curatedBy:artwork.cuNickName curationCount:artwork.cuCount];
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize result = CGSizeMake(0.0f, 0.0f);
    
    CGFloat width = ( DEVICE_WIDTH - WRATIO_WIDTH(13.0f) * 3 ) / 2;
    
    CGFloat height = [self getCellHeightWithIndex:indexPath.item];
    
    result = CGSizeMake(width, height);
    
    return result;

}

#pragma mark - UIScrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if([self canLoadMore])
    {
        [self reqArtworkListBestIsLoadMore:YES];
    }
}

#pragma mark - Request
- (void)reqLogIn
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setObject:@"yonghwinam@smtown.com" forKey:@"userID"];
    [param setObject:@"apple0000" forKey:@"userPassword"];
    [param setObject:@"autoLogin" forKey:@"Y"];
    
    NSDictionary *resigsterDevice =
        @{
            @"deviceToken":@"token",
            @"deviceType":@"ios",
            @"version":@"1",
            @"lang":@"ko",
            @"isPushOn":[NSNumber numberWithBool:TRUE],
            @"isPushDebug":[NSNumber numberWithBool:TRUE]
            };
    
    [param setObject:resigsterDevice forKey:@"registerDevice"];
    
    LogGreen(@" param : %@", param);

    [self.httpClient callHttpAPIWithMethod:@"POST" path:@"/auth" Parameters:param success:^(id result) {
        [self successCompletionOfReqLoginWithResults:result];
    } failure:^(NSError *error) {
        LogRed(@"error : %@", error);
    }];
    
}

- (void)reqArtworkListBestIsLoadMore:(BOOL)isLoadMore
{
    if(isLoadMore)
    {
        self.currentPage = self.currentPage + 1;
    }
    else
    {
        self.currentPage = 1;
    }
    
    NSDictionary *param = @{ @"userIdx" : @"1035",
                             @"page" : @(self.currentPage),
                             @"count" : @"30",
                             @"lang" : @"ko" };
    
    
    [self.httpClient callHttpAPIWithMethod:@"POST" path:@"/artwork/list/best" Parameters:param.mutableCopy success:^(id result) {
        if(isLoadMore)
        {
            [self successCompletionOfReqLoadMoreMainArtworkListWithResults:result];
        }
        else
        {
            [self successCompletionOfReqMainArtworkListWithResults:result];
        }
        
    } failure:^(NSError *error) {
        LogRed(@"error :%@", error);
    }];
}

#pragma mark - Process

- (void)successCompletionOfReqLoginWithResults:(id)results
{
    LoginResponse *response = [LoginResponse modelObjectWithDictionary:results];
    
    if(response.code == 0)
    {
        LogGreen(@"code:%zd", response.code);
        
        [self reqArtworkListBestIsLoadMore:NO];
        
    }
}

- (void)successCompletionOfReqMainArtworkListWithResults:(id)results
{
    MainListModel *listModel = [MainListModel modelObjectWithDictionary:results];
    
    if(listModel.code == 0)
    {
        self.artworkList = listModel.data.responseArtWork;
        
        LogGreen(@"self.artworkList.count : %zd", self.artworkList.count);
        
        self.cellHeights = [self cellHeights];
        
        self.totalCount = listModel.data.totalCount;
        
        [self.cvMain reloadData];
    }
}

- (void)successCompletionOfReqLoadMoreMainArtworkListWithResults:(id)results
{
    MainListModel *listModel = [MainListModel modelObjectWithDictionary:results];
    
    if(listModel.code == 0)
    {
        NSMutableArray *temp = self.artworkList.mutableCopy;
        
        [temp addObjectsFromArray:listModel.data.responseArtWork];
        
        self.artworkList = (NSArray *)temp;
        
        [self.cvMain reloadData];
    }
}
#pragma mark - Private Method

- (BOOL)canLoadMore
{
    BOOL result = NO;
    
    NSArray *visibleCells = [self.cvMain visibleCells];
    
    for (WatarfallCell *cell in visibleCells) {
        NSIndexPath *indexPath = [self.cvMain indexPathForCell:cell];
        
        NSInteger index = indexPath.item;
        
        if(index == self.artworkList.count -1)
        {
            result = YES;
            
            break;
        }
    }
    
    if(self.artworkList.count == self.totalCount)
    {
        result = NO;
    }
    
    return result;
}

- (NSArray *)cellHeights
{
    NSMutableArray *result = [NSMutableArray array];
    
    for (ResponseArtWork *artwork in self.artworkList) {
        CGFloat width = [artwork.thumb.width floatValue];
        CGFloat height = [artwork.thumb.height floatValue];
        
        CGFloat cellWidth = ( DEVICE_WIDTH - WRATIO_WIDTH(13.0f) * 3 ) / 2;
        
        CGFloat imageHeight = height / width * cellWidth;
        
        [result addObject:@(imageHeight)];
    }
    
    return (NSArray *)result;
}

- (CGFloat)getCellHeightWithIndex:(NSInteger)index
{
    CGFloat result = 0.0f;
    
    CGFloat totalAlc = WRATIO_WIDTH(103.0f);
    
    ResponseArtWork *artwork = self.artworkList[index];
    
    CGFloat maxWidth = ( DEVICE_WIDTH - WRATIO_WIDTH(13.0f) * 3 ) / 2 - WRATIO_WIDTH(13.0f) * 2;
    
    CGFloat heightOfTitleLabel = [self.lib.util getStringHeightWithString:artwork.artWorkTitle maxWidth:maxWidth maxLine:1 font:[UIFont systemFontOfSize:WRATIO_WIDTH(17.0f)]];
    
    CGFloat heightOfDescLabel = [self.lib.util getStringHeightWithString:artwork.artWorkDesc maxWidth:maxWidth maxLine:2 font:[UIFont systemFontOfSize:WRATIO_WIDTH(13.0f)]];
    
    LogGreen(@"titleHeight : %f, descHeight : %f", heightOfTitleLabel, heightOfDescLabel );
    
    CGFloat heightOfThubImage = [self.cellHeights[index] floatValue];
    
    result = totalAlc + heightOfTitleLabel + heightOfDescLabel + heightOfThubImage;
    
    if(artwork.cuCount != 0)
    {
        CGFloat heightOfCurationView = WRATIO_WIDTH(43.0f);
        
        result = result + heightOfCurationView;
    }
    
    LogGreen(@"cellHeight : %f", result);
    
    return result;
}

- (UIColor *)randomBackgroundColor
{
    UIColor *result = nil;
    
    CGFloat redValue = (arc4random() % 100) / 255.0f;
    CGFloat greenValue = (arc4random() % 150) / 255.0f;
    CGFloat blueValue = (arc4random() % 250) / 255.0f;
    result = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:0.7];
    
    return result;
}
@end
