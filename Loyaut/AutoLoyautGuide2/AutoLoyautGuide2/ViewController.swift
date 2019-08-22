//
//  ViewController.swift
//  AutoLoyautGuide2
//
//  Created by Vanjo on 22/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myRedView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .red
        return myView
    }()
    
    var myBlueView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .blue
        return myView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myRedView)
        view.addSubview(myBlueView)
        
        let viewVFL = ["myRedView": myRedView, "myBlueView": myBlueView]
        let metrics = ["height": 100, "width": self.view.bounds.width/3, "top": view.bounds.height/2]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[myRedView(height)]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[myBlueView(height)]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[myRedView(width)]-(50)-[myBlueView(width)]-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
    }


}

