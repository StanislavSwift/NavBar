//
//  AppDelegate.swift
//  NavBar
//
//  Created by Stanislav on 31.01.2020.
//  Copyright © 2020 Stanislav. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        window?.backgroundColor = .clear
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let mainVC = storyboard.instantiateInitialViewController() as? ViewController else{
            fatalError("failed to load storyboard file.")
        }
        
        let firstBar = MainNavigation()
        let testVC = UIViewController()
        testVC.view.backgroundColor = .lightGray
        firstBar.viewControllers = [mainVC] // [testVC]
        firstBar.tabBarItem.title = "First"
        
        let secondBar = UIViewController()
        secondBar.tabBarItem.title = "Second"
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([firstBar, secondBar], animated: true)
        
        self.window?.rootViewController = tabBar
        
        self.window?.makeKeyAndVisible()
        
        
        // MARK: - Navigation Controller Customization
        
        // MARK: Back Button Item
        
//        /// Set Back Button
//        UINavigationBar.appearance().backIndicatorImage = R.image.navbarIconBack()
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = R.image.navbarIconBack()
//        /// Set Back Button title position
//
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 4, vertical: 0), for:UIBarMetrics.default)
//        /// Set BG Color
//        UINavigationBar.appearance().barTintColor   = .white
//        UINavigationBar.appearance().isTranslucent  = false
//        /// Set tint colors
//        UINavigationBar.appearance().tintColor      = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.09019607843, alpha: 1)
//        // navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
//        UINavigationBar.appearance().titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1),
//            NSAttributedString.Key.font: R.font.sfProTextRegular(size: 16)
//        ]
//
//        UINavigationBar.appearance().clipsToBounds = false
        
        return true
    }
}
