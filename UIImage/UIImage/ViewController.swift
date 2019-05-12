//
//  ViewController.swift
//  UIImage
//
//  Created by Vanjo on 26/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myImageView = UIImageView()
    let macBookImage = UIImage(named: "macbook-pro-15-2018")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView = UIImageView(frame: self.view.bounds)
        myImageView.contentMode = .scaleAspectFill
        myImageView.image = macBookImage
        myImageView.layer.borderWidth = 2
        myImageView.layer.cornerRadius = 50
        myImageView.clipsToBounds = true
        myImageView.center = view.center
        view.addSubview(myImageView)
        
    }


}

