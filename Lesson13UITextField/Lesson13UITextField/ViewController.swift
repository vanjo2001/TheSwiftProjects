//
//  ViewController.swift
//  Lesson13UITextField
//
//  Created by Vanjo on 19/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let myField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myField.delegate = self
        createTextField()
        myField.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
        
//        NotificationCenter.default.addObserver(self, selector: #selector(textDidChangeNotification), name: UITextField.textDidChangeNotification, object: nil)
        
    }
    
    //MARK: create TextField
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myField.frame = textFieldFrame
        myField.borderStyle = .roundedRect
        myField.contentVerticalAlignment = .center
        myField.textAlignment = .center
        myField.placeholder = "I Swift Developer 2018!"
        myField.center = view.center
        view.addSubview(self.myField)
    }
    //MARK: Notification
    @objc func textDidChangeNotification(ncParam: NSNotification) {
        print("textDidChangeNotification \(ncParam)")
    }
    
    
    
    //MARK: methods delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing = это я решаю можно ли редактировать")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing = внимание началось редактирование")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing = внимание закончилось редактирование")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn вы ввели - \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear = ты что то очистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn = хотите убрать клавиатуру")
        myField.resignFirstResponder()
        return true
    }


}

