//
//  ViewController.swift
//  UIDynamicsPart2
//
//  Created by Vanjo on 09/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var squareView = UIView()
    var squareAnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGestureRecognizer()
        createSquareView()
        createAnchorView()
        createAnimationAndBehaviors()
    }
    
    func createSquareView() {
        squareView = UIView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        squareView.backgroundColor = .cyan
        squareView.center = view.center
        squareAnchorView = UIView(frame: .init(x: 60, y: 0, width: 40, height: 40))
        squareAnchorView.backgroundColor = .red
        squareView.addSubview(squareAnchorView)
        view.addSubview(squareView)
    }
    
    //view with anchor point
    func createAnchorView() {
        anchorView = UIView(frame: .init(x: 120, y: 120, width: 40, height: 40))
        anchorView.backgroundColor = .red
        view.addSubview(anchorView)
    }

    //create register gesture
    
    func createGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleTap(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    //create attachment and collision
    func createAnimationAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)
        //collision
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior!)
    }
    
    @objc func handleTap(paramPan: UIPanGestureRecognizer) {
        let tapPoint = paramPan.location(in: view)
        attachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
        
        
    }

}

