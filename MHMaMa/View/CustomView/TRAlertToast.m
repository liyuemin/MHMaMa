//
//  TRAlertToast.m
//  TRGatherLove
//
//  Created by 李沛然 on 16/6/12.
//  Copyright © 2016年 liyuemin. All rights reserved.
//

#import "TRAlertToast.h"
#import "UIColor+more.h"
#import "MAppSetManager.h"
#import "MCmtInfoButton.h"
#import "TWMessageBarManager.h"

#define kToastViewHeight  60    //toast高度

#define kToastLabelY 24         //toast文字纵坐标

#define kToastLabelHeight 13    //toast文字高度

#define kToastLabelLeftMargin 33//toast文字左边距

@interface TRAlertToast ()

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIView *textBgView;

@end

@implementation TRAlertToast

- (void)dealloc
{
    NSLog(@"%s",__func__);
    [self.textLabel removeFromSuperview];
    self.textLabel = nil;
    [self.textBgView removeFromSuperview];
    self.textBgView = nil;
}

+ (void)showAlertToastOnStatusBar:(MStatusBarType)statusBarType entityName:(NSString *)entityName WithString:(NSString *)toastString withTargetDic:(NSDictionary *)paramDic
{
    switch (statusBarType)
    {
        case MStatusBarTypeCmt://评论状态的状态栏通知
        {
            BOOL successBool = ([paramDic[@"success"] integerValue] == 1);
            NSString *mgId = paramDic[@"mgId"];
            NSInteger mgType = [paramDic[@"mgType"] integerValue];
            NSString *freq = paramDic[@"freq"];
            
            //阿里百川statusBar&navBar toast
            [[TWMessageBarManager sharedInstance]showMessageWithTitle:successBool?@"成功":@"失败" description:toastString type:successBool?TWMessageBarMessageTypeSuccess:TWMessageBarMessageTypeError duration:5 callback:^{
                if (!successBool)
                {
                    [MAppSetManager pushCmtViewControllerWithMgId:mgId entityName:entityName withType:mgType freq:freq];
                }
            }];
            
            /*自己重写statusBar toast
            [[UIApplication sharedApplication].keyWindow setWindowLevel:UIWindowLevelStatusBar];
            MCmtInfoButton *signBtn = [MCmtInfoButton buttonWithType:UIButtonTypeCustom];
            signBtn.frame = CGRectMake(0, 0, ScreenWidth, 20);
            signBtn.backgroundColor = k_5681F6;
            signBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
             signBtn.mgId = paramDic[@"mgId"];
             signBtn.freq = paramDic[@"freq"];
            signBtn.mgName = entityName;
            signBtn.mgType = [paramDic[@"mgType"] integerValue];
            [signBtn setTitle:toastString forState:UIControlStateNormal];
            if ([paramDic[@"success"] integerValue] != 1)
            {
                [signBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [signBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
            [[UIApplication sharedApplication].keyWindow addSubview:signBtn];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [signBtn removeFromSuperview];
                [[UIApplication sharedApplication].keyWindow setWindowLevel:UIWindowLevelNormal];
            });
             */
        }
            break;
        default:
            break;
    }
}

+ (void)clickBtnAction:(MCmtInfoButton *)tmpBtn
{
    [MAppSetManager pushCmtViewControllerWithMgId:tmpBtn.mgId entityName:tmpBtn.mgName withType:tmpBtn.mgType freq:tmpBtn.freq];
}

#pragma mark - Public Method

- (id)initWithFrame:(CGRect)frame
{
    CGRect myFrame = frame;
    
    myFrame.size.height = kToastViewHeight;
    
    if (self = [super initWithFrame:myFrame])
    {
        //
    }
    
    return self;
}

- (void)setShowText:(NSString *)tmpText
{
    CGSize maxSize = CGSizeMake(self.bounds.size.width, 60);
    
    CGSize textSize = MB_MULTILINE_TEXTSIZE(tmpText, [UIFont systemFontOfSize:13], maxSize, NSLineBreakByWordWrapping);
    
    [self calculateBgBlackView:textSize];
    
    self.textLabel.text = tmpText;
    
    if (![self viewWithTag:102])
    {
        [self addSubview:self.textLabel];
    }
    
}

/************************
 *  tmpSuperView:该toast要弹出的父View
 *  tmpHidden:是否自动消失
 *  cancelBool:弹出该toast，父View是否有排他性
 ************************/
- (void)showInView:(UIView *)tmpSuperView WithHidden:(BOOL)tmpHidden withCancelOtherBool:(BOOL)cancelBool
{
    BOOL existBool = NO;
    
    for (UIView * v in tmpSuperView.subviews)
    {
        if ([v isKindOfClass:[TRAlertToast class]])
        {
            if (v == self)
            {
                existBool = YES;
            }
            else
            {
                if (cancelBool)
                {
                    [v removeFromSuperview];
                }
            }
        }
    }
    
    self.alpha = 0;
    
    if (!existBool)
    {
        [tmpSuperView addSubview:self];
    }
    else
    {
        [tmpSuperView bringSubviewToFront:self];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    [self hideWithBool:tmpHidden];
}

- (void)setMyOrigin:(float)tmpOrigin
{
    CGRect myFrame = self.frame;
    
    myFrame.origin.y = tmpOrigin;
    
    self.frame = myFrame;
}

#pragma mark - LazyLoad

- (UILabel *)textLabel
{
    if (!_textLabel)
    {
        CGRect labelRect = self.bounds;
        
        labelRect.origin.y = kToastLabelY;
        
        labelRect.size.height = kToastLabelHeight;
        
        _textLabel = [[UILabel alloc]initWithFrame:labelRect];
        
        _textLabel.backgroundColor = [UIColor clearColor];
        
        _textLabel.textAlignment = NSTextAlignmentCenter;
        
        _textLabel.textColor = [UIColor whiteColor];
        
        _textLabel.font = SYS_FONT(13);
        
        _textLabel.tag = 102;
    }
    
    return _textLabel;
}

- (UIView *)textBgView
{
    if (!_textBgView)
    {
        _textBgView = [[UIView alloc]initWithFrame:self.bounds];
        
        _textBgView.backgroundColor = [UIColor color16WithHexString:@"#222222" alpha:0.9];
        
        _textBgView.layer.cornerRadius = 10;
        
        _textBgView.tag = 101;
    }
    
    return _textBgView;
}

#pragma mark - Private Method

- (void)hideWithBool:(BOOL)tmpHidden
{
    if (tmpHidden)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideMyView) object:nil];
        
        [self performSelector:@selector(hideMyView) withObject:nil afterDelay:2 inModes:[NSArray arrayWithObjects:NSRunLoopCommonModes, nil]];
    }
}

- (void)hideMyView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)calculateBgBlackView:(CGSize)textSize
{
    CGRect textBgFrame = self.textBgView.frame;
    
    textBgFrame.size.width = textSize.width + kToastLabelLeftMargin * 2;
    
    self.textBgView.frame = textBgFrame;
    
    self.textBgView.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    
    if (![self viewWithTag:101])
    {
        [self addSubview:self.textBgView];
    }
}

- (void)hidden
{
    [self hideMyView];
}

@end
