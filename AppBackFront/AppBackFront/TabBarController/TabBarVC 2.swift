//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 07/06/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        // Estamos falando que nossa home é uma navigation controller.
        let home = UINavigationController(rootViewController: HomeVC())
        let wallet = UINavigationController(rootViewController: WalletVC())
        let profile = UINavigationController(rootViewController: ProfileVC())
        setViewControllers([home, wallet, profile], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        
        let tabBarAppearence: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearence.configureWithDefaultBackground()
        tabBarAppearence.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        UITabBar.appearance().standardAppearance = tabBarAppearence
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearence
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "trash")
        items[1].image = UIImage(systemName: "wallet.pass")
        items[2].image = UIImage(systemName: "person")
    }
}
