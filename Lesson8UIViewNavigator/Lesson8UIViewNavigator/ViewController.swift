//
//  ViewController.swift
//  Lesson8UIViewNavigator
//
//  Created by Vanjo on 15/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displaySecondButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displaySecondButton = UIButton(type: .system)
        self.displaySecondButton.setTitle("Second VC", for: .normal)
        self.displaySecondButton.sizeToFit()
        displaySecondButton.center = self.view.center
        displaySecondButton.addTarget(self, action: #selector(draggingSecondViewController(param:)), for: .touchUpInside)
        view.addSubview(displaySecondButton)
        
        self.title = "First ViewController"
    }

    @objc func draggingSecondViewController(param: Any) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}

