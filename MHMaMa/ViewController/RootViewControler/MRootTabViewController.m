//
//  MRootTabViewController.m
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/12/19.
//  Copyright © 2016年 李沛然. All rights reserved.
//

#import "MRootTabViewController.h"
#import "MHomeViewController.h"
#import "MMyViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"

@interface MRootTabViewController ()

@end

@implementation MRootTabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setRootViewController];
    [self setSystemTabBars];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setRootViewController
{
    MHomeViewController *tmpVc1 = [[MHomeViewController alloc]initWithNibName:@"MHomeViewController" bundle:nil];
    tmpVc1.haveMyNavBar = YES;
    tmpVc1.noMyNavBarBackBtn = YES;
    tmpVc1.view.backgroundColor = k_FFFFFF;
    UINavigationController *tmpNavVc1 = [[BaseNavigationController alloc]initWithRootViewController:tmpVc1];
    tmpNavVc1.navigationBarHidden = YES;
 
  
    MMyViewController *tmpVc2 = [[MMyViewController alloc]initWithNibName:@"MMyViewController" bundle:nil];
//    tmpVc3.haveMyNavBar = YES;
//    tmpVc3.noMyNavBarBackBtn = YES;
    tmpVc2.view.backgroundColor = k_FFFFFF;
    UINavigationController *tmpNavVc2 = [[BaseNavigationController alloc]initWithRootViewController:tmpVc2];
    tmpNavVc2.navigationBarHidden = YES;

    [self setViewControllers:[NSArray arrayWithObjects:tmpNavVc1,tmpNavVc2, nil]];
}

- (void)setSystemTabBars
{
    [[[[self tabBar] items] objectAtIndex:0]setImage:[[UIImage imageNamed:@"home_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [[[[self tabBar] items] objectAtIndex:0]setSelectedImage:[[UIImage imageNamed:@"home_home_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [[[[self tabBar] items] objectAtIndex:0] setImageInsets:UIEdgeInsetsMake(-20, 0, 20, 0)];
    [[[[self tabBar] items] objectAtIndex:0] setTitle:@"首页"];
    
    [[[[self tabBar] items] objectAtIndex:1]setImage:[[UIImage imageNamed:@"home_cate_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [[[[self tabBar] items] objectAtIndex:1]setSelectedImage:[[UIImage imageNamed:@"home_cate_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [[[[self tabBar] items] objectAtIndex:1] setImageInsets:UIEdgeInsetsMake(-20, 0, 20, 0)];
    [[[[self tabBar] items] objectAtIndex:1] setTitle:@"我的"];
    
//    [[[[self tabBar] items] objectAtIndex:2]setImage:[[UIImage imageNamed:@"home_person_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [[[[self tabBar] items] objectAtIndex:2]setSelectedImage:[[UIImage imageNamed:@"home_person_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
////    [[[[self tabBar] items] objectAtIndex:2] setImageInsets:UIEdgeInsetsMake(-20, 0, 20, 0)];
//    [[[[self tabBar] items] objectAtIndex:2] setTitle:@"我的"];
    
    [self loadTabbarStyle];
}

- (void)loadTabbarStyle
{
    [[UIBarButtonItem appearance] setBackgroundImage:[[UIImage alloc] init] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName ,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       k_B5B5B5, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       k_F58262, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];//224,103,36
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
