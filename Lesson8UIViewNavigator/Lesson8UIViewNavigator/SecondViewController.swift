//
//  SecondViewController.swift
//  Lesson8UIViewNavigator
//
//  Created by Vanjo on 15/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Second ViewController"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack() {
        //navigationController?.popViewController(animated: true)
        //Получаем текущий массив контроллеров
        var curentControllerArray = self.navigationController?.viewControllers
        
        //Удаляем последний контроллер
        curentControllerArray?.removeLast()
        
        //Присвоим
        if let newController = curentControllerArray {
            self.navigationController?.viewControllers = newController
        }
        
        
    }
    
    
}
