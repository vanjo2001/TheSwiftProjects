//
//  ViewController.swift
//  UITubBarController
//
//  Created by Vanjo on 17/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First VC"
        
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
        
        view.backgroundColor = .lightGray
    }


}

