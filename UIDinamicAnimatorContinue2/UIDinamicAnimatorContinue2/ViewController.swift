//
//  ViewController.swift
//  UIDinamicAnimatorContinue2
//
//  Created by Vanjo on 08/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognazer()
        createSquare()
        createAnimator()
    }
    
    //Create Square
    func createSquare() {
        squareView = UIView(frame: .init(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .cyan
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    //Create Gesture Recognazer

    func createGestureRecognazer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handler(paramTap:)))
        view.addGestureRecognizer(tap)
    }
    
    //Create Animator
    
    func createAnimator() {
        animator = UIDynamicAnimator(referenceView: view)
        
        //create behavior collison
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehavior)
        
    }
    
    @objc func handler(paramTap: UITapGestureRecognizer) {
        //Get angle View
        
        let tapPoint: CGPoint = paramTap.location(in: view)
        let centerSquareViewPoint: CGPoint = squareView.center
        let deltaX = tapPoint.x - centerSquareViewPoint.x
        let deltaY = tapPoint.y - centerSquareViewPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angle
        let distanceBetween = sqrt(pow(tapPoint.x - centerSquareViewPoint.x, 2.0) + pow(tapPoint.y - centerSquareViewPoint.y, 2.0))
        pushBehavior.magnitude = distanceBetween / 200
    }

}

