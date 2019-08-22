//
//  ViewController.swift
//  DataSourcee
//
//  Created by IvanLyuhtikov on 8/17/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import Alamofire

class ViewController: UIViewController {
    
    
    let userDef = UserDefaults.standard
    let dispatchGroup = DispatchGroup()
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surName: UITextField!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myLabel: UILabel!
    
    var currenWeather = AnyCity()
    let locationManager = CLLocationManager()
    let APPID = "50831bcb4aa051e922a69910ab3e7884"
    
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        surName.delegate = self
        
        NotificationCenter.default.addObserver(forName: ViewController.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] (notif) in
            if self?.view.frame.origin.y == 0 {
                self?.view.frame.origin.y -= 200
            }
        }
        NotificationCenter.default.addObserver(forName: ViewController.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] (notif) in
            self?.view.frame.origin.y = 0
            let userInfo = notif.userInfo
            
            let getKeyBoardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = .cyan
        nameField.text = userDef.string(forKey: "name")
        surName.text = userDef.string(forKey: "surName")
    }
    
    struct AnyCity: Decodable {
        var weather: [Main]?
    }
    
    struct Main: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
    
    
    //MARK: -Some Attributes
    
    @available(iOS 9.0, *)
    func allVersions() {
        
    }
    
    
    @discardableResult func yahoo() -> String {
        return "eee"
    }
    
    
    
    @IBAction func switchHandler(_ sender: Any) {
        userDef.set(nameField.text, forKey: "name")
        userDef.set(surName.text, forKey: "surName")
        ProgressHUD.showSuccess()
        
        guard let myUrl =
            URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(nameField.text!)&APPID=\(APPID)") else { return }
        
        dispatchGroup.enter()
        URLSession.shared.dataTask(with: myUrl) { [weak self] (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                self?.currenWeather = try JSONDecoder().decode(AnyCity.self, from: data)
                print(self?.currenWeather.weather?.first?.main as Any)
            } catch {
                print(error)
            }
            self?.dispatchGroup.leave()
        }.resume()
        
        dispatchGroup.notify(queue: .main) {
            self.myLabel.text = "Today is \(self.currenWeather.weather?.first?.main ?? "")"
        }
        
        
        
        
    }
    
    override func becomeFirstResponder() -> Bool {
        nameField.resignFirstResponder()
        return true
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
