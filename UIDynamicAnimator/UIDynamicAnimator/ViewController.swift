//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by Vanjo on 08/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UICollisionBehavior
    //UIGravityBehavior
    //UIPushBehavior
    //UISnapBehaivor
    
//    let myView = UIView()
//    var animator = UIDynamicAnimator()
    
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        
        /*
        myView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.center = view.center
        myView.backgroundColor = .green
        view.addSubview(myView)
         
        Создание аниматора и гравитации
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [myView])
        animator.addBehavior(gravity)
        */
        
        let colors = [UIColor.green, UIColor.cyan]
        var positionCent: CGPoint = view.center
        let viewSize = CGSize(width: 50, height: 50)
        
        for i in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height))
            newView.backgroundColor = colors[i]
            newView.center = positionCent
            positionCent.y += viewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
            
        }
        animator = UIDynamicAnimator(referenceView: view)
        
        //Создаем тяготение
        let gravity = UIGravityBehavior(items: squareViews)

        animator.addBehavior(gravity)
        
        //Cоздаем границы
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
//        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0,
//                                                                                           y: view.bounds.size.height-100),
//                              to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height-100))
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    }

}

extension ViewController: UICollisionBehaviorDelegate {

    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("i join")
        let identifier = identifier as? String
        let indefBoundary = "bottomBoundary"
        if identifier == indefBoundary {
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = UIColor.red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 10, y: 10)
            }) { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            }
        }
    }
}

