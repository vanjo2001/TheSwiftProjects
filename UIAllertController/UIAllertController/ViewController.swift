//
//  ViewController.swift
//  UIAllertController
//
//  Created by Vanjo on 08/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Label", message: "Hello World!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

