//
//  ViewController.swift
//  GCDAsyncAfter
//
//  Created by IvanLyuhtikov on 4/1/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        afterBlock(seconds: 2, queue: .global()) {
            print("Hello")
            print(Thread.current)
        }
        
        afterBlock(seconds: 4) {
            print("Hello")
            print(Thread.current)
        }
        */
        
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(), completion: @escaping () -> ()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }

}

