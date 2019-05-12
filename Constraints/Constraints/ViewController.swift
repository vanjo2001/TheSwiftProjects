//
//  ViewController.swift
//  Constraints
//
//  Created by IvanLyuhtikov on 5/11/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel: UILabel!
    var maxLenght: CGSize!
    var valueForLabel: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        maxLenght = self.view.bounds.size
        optionLabel()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        valueForLabel = !valueForLabel
        myLabel.isHidden = valueForLabel
        
    }
    
    func optionLabel() {
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: maxLenght.width, height: 100))
        myLabel.backgroundColor = .cyan
        myLabel.textAlignment = .center
        myLabel.text = "Hello Swift! And bla bla bla bla. More text"
        myLabel.numberOfLines = 0
        myLabel.textColor = UIColor.init(red: 0.4, green: 0.2, blue: 0.7, alpha: 1.0)
        myLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
        myLabel.isHidden = valueForLabel
        view.addSubview(myLabel)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}



