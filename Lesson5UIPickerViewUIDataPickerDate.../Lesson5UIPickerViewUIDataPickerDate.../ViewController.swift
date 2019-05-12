//
//  ViewController.swift
//  Lesson5UIPickerViewUIDataPickerDate...
//
//  Created by Vanjo on 10/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.center = view.center
        
        //Подписаться
        picker.dataSource = self
        picker.delegate = self
        
        self.view.addSubview(picker)
        
    }


}

extension ViewController: UIPickerViewDataSource {
    
    //Сколько компонетов надо создать
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row - \(row)"
        return result
    }
}
