//
//  MainView.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit

class MainView: UITabBarController {
    
    var controllers : [BaseNavigationController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.instantiateTabs()
        self.tabBar.tintColor = .primaryColor
        self.tabBar.backgroundColor = .white
    }
    
    func instantiateTabs() {
        let homeModule = HomeRouter.createHomeModule()
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), tag: 0)
        homeModule.tabBarItem = homeTabBarItem
        let homeNavController = BaseNavigationController(rootViewController: homeModule)
        self.controllers.insert(homeNavController, at: 0)

        let aboutModule = AboutRouter.createAboutModule()
        let aboutTabBarItem = UITabBarItem(title: "Sobre", image: UIImage(named: "ic_about"), tag: 1)
        aboutModule.tabBarItem = aboutTabBarItem
        let aboutNavController = BaseNavigationController(rootViewController: aboutModule)
        self.controllers.insert(aboutNavController, at: 1)
        
        self.viewControllers = self.controllers
    }
}
