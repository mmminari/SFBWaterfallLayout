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



@interface ViewController () <CHTCollectionViewDelegateWaterfallLayout>

#pragma mark - UI
@property (weak, nonatomic) IBOutlet CHTCollectionViewWaterfallLayout *waterfallLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *cvMain;

#pragma mark - Data
@property (strong, nonatomic) SFBHTTPClient *httpClient;
@property (strong, nonatomic) NSArray *cellHeights;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"WatarfallCell" bundle:nil] forCellWithReuseIdentifier:@"WatarfallCell"];
    
    self.waterfallLayout.minimumInteritemSpacing = 10.0f;
    self.waterfallLayout.minimumColumnSpacing = 10.0f;
    
    self.httpClient = [[SFBHTTPClient alloc] init];
    
    self.cellHeights = [self cellHeights];
    
    [self reqLogIn];

}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger result = 20;
    
    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    WatarfallCell *cell = [self.cvMain dequeueReusableCellWithReuseIdentifier:@"WatarfallCell" forIndexPath:indexPath];
    
    cell.ivColor.backgroundColor = [self randomBackgroundColor];
    
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize result = CGSizeMake(0.0f, 0.0f);
    
    CGFloat width = DEVICE_WIDTH;
    CGFloat height = [self.cellHeights[indexPath.item] floatValue] * 2;
    
    result = CGSizeMake(width, height);
    
    
    return result;

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
        LogGreen(@"result");
    } failure:^(NSError *error) {
        LogRed(@"error : %@", error);
    }];
    
}

#pragma mark - Private Method

- (NSMutableArray *)cellHeights
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:900];
    
    for (NSInteger i = 0; i < 900; i++)
    {
        result[i] = @(arc4random()%100*2+100);
    }
    
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
