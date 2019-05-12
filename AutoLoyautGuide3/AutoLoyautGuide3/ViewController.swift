//
//  ViewController.swift
//  AutoLoyautGuide3
//
//  Created by Vanjo on 22/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .red
        return myView
    }()
    
    let blueView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .blue
        return myView
    }()
    
    let greenView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .green
        return myView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(greenView)
        createViewRedConstrain()
        createViewBlueConstrain()
        createViewGreenConstrain()
    }
    
    func createViewRedConstrain() {
        redView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    func createViewBlueConstrain() {
        blueView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        blueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    func createViewGreenConstrain() {
        greenView.rightAnchor.constraint(equalTo: blueView.rightAnchor).isActive = true
        greenView.leftAnchor.constraint(equalTo: redView.leftAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: redView.topAnchor, constant: -20).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }


}

