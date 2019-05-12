//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vanjo on 11/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var touchCount = TicTacToe.X
    var whoWin = String()
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    var presently = TicTacToe.nothing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

    enum TicTacToe: String {
        case X = "X"
        case O = "O"
        case nothing = ""
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        
        if sender.titleLabel?.text == nil {
            print("tup")
            sender.setTitle(changeSymbol(), for: .normal)
            if winPosition(send: buttonCollection) {
                let alert = UIAlertController(title: "Игра Окончена!", message: whoWin, preferredStyle: .alert)
                let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true)
                clearBoard()
            } else if isDraw(arr: buttonCollection) {
                let alert = UIAlertController(title: "Игра Окончена!", message: "НИЧЬЯ", preferredStyle: .alert)
                let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true)
                clearBoard()
            }
        }
    }
    
    func changeSymbol() -> TicTacToe.RawValue {
        let temp = touchCount
        if touchCount == .X {
            touchCount = .O
            return temp.rawValue
        } else {
            touchCount = .X
            return temp.rawValue
        }
    }
    
    func winPosition(send: [UIButton]!) -> Bool {
        switch send {
        case _ where send[0].titleLabel?.text == "X" && send[4].titleLabel?.text == "X" && send[8].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[1].titleLabel?.text == "X" && send[4].titleLabel?.text == "X" && send[7].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[0].titleLabel?.text == "X" && send[3].titleLabel?.text == "X" && send[6].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[2].titleLabel?.text == "X" && send[5].titleLabel?.text == "X" && send[8].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[0].titleLabel?.text == "X" && send[1].titleLabel?.text == "X" && send[2].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[3].titleLabel?.text == "X" && send[4].titleLabel?.text == "X" && send[5].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[6].titleLabel?.text == "X" && send[7].titleLabel?.text == "X" && send[8].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
        case _ where send[2].titleLabel?.text == "X" && send[4].titleLabel?.text == "X" && send[6].titleLabel?.text == "X":
            whoWin = "X WIN!"
            return true
            
        case _ where send[1].titleLabel?.text == "O" && send[4].titleLabel?.text == "O" && send[7].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
        case _ where send[0].titleLabel?.text == "O" && send[3].titleLabel?.text == "O" && send[6].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
        case _ where send[2].titleLabel?.text == "O" && send[5].titleLabel?.text == "O" && send[8].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
        case _ where send[0].titleLabel?.text == "O" && send[1].titleLabel?.text == "O" && send[2].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
        case _ where send[3].titleLabel?.text == "O" && send[4].titleLabel?.text == "O" && send[5].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
        case _ where send[6].titleLabel?.text == "O" && send[7].titleLabel?.text == "O" && send[8].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
        case _ where send[2].titleLabel?.text == "O" && send[4].titleLabel?.text == "O" && send[6].titleLabel?.text == "O":
            whoWin = "O WIN!"
            return true
            
        default:
            return false
        }
    }
    
    func isDraw(arr: [UIButton]!) -> Bool {
        for i in 0..<arr.count {
            if arr[i].titleLabel?.text == nil {
                return false
            }
        }
        return true
    }
    
    func clearBoard() {
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle(nil, for: .normal)
        }
    }

}
