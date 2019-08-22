//
//  SecondViewController.swift
//  GCDAsyncAfter
//
//  Created by IvanLyuhtikov on 4/1/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        let queue = DispatchQueue.global(qos: .unspecified)
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 1000000) {
                print("\($0) times")
                print(Thread.current)
            }
        }
        */
 
        
        myInactiveQueue()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func myInactiveQueue() {
        let inactiveQueue = DispatchQueue(label: "com.vanjo", attributes: [.concurrent, .initiallyInactive])
        inactiveQueue.async {
            print("Done!")
        }
        print("Not yet started...")
        inactiveQueue.activate()
        print("Activate!")
        inactiveQueue.suspend()
        print("Pause!")
        inactiveQueue.resume()
        
    }

}
