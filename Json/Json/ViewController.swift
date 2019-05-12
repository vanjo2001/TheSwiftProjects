//
//  ViewController.swift
//  Json
//
//  Created by Vanjo on 28/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString = "https://kbp.by/json/JSONdata_swift4.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let date = data else { return }
            guard error == nil else { return }
        }
        
    }


}

