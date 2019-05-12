//
//  ViewController.swift
//  Lesson7UISegmentControll
//
//  Created by Vanjo on 13/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segment = UISegmentedControl()
    let imageView = UIImageView()
    
    let menuArray = ["one", "two", "three"]
    var imageArray = [UIImage(named: "Bulgasari.png"),
                      UIImage(named: "Haechi.png"),
                      UIImage(named: "Weyland.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = self.view.center
        imageView.image = imageArray[0]
        view.addSubview(imageView)
        
        self.segment = UISegmentedControl(items: menuArray)
        segment.frame = CGRect(x: 100, y: 500, width: 200, height: 40)
        self.view.addSubview(segment)
        
        segment.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
        
    }
    
    @objc func changeSegment(seg: UISegmentedControl) {
        if seg == segment {
            let index = seg.selectedSegmentIndex
            
            self.imageView.image = imageArray[index]
            let pr = seg.titleForSegment(at: index)
            print(pr ?? "")
        }
    }


}

