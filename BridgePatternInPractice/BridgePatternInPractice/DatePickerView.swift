//
//  DatePickerView.swift
//  BridgePatternInPractice
//
//  Created by IvanLyuhtikov on 8/12/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

protocol DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

class DayPickerView: UIControl {
    public var dataSource: DayPickerViewDataSource? {
        didSet {
            setupView()
        }
    }
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    func setupView() {
        let count = dataSource?.dayPickerCount(self)
        
        for item in 0..<count! {
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectorMethode), for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
    }
    
    @objc func selectorMethode(sender: UIButton) {
        for one in buttons {
            one.isSelected = false
        }
        let button = buttons[sender.tag]
        button.isSelected = true
    }
}
