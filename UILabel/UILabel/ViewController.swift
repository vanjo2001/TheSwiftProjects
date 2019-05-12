//
//  ViewController.swift
//  UILabel
//
//  Created by Vanjo on 17/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 0, y: 0, width: 200, height: 23)
        label.frame = labelFrame
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Swift is amazing! and.........................................................................."
        label.textColor = .black
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }


}

