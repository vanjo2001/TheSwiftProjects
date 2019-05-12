//
//  ViewController.swift
//  Anything
//
//  Created by Vanjo on 08/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tupButton(_ sender: UIButton) {
        self.myAlert(name: "Warning!", message: "Enter Password", style: .alert)
    }
    
    func myAlert(name: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: name, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            let text = alert.textFields?.first?.text
            self.label.text! = text ?? "nil"
        }
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

