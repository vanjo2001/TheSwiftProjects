//
//  ViewController.swift
//  Lesson8UIActivityViewController
//
//  Created by Vanjo on 13/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var button = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton()
        createTextField()
        
    }
    
    //MARK: Methods
    
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        textField.center = self.view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "введите текст"
        textField.delegate = self
        view.addSubview(textField)
        
    }
    
    func createButton() {
        button = UIButton(type: .roundedRect)
        self.button.frame = CGRect(x: 100, y: 200, width: 100, height: 75)
        self.button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(handlerShare), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func handlerShare(paramSender: Any) {
        let text = textField.text
        
        if text?.count == 0 {
            let alert = UIAlertController(title: "Внимание", message: "Введите что-нибуд!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ок", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        self.present(activityViewController!, animated: true, completion: nil)
    }
    
    //MARK: Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }

}

