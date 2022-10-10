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
           
            let buyViewController = BuyViewController()
            let forUsViewController = ForUsViewController()
            let searchViewController = SearchViewController()
            let basketViewController = BasketViewController()
            
            let buyImage = UIImage(systemName: "laptopcomputer.and.iphone")
            let forUsImage = UIImage(systemName: "person.crop.circle")
            let searchImage = UIImage(systemName: "magnifyingglass")
            let basketImage = UIImage(systemName: "bag")
            
            let tabBarVC = UITabBarController()
            
            let buyNavVC = UINavigationController(rootViewController: buyViewController)
            buyNavVC.tabBarItem = UITabBarItem(title: "Купить", image: buyImage, tag: 0)
            
            let forUsNavVC = UINavigationController(rootViewController: forUsViewController)
            forUsNavVC.tabBarItem = UITabBarItem(title: "Для нас", image: forUsImage, tag: 1)
            
            let searchNavVC = UINavigationController(rootViewController: searchViewController)
            searchNavVC.tabBarItem = UITabBarItem(title: "Поиск", image: searchImage, tag: 2)
            
            let basketNavVC = UINavigationController(rootViewController: basketViewController)
            basketNavVC.tabBarItem = UITabBarItem(title: "Корзина", image: basketImage, tag: 2)
            
            tabBarVC.tabBar.backgroundColor = UIColor(red: 18.0/255, green: 18.0/255, blue: 18.0/255, alpha: 1.0)
            
            searchNavVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            tabBarVC.tabBar.tintColor = .systemBlue
            tabBarVC.tabBar.unselectedItemTintColor = .systemGray
            
            tabBarVC.setViewControllers([buyNavVC, forUsNavVC, searchNavVC, basketNavVC], animated: true)
            
            window?.rootViewController = tabBarVC
            window?.makeKeyAndVisible()
           
    }
}
