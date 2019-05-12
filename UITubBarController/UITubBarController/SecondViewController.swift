//
//  SecondViewController.swift
//  UITubBarController
//
//  Created by Vanjo on 17/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Second VC"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.tabBarItem = tabBarItem
        
        view.backgroundColor = .blue
    }


}
