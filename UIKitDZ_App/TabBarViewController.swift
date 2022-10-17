//
//  TabBarViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 14.10.2022.
//

import UIKit

/// Tab Bar Controller
final class TabBarController: UITabBarController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }
    
    // MARK: - Private Method
    private func createViewController(viewController: UIViewController,
                                      titel: String,
                                      image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navController.tabBarItem.title = titel
        navController.tabBarItem.image = UIImage(systemName: image)
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        
        viewController.navigationItem.title = titel
        
        tabBar.backgroundColor = UIColor(red: 18.0/255,
                                         green: 18.0/255,
                                         blue: 18.0/255,
                                         alpha: 1.0)
        return navController
    }
    
    private func setViewController() {
        viewControllers = [
            createViewController(viewController: BuyViewController(),
                                 titel: "КУПИТЬ",
                                 image: "laptopcomputer.and.iphone"),
            createViewController(viewController: ForUsViewController(),
                                 titel: "ДЛЯ ВАС", image: "person.circle"),
            createViewController(viewController: SearchViewController(),
                                 titel: "ПОИСК", image: "magnifyingglass"),
            createViewController(viewController: BasketViewController(),
                                 titel: "КОРЗИНА",
                                 image: "bag")
        ]
    }
}
