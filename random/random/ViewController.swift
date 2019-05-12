//
//  ViewController.swift
//  random
//
//  Created by Vanjo on 29/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var arrImage = [UIImage]()
    var imageView = UIImageView()
    var button = UIButton()
    var myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameLabel = CGRect(x: 100, y: 120, width: 150, height: 50)
        myLabel = UILabel(frame: frameLabel)
        
        
        view.addSubview(myLabel)
        arrImage = [UIImage(named: "Colt_Skin-Default")!, UIImage(named: "Frank_Skin-Caveman")!, UIImage(named: "Penny_Skin-Default")!]
        let frame = view.bounds
        myLabel.font = UIFont.systemFont(ofSize: 40)
        let frame2 = CGRect(x: 100, y: 200, width: 200, height: 300)
        print(frame)
        button = UIButton(frame: frame2)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonSelector(param:)), for: .touchUpInside)
    }
    
    @objc func buttonSelector(param: UIButton) {
        button.setImage(arrImage[Int.random(in: 0..<3)], for: .normal)
        switch param.currentImage {
        case arrImage[0]:
            myLabel.text = "Colt"
        case arrImage[1]:
            myLabel.text = "Frank"
        default:
            myLabel.text = "Penny"
        }
    }
    


}

