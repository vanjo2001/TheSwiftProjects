//
//  ViewController.swift
//  Lesson5UIPickerDate2
//
//  Created by Vanjo on 10/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.center = self.view.center
        
        datePicker.datePickerMode = .date
        
        self.view.addSubview(datePicker)
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        
        let todayDate = Date()
        
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYeatFromToday = todayDate.addingTimeInterval(-14 * oneYearTime)
        
        datePicker.maximumDate = twoYeatFromToday
        
        datePicker.addTarget(self, action: #selector(dateChangedPick(value:)), for: .valueChanged)
        
    }
    
    @objc func dateChangedPick(value: UIDatePicker) {
        if value.date <= Date(timeIntervalSinceNow: -18*365*24*60*60) {
            print("You have come of age")
        }
    }


}

