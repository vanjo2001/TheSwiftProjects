//
//  ViewController.swift
//  Part2UINavigateController
//
//  Created by Vanjo on 16/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(perfAdd(param:)))
        */
        
        /*
        let mySwich = UISwitch()
        mySwich.isOn = true
        mySwich.addTarget(self, action: #selector(switchChange(param:)), for: .valueChanged)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mySwich)
        */
        createImageTitleViewImage()
//        title = "View Controller"
        
        let items = ["up", "down"]
        
        let segmetController = UISegmentedControl(items: items)
        segmetController.isMomentary = true
        segmetController.addTarget(self, action: #selector(segmentChanged(param:)), for: .valueChanged)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmetController)
    }
    
    @objc func segmentChanged(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
        
    }
    
    /*
    @objc func switchChange(param: UISwitch) {
        if param.isOn {
            print("Switch ON")
        } else {
            print("Switch OFF")
        }
    }
    */

    fileprivate func createImageTitleViewImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "apple")
        imageView.image = image
        
        self.navigationItem.titleView = imageView
    }
    
    //MARK: Method
    
    /*
    @objc func perfAdd(param: UIBarButtonItem) {
        print("click")
    }
    */
 
}

