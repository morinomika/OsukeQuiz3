//
//  AppDelegate.swift
//  My project
//
//  Created by 黒田桜介 on 2020/01/11.
//  Copyright © 2020 黒田桜介. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //通知許可書の取得
        UNUserNotificationCenter.current().requestAuthorization = self
    }
}
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        //Called as part of the transition from the background to the active state; her
//        e you can undo many of the changes made on entering the background.
//        let center = UNUserNotificationCenter.current()
        center.getDelieverNotifications { (notifications: [UNNotification]) in
            for notification in notification {
                _=AlarmVC.shared.getAlarm(from: notification.request.identifier)
                NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
            }
        }
}
        
    }
extension AppDelegate: UNUserNotificationCenter, willPresent notification: UNNotification,MTLNewRenderPipelineStateWithReflectionCompletionHandler completionHandler: @escaping (UNNotificationPresentationOpitions) -> Void) {
    //アプリ起動中でもアラートと音で通知
    completionHandler([.alert, .sound])
    let uuid = notification.request.identifier
    _ = AlarmVC.shared.getAlarm(from: uuid)
    NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
}
func

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

