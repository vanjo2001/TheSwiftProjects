//
//  ViewController.swift
//  BridgePatternInPractice
//
//  Created by IvanLyuhtikov on 8/12/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayPicker: DayPickerView!
    let array = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    typealias Storage = Array<Set<Int8>>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPicker.dataSource = self
        
        let path = Bundle.main.url(forResource: "Secret", withExtension: "txt")
        guard let pathg = path else { return }
        print("\n\n\(pathg)\n\n")
        let data = try? Data(contentsOf: pathg)
        print(data!.count)
        
        do {
            let value = try checkValue(0)
            print(value)
        } catch MyError.negativeValue {
            print("negative")
        } catch MyError.zeroValue {
            print("zero")
        } catch {
            print(error.localizedDescription)
        }
        
        
    }


}

extension ViewController: DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        return 7
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        return array[indexPath.row]
    }
    
    
}

