//
//  ViewController.swift
//  UISwitch
//
//  Created by Vanjo on 09/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mySwitch = UISwitch()
    let mySwitchWithMoreColor = UISwitch()
    let myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myButton.frame = CGRect(x: 100, y: 350, width: 200, height: 100)
        self.myButton.backgroundColor = .orange
        self.myButton.setTitle("OK", for: .normal)
        self.myButton.setTitle("button PRESSED", for: .highlighted)
        
        self.view.addSubview(self.myButton)
        
        
        //Создали свич!
        
        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        self.view.addSubview(self.mySwitch)
        
        
        self.mySwitchWithMoreColor.frame = CGRect.zero
        self.mySwitchWithMoreColor.center = view.center
        self.view.addSubview(mySwitchWithMoreColor)
        mySwitchWithMoreColor.tintColor = .orange
        mySwitchWithMoreColor.thumbTintColor = .red
        self.mySwitchWithMoreColor.onTintColor = .blue
        
        //On
        self.mySwitch.setOn(true, animated: true)
        
        
        
        self.mySwitch.addTarget(self, action: #selector(swichChanged(paramTarget:)), for: .valueChanged)
        self.mySwitchWithMoreColor.addTarget(self, action: #selector(switch2), for: .valueChanged)
        
       }
    
    @objc func swichChanged(paramTarget: UISwitch) {
        if paramTarget.isOn {
            self.view.backgroundColor = .black
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    @objc func switch2(paramT: UISwitch) {
        if paramT.isOn {
            self.myButton.isUserInteractionEnabled = false
        } else {
            self.myButton.isUserInteractionEnabled = true
        }
    }
    


}

