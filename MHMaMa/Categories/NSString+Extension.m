
//
//  ViewController.h
//  RACTestOC
//
//  Created by mai on 16/9/26.
//  Copyright © 2016年 mai. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    dic[NSFontAttributeName] = font;
    return [self sizeWithAttributes:dic];
}

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    dic[NSFontAttributeName] = font;
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

- (BOOL)finderFromMemoryUrl{
    YYWebImageManager *manager =  [YYWebImageManager sharedManager];
    NSURL *imageURL  = [NSURL URLWithString:self];
    UIImage *imageFromMemory = nil;
    if (manager.cache) {
        imageFromMemory = [manager.cache getImageForKey:[manager cacheKeyForURL:imageURL] withType:YYImageCacheTypeMemory];
        
    }
    if (imageFromMemory) {
        return YES;
    }
    return NO;
}

@end
    
