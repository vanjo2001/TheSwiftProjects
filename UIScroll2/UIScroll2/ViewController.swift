//
//  ViewController.swift
//  UIScroll2
//
//  Created by Vanjo on 26/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myScrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coltImage = UIImage(named: "Colt_Skin-Default")
        let frankImage = UIImage(named: "Frank_Skin-Caveman")
        let pennyImage = UIImage(named: "Penny_Skin-Default")
        
        //Create scroll
        let scrollViewRect = self.view.bounds
        myScrollView = UIScrollView(frame: scrollViewRect)
        myScrollView.isPagingEnabled = true
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        self.view.addSubview(myScrollView)
        
        //Create ImageView
        var imageViewRect = view.bounds
        print(imageViewRect)
        let coltImageView = newImageViewWithImage(param: coltImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(coltImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        print(imageViewRect)
        let frankImageView = newImageViewWithImage(param: frankImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(frankImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        print(imageViewRect)
        let pennyImageView = newImageViewWithImage(param: pennyImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(pennyImageView)
    }

    func newImageViewWithImage(param: UIImage, paramFrame: CGRect) -> UIImageView
    {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = param
        return result
    }

}

