//
//  ViewController.swift
//  UITextView
//
//  Created by Vanjo on 22/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var text = UITextView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatedTextView), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatedTextView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        createTextView()
    }
    
    
    func createTextView() {
        text = UITextView(frame: CGRect(x: 20, y: 100, width: view.bounds.width-40, height: view.bounds.height/2))
        text.text = "Some text..."
        text.contentInset = UIEdgeInsets(top: 100, left: 30, bottom: 0, right: 30)
        text.font = UIFont.systemFont(ofSize: 14)
        text.backgroundColor = .lightGray
        view.addSubview(text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.text.resignFirstResponder()
    }
    
    @objc func updatedTextView(param: Notification)
    {
        let userInfo = param.userInfo
        
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyBoaardFrame = view.convert(getKeyboardRect, to: view.window)
        
        if param.name == UIResponder.keyboardWillHideNotification
        {
            text.contentInset = UIEdgeInsets.zero
        }
        else
        {
            text.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoaardFrame.height, right: 0)
            text.scrollIndicatorInsets = text.contentInset
        }
        text.scrollRangeToVisible(text.selectedRange)
        
        
    }


}

