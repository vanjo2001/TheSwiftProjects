//
//  ViewController.swift
//  twoButton
//
//  Created by Vanjo on 29/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button1 = UIButton()
    var button2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGFloat(view.frame.height/2+20)
        
        let frame1 = CGRect(x: 0, y: 20, width: view.bounds.width, height: view.bounds.height/2)
        let frame2 = CGRect(x: 0, y: frame, width: view.bounds.width, height: view.bounds.height/2)
        button1 = UIButton(frame: frame1)
        button1.backgroundColor = .blue
        
        button2 = UIButton(frame: frame2)
        button2.backgroundColor = .green
        print(button2.frame.height)
        view.addSubview(button1)
        view.addSubview(button2)
    }


}

