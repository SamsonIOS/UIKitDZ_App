//
//  SceneDelegate.swift
//  UIKitDZ_App
//
//  Created by coder on 05.10.2022.
//

import UIKit

/// Scene Delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        
            let userDefaults = UserDefaults.standard
            
            if userDefaults.object(forKey: "user") != nil {
                let tabBarVC = TabBarController()
                self.window?.rootViewController = tabBarVC
        } else {
            let pageVC = PageViewController()
            self.window?.rootViewController = pageVC
        }
            window?.makeKeyAndVisible()
           
    }
}
