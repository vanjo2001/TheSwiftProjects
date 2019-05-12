//
//  ViewController.swift
//  viewshka
//
//  Created by Vanjo on 27/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var viewSquare = UIView()
    var myScroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSquare = UIView(frame: CGRect.init(x: 200, y: 100, width: 100, height: 200))
        myScroll = UIScrollView(frame: viewSquare.bounds)
        myScroll.isPagingEnabled = true
        myScroll.backgroundColor = .blue
        myScroll.delegate = self
        myScroll.contentSize = CGSize(width: viewSquare.bounds.width*2, height: viewSquare.bounds.height)
        viewSquare.addSubview(myScroll)
        view.addSubview(viewSquare)
        
    }
    
    //End scrolling
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.alpha = 1
        print(scrollView.contentOffset.x)
        if scrollView.contentOffset.x == 100
        {
            scrollView.backgroundColor = .green
        }
        else
        {
            scrollView.backgroundColor = .blue
        }
        print("end")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        scrollView.alpha = 1
    }
    
    //Scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.alpha = 0.5
        print("scrolling")
    }


}

