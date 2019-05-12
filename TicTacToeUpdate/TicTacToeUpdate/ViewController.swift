//
//  ViewController.swift
//  TicTacToeUpdate
//
//  Created by Vanjo on 12/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var butCol: [UIButton]!
    var symbol = 1
    var staticTable = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                          [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func buttonsAction(_ sender: UIButton) {
        
        if (staticTable[sender.tag-1] == 0)
        {
            
            staticTable[sender.tag - 1] = symbol
            
            if (symbol == 1)
            {
                symbol = 2
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                
                if isWin(send: sender) {
                    let alert = UIAlertController(title: "ИГРА ОКОНЧЕНА", message: "X - ВЫИГРАЛ!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                    clearBoard()
                }
                
                if (isDraw(send: sender))
                {
                    let alert = UIAlertController(title: "ИГРА ОКОНЧЕНА", message: "НИЧЬЯ!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                    clearBoard()
                }
                
            }
            else
            {
                symbol = 1
                sender.setImage(UIImage(named: "Nought.png"), for: .normal)
                
                 
                if isWin(send: sender) {
                    let alert = UIAlertController(title: "ИГРА ОКОНЧЕНА", message: "O - ВЫИГРАЛ!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                    clearBoard()
                }
 
                
                if (isDraw(send: sender))
                {
                    let alert = UIAlertController(title: "ИГРА ОКОНЧЕНА", message: "НИЧЬЯ!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                    clearBoard()
                }
            }
        }
        
        
        
    }
    
    func isWin(send: UIButton) -> Bool {
        for combination in winCombination {
            if staticTable[combination[0]] != 0 && staticTable[combination[0]] == staticTable[combination[1]] && staticTable[combination[1]] == staticTable[combination[2]] {
                return true
            }
        }
        return false
    }
    
    func isDraw(send: UIButton) -> Bool {
        for pos in staticTable {
            if pos == 0 {
                return false
            }
        }
        return true
    }
    
    func clearBoard() {
        
        staticTable = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        symbol = 1
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
            
            // ЕСЛИ ВЫ ПОДКЛЮЧАЕТЕ - (МАССИВ OUTLET КНОПОК) ТО МОЖНО ИСПОЛЬЗОВАТЬ ЭТОТ МЕТОД -
//            butCol[i].setImage(nil, for: .normal)
        }
    }
    
}

