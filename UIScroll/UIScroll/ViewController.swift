//
//  ViewController.swift
//  UIScroll
//
//  Created by Vanjo on 26/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    var myScrollView = UIScrollView()
    var myImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createScroll()
        
    }
    
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("You scroll")
        print(scrollView.contentOffset.y)
        scrollView.alpha = 0.50
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Вызывается после прокрутки")
        scrollView.alpha = 1.0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("вернет альфу")
        scrollView.alpha = 1.0
    }
    
    
    //MARK: Methods
    
    func createScroll()
    {
        let imageToLoad = UIImage(named: "ColtSkinDefault")
        myImageView = UIImageView(image: imageToLoad)
        myScrollView = UIScrollView(frame: self.view.bounds)
        myScrollView.addSubview(myImageView)
        myScrollView.delegate = self
        myScrollView.contentSize = myImageView.bounds.size
        view.addSubview(myScrollView)
    }


}

