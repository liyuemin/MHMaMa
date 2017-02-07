//
//  MProgressHUDView.m
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/21.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "MProgressHUDView.h"
#import "UIImage+GIF.h"
#import "Masonry.h"

@interface MProgressHUDView()

@property (nonatomic, strong) UIImageView *loadingImageView;

@end

@implementation MProgressHUDView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUpView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - Public methods

- (void)show:(BOOL)animated
{
    NSLog(@"%s",__func__);
    [self.superview bringSubviewToFront:self];
    if (animated)
    {
        self.alpha = 0.0f;
        self.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1.0f;
        } completion:^(BOOL finished) {
        }];
    }
    else
    {
        self.alpha = 1.0f;
        self.hidden = NO;
    }
}

- (void)hide:(BOOL)animated
{
    NSLog(@"%s",__func__);
    if (animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0.0f;
        } completion:^(BOOL finished) {
            self.hidden = YES;
        }];
    }
    else
    {
        self.alpha = 0.0f;
        self.hidden = YES;
    }
}

- (void)hideDelayed:(NSNumber *)animated
{
    [self hide:[animated boolValue]];
}

- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay
{
    if (delay>0)
    {
        [self performSelector:@selector(hideDelayed:) withObject:[NSNumber numberWithBool:animated] afterDelay:delay];
    }
    else
    {
        [self hide:animated];
    }
}

#pragma mark - Private methods

- (void)setUpView
{
    [self addSubview:self.loadingImageView];
    
    [self.loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).offset(-40);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    UIImage *loadingImage = [UIImage sd_animatedGIFNamed:@"mai-loading"];
    self.loadingImageView.image = loadingImage;
}

#pragma mark - GIF

-(UIImageView *)loadingImageView
{
    if (!_loadingImageView)
    {
        _loadingImageView = [[UIImageView alloc] init];
        _loadingImageView.backgroundColor = [UIColor clearColor];
    }
    return _loadingImageView;
}


@end
