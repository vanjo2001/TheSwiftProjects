//
//  ViewController.swift
//  CustomGestureRecognizer
//
//  Created by IvanLyuhtikov on 8/11/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(CheckmarkGestureRecognizer(target: self, action: #selector(pr)))
    }
    
    @objc func pr() {
        print("finish")
//        view.backgroundColor = UIColor.init(red: CGFloat.random(in: 0.0..<0.256), green: CGFloat.random(in: 0.0..<0.256), blue: CGFloat.random(in: 0.0..<0.256), alpha: 1.0)
    }


}

