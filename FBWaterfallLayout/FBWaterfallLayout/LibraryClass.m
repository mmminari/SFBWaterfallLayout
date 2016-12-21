//
//  LibraryClass.m
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 24..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "LibraryClass.h"
#import <AFNetworking/AFNetworking.h>

#import <SDWebImage/UIImageView+WebCache.h>

@implementation LibraryClass

+ (LibraryClass *)sharedInstance
{
    static LibraryClass *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryClass alloc]init];
    });
    
    return _sharedInstance;
}

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani
{
    NSURL *url = [NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if(cacheType == SDImageCacheTypeNone)
         {
             if(ani)
             {
                 /*
                  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
                  animation.duration = 2.0;
                  animation.fromValue = [NSNumber numberWithFloat:0.0f];
                  animation.toValue = [NSNumber numberWithFloat:1.0f];
                  [imageView.layer addAnimation:animation forKey:@"animateOpacity"];
                  */
                 
                 [imageView.layer addAnimation:[self fadeOutAnimationForChangeImage] forKey:@"fadeOutAnimationForChangeImage"];
             }
             
         }
     }];
}

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani completed:(void (^)(BOOL complete))completed
{
    NSURL *url = [NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if(cacheType == SDImageCacheTypeNone)
         {
             if(ani)
             {
                 [imageView.layer addAnimation:[self fadeOutAnimationForChangeImage] forKey:@"fadeOutAnimationForChangeImage"];
             }
         }
         if(completed)
         {
             completed(1);
         }
     }];
}
- (CATransition *)fadeOutAnimationForChangeImage
{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    return transition;
}






@end
