//
//  AppDelegate.swift
//  MWN_user_2016
//
//  Created by zhang on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        NSThread.sleepForTimeInterval(2.0)
        
        UITabBar.appearance().tintColor = COLOR
        UINavigationBar.appearance().barTintColor = COLOR
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().translucent = false
        if let barFont = UIFont(name: "ChalkboardSE-Bold", size: 18){
            UINavigationBar.appearance().titleTextAttributes = [
                NSForegroundColorAttributeName:UIColor.whiteColor(),
                NSFontAttributeName : barFont
            ]
        }
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: UIBarMetrics.Default)
        
//        let userid = NSUserDefaults.standardUserDefaults()
//        userid.removeObjectForKey("userid")
//        
        // 设置Appkey
        UMSocialData.setAppKey("57468e9267e58ebf5e0029a3")
        
//        新浪微博登录
        //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。若在新浪后台设置我们的回调地址，“http://sns.whalecloud.com/sina2/callback”，这里可以传nil
        UMSocialSinaSSOHandler.openNewSinaSSOWithAppKey("3982229382", secret: "cec4763673b38b42269c5ad1c80747e2", redirectURL: nil)
//    http://weibo.com/u/3230871010/home?wvr=5
        
//        微信登录
        UMSocialWechatHandler.setWXAppId("wxf23f4ac82a5a53bf", appSecret: "fbcc07d7ed56e87ddd160dfe1de60e24", url: "http://www.umeng.com/social")
        
//        self.loginCheck()
        
        return true
    }

    func loginCheck(){
        
        let infoDictionary = NSBundle.mainBundle().infoDictionary
        let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
        // 取出之前保存的版本号
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let appVersion = userDefaults.stringForKey("appVersion")
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 如果 appVersion 为 nil 说明是第一次启动；如果 appVersion 不等于 currentAppVersion 说明是更新了
        if appVersion == nil || appVersion != currentAppVersion {
            // 保存最新的版本号
            userDefaults.setValue(currentAppVersion, forKey: "appVersion")
            
//            let guideViewController = storyboard.instantiateViewControllerWithIdentifier("scrollView") as! ScrollViewController
//            self.window?.rootViewController = guideViewController
        }
            
            
        else{
            let userid = NSUserDefaults.standardUserDefaults()
            //let uid = userid.valueForKey("userid")
            var segueId = "MainView"
            if((userid.valueForKey("userid") == nil) || (userid.valueForKey("userid")?.length == 0 ))
            {
                segueId = "LoginView"
                self.window?.rootViewController = self.window?.rootViewController?.storyboard?.instantiateViewControllerWithIdentifier(segueId)
                
            }
            else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tableBarController = storyboard.instantiateViewControllerWithIdentifier(segueId) as! UITabBarController
//                let tableBarItem = tableBarController.tabBar.items![2]
//                tableBarItem.badgeValue = "3"
                self.window?.rootViewController = tableBarController
                
            }
        }
    }
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        let result = UMSocialSnsService.handleOpenURL(url)
        if result == false {
            
        }
        return result
        
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return UMSocialSnsService.handleOpenURL(url)
    }
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return UMSocialSnsService.handleOpenURL(url)
    }

}

