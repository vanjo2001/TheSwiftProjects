//
//  ViewController.swift
//  HideKeyboard
//
//  Created by Vanjo on 13/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.frame = CGRect(x: 0, y: 0, width: 250, height: 30)
        textField.center = self.view.center
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        self.textField.delegate = self
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

