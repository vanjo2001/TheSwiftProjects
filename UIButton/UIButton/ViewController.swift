//
//  ViewController.swift
//  UIButton
//
//  Created by Vanjo on 25/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 44)
        myButton.setTitle("Press me", for: .normal)
        myButton.setTitle("I pressed", for: .highlighted)
        myButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
        self.view.addSubview(myButton)
        
    }

    @objc func buttonIsPressed(sender: UIButton)
    {
        
        print("Button pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton)
    {
        print("button Is Tapped")
    }
    

}

