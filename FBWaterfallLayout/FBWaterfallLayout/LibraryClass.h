//
//  LibraryClass.h
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 24..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UtilityClass.h"

#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define STANDARD_DEVICE_WIDTH                                       414.0f
#define WRATIO_WIDTH(w)                                             (w) / STANDARD_DEVICE_WIDTH * DEVICE_WIDTH

#define DEVICE_HEIGHT                                               [UIScreen mainScreen].bounds.size.height
#define STANDARD_DEVICE_HEIGHT                                      736.0f
#define HRATIO_HEIGHT(h)                                            (h/3.0f) / STANDARD_DEVICE_HEIGHT * DEVICE_HEIGHT

#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width


@interface LibraryClass : NSObject

@property (strong, nonatomic) UtilityClass *util;

+ (LibraryClass *)sharedInstance;

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani;

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani completed:(void (^)(BOOL complete))completed;

@end
