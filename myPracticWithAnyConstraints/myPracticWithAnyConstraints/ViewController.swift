//
//  ViewController.swift
//  myPracticWithAnyConstraints
//
//  Created by IvanLyuhtikov on 5/15/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var view1: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .red
        self.view.addSubview(view1)
        lau()
        
    }
    
    func lau() {
        NSLayoutConstraint(item: view1!,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: 25).isActive = true
        
        NSLayoutConstraint(item: view1!,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -25).isActive = true
        
        NSLayoutConstraint(item: view1!,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 25).isActive = true
        
        NSLayoutConstraint(item: view1!,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .right,
                           multiplier: 1,
                           constant: -25).isActive = true
    }


}

