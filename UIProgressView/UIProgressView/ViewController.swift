//
//  ViewController.swift
//  UIProgressView
//
//  Created by Vanjo on 30/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private var myProgressView = UIProgressView()
    private var myButton = UIButton()
    private var myTime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProgress(myProgressView)
        createButton(myButton)
        createTimer()
        
        
    }
    
    private func createTimer() {
        myTime = Timer.scheduledTimer(timeInterval: 1,
                                      target: self, selector: #selector(updateProgressView),
                                      userInfo: nil, repeats: true)
    }
    
    private func createProgress(_ ProgressView: UIProgressView) {
        ProgressView.progressViewStyle = .bar
        ProgressView.frame = CGRect(x: view.center.x,
                                    y: view.center.y,
                                    width: 100, height: 20)
        ProgressView.setProgress(0.0, animated: false)
        ProgressView.tintColor = .green
        ProgressView.trackTintColor = .blue
        ProgressView.center = view.center
        view.addSubview(ProgressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.width/2-50,
                              y: view.bounds.height/2+100,
                              width: 100, height: 60)
        button.setTitle("Loading...", for: .normal)
        button.backgroundColor = .lightGray
        view.addSubview(button)
    }
    
    //MARK: - Selector
    
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.backgroundColor = .red
                self.myButton.setTitle("Compleate!", for: .normal)
                self.myTime.invalidate()
            }
        }
    }


}

