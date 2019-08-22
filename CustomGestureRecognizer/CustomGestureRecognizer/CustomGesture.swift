//
//  CustomGesture.swift
//  CustomGestureRecognizer
//
//  Created by IvanLyuhtikov on 8/11/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

enum CheckmarkPhases {
    case notStarted
    case initialPoint
    case downStroke
    case upStroke
}
class CheckmarkGestureRecognizer : UIGestureRecognizer {
    var strokePhase : CheckmarkPhases = .notStarted
    var initialTouchPoint : CGPoint = CGPoint.zero
    var trackedTouch : UITouch? = nil
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        if touches.count != 1 {
            self.state = .failed
        }
        // Capture the first touch and store some information about it.
        if self.trackedTouch == nil {
            self.trackedTouch = touches.first
            self.strokePhase = .initialPoint
            self.initialTouchPoint = (self.trackedTouch?.location(in: self.view))!
        } else {
            // Ignore all but the first touch.
            for touch in touches {
                if touch != self.trackedTouch {
                    self.ignore(touch, for: event)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        let newTouch = touches.first
        
        guard newTouch == self.trackedTouch else {
            self.state = .failed
            return
        }
        
        let newPoint = (newTouch?.location(in: self.view))!
        let previousPoint = (newTouch?.previousLocation(in: self.view))!
        if self.strokePhase == .initialPoint {
            if newPoint.x >= initialTouchPoint.x && newPoint.y >= initialTouchPoint.y {
                self.strokePhase = .downStroke
            } else {
                self.state = .failed
            }
        } else if self.strokePhase == .downStroke {
            if newPoint.x >= previousPoint.x {
                if newPoint.y < previousPoint.y {
                    self.strokePhase = .upStroke
                }
            } else {
                self.state = .failed
            }
        } else if self.strokePhase == .upStroke {
            if newPoint.x < previousPoint.x || newPoint.y > previousPoint.y {
                self.state = .failed
                print("fail")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        let newTouch = touches.first
        let newPoint = (newTouch?.location(in: self.view))!
        // There should be only the first touch.
        guard newTouch == self.trackedTouch else {
            self.state = .failed
            return
        }
        // If the stroke was moving up and the final point is
        // above the initial point, the gesture succeeds.
        if self.state == .possible &&
            self.strokePhase == .upStroke &&
            newPoint.y < initialTouchPoint.y {
            self.state = .recognized
            print("finish")
        } else {
            self.state = .failed
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        self.initialTouchPoint = CGPoint.zero
        self.strokePhase = .notStarted
        self.trackedTouch = nil
        self.state = .cancelled
    }
    
    override func reset() {
        super.reset()
        self.initialTouchPoint = CGPoint.zero
        self.strokePhase = .notStarted
        self.trackedTouch = nil
    }
}
