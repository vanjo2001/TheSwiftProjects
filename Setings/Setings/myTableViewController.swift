//
//  myTableViewController.swift
//  Setings
//
//  Created by Vanjo on 25/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var secondNameLable: UITextField!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var segment: UISegmentedControl!
    var usersDef = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = usersDef.object(forKey: "name") as? String {
            nameLabel.text = name
        }
        if let secondName = usersDef.object(forKey: "secondName") as? String {
            secondNameLable.text = secondName
        }
        if let segmentV = usersDef.object(forKey: "segment") as? Int {
            segment.selectedSegmentIndex = segmentV
        }
        if let mySwi = usersDef.object(forKey: "switch") {
            mySwitch.isOn = mySwi as! Bool
        }

    }
    
    @IBAction func tuppedButton(_ sender: Any) {
        usersDef.set(nameLabel.text, forKey: "name")
        usersDef.set(secondNameLable.text, forKey: "secondName")
        usersDef.set(segment.selectedSegmentIndex, forKey: "segment")
        usersDef.set(mySwitch.isOn, forKey: "switch")
    }
    
}
