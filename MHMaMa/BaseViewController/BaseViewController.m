 //
//  BaseViewController.m
//  MaiMaiMai
//
//  Created by yuemin li on 16/10/13.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBar+Awesome.h"
#import "UIView+YYAdd.h"
#import "MViewTools.h"
#import "UMMobClick/MobClick.h"

@interface BaseViewController ()
@property (nonatomic, strong) TRAlertToast *alertToast;
@end

@implementation BaseViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
    [MobClick beginLogPageView:NSStringFromClass([self class])];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:NSStringFromClass([self class])];
}

#pragma mark - Public
- (void)showAlertToast:(NSString *)alertString
{
    [self.alertToast setShowText:alertString];
    
    [self.alertToast showInView:[UIApplication sharedApplication].keyWindow WithHidden:YES withCancelOtherBool:NO];
}

- (void)hideNavBar
{
    [UIView animateWithDuration:0.2 animations:^{
        self.navBar.frame = CGRectMake(0, -64, ScreenWidth, 64);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showNavBar
{
    [UIView animateWithDuration:0.2 animations:^{
        self.navBar.frame = CGRectMake(0, 0, ScreenWidth, 64);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Private
- (void)setUI
{
    float navBarTitleI = 18;
    self.view.backgroundColor = k_F4F4F4;
    self.navigationController.navigationBar.barTintColor = Sys_Nav_Bar_Color;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SYS_BOLDFONT(navBarTitleI),NSForegroundColorAttributeName:Sys_Nav_Title_Color}];
    
    if (self.haveMyNavBar)
    {
        self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
        UINavigationItem *NavTitle = [[UINavigationItem alloc] init];
        [self.navBar pushNavigationItem:NavTitle animated:YES];
        [self.view addSubview:self.navBar];
        
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = Sys_Nav_Title_Color;
        attrs[NSFontAttributeName] = SYS_FONT(navBarTitleI);
        [self.navBar setTitleTextAttributes:attrs];
        
        if (self.lineBool)
        {
            [self.navBar setShadowImage:[MViewTools generateOnePixImageWithColor:k_F2F2F2]];
        }
        else
        {
            [self.navBar setShadowImage:[[UIImage alloc] init]];
        }
        
        [self.navBar lt_setBackgroundColor:self.navBarColor?:Sys_Nav_Bar_Color];
        
        if (!self.noMyNavBarBackBtn)
        {
            UIButton * backBtn = [[UIButton alloc]init];
            [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
            [backBtn sizeToFit];
            [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            [backBtn setImageEdgeInsets:TOPBAR_BACKEDGE];
            self.navBar.topItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        }
        return;
    }
    else
    {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SYS_FONT(navBarTitleI),NSForegroundColorAttributeName:Sys_Nav_Title_Color}];
        if (self.haveBackBtn)
        {
            UIButton * tmpBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [tmpBackBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
            [tmpBackBtn sizeToFit];
            [tmpBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            [tmpBackBtn setImageEdgeInsets:TOPBAR_BACKEDGE];
            UIBarButtonItem * tmpBtn = [[UIBarButtonItem alloc]initWithCustomView:tmpBackBtn];
            self.navigationItem.leftBarButtonItem = tmpBtn;
        }
    }
    
}

- (void)setNavBarOverlayAlpha:(float)alphaF
{
    [self.navBar setOverlayAlpha:alphaF];
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewModelData
{

}

- (void)setViewModelCallBack
{

}

- (void)setKeyValueWithJson:(NSString *)keyValueJson
{
    if (keyValueJson)
    {
        NSArray *propertySets = [self propertyNameList];
        NSDictionary *tmpObj = [MEntityTool toArrayOrNSDictionary:keyValueJson];
        for (int i = 0; i < propertySets.count; ++i)
        {
            NSString *tmpParamName = [propertySets objectAtIndex:i];
            id value = [tmpObj valueForKey:tmpParamName];
            if (value)
            {
                @try
                {
                    [self setValue:value forKey:tmpParamName];
                }
                @catch (NSException *exception)
                {
                    NSLog(@"TBLinerLayout exception is:%@",exception.description);
                }
            }
        }
    }
}

- (NSArray *)propertyNameList
{
    unsigned int count;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *propertyList = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++)
    {
        const char *name = property_getName(properties[i]);
        [propertyList addObject:@(name)];
    }
    
    free(properties);
    
    return propertyList;
}

#pragma mark - Custom Accessors
- (MProgressHUDView *)loadHUD
{
    if (!_loadHUD)
    {
        int tmpHeight = 64;
        int subHeight = tmpHeight;
        _loadHUD = [[MProgressHUDView alloc]initWithFrame:CGRectMake(0, tmpHeight, ScreenWidth, ScreenHeight-subHeight)];
        _loadHUD.hidden = YES;
        [self.view addSubview:_loadHUD];
    }
    else
    {
        [_loadHUD.superview bringSubviewToFront:_loadHUD];
    }
    return _loadHUD;
}

- (TRAlertToast *)alertToast
{
    if (!_alertToast)
    {
        _alertToast = [[TRAlertToast alloc]initWithFrame:CGRectMake(0, (ScreenHeight - 64)/2.0 - 30, ScreenWidth, 60)];
        _alertToast.tag = 10000;
    }
    return _alertToast;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
