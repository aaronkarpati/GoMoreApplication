//
//  TabBarController.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 02..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeViewController = HomeViewController()
        let searchViewController = SearchViewController()
        let messagesViewController = MessagesViewController()
        let accountViewController = AccountViewController()
        
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        messagesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        accountViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        
        let tabBarList = [homeViewController, searchViewController, messagesViewController, accountViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
