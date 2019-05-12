//
//  ViewController.swift
//  FirebaseProject1
//
//  Created by IvanLyuhtikov on 1/15/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var textWarning: UILabel!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        ref = Database.database().reference(withPath: "users")
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            guard let userInfo = notification.userInfo else { return }
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            self.view.frame.origin.y = -(keyboardFrame.height/2)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (n) in
            self.view.bounds.origin.y = 0.0
        }
        
        textWarning.alpha = 0.0

        Auth.auth().addStateDidChangeListener { [weak self](auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
            }
        }
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fieldEmail.text = ""
        fieldPassword.text = ""
    }
    
    func displayWarningText(_ text: String) {
        textWarning.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {[weak self] in
            self?.textWarning.alpha = 1.0
        }) { [weak self] complete in
            self?.textWarning.alpha = 0.0
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = fieldEmail.text, let password = fieldPassword.text, email != "", password != "" else {
            displayWarningText("info incorrect")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self](user, error) in
            if error != nil {
                self?.displayWarningText("error auth")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
                return
            }
            self?.displayWarningText("no such user")
        }
    }
    
    @IBAction func register(_ sender: Any) {
        guard let email = fieldEmail.text, let password = fieldPassword.text, email != "", password != "" else {
            displayWarningText("info incorrect")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            
            guard error == nil, user != nil else {
                
                print(error!.localizedDescription)
                return
            }
            
            let userRef = self?.ref.child((user?.user.uid)!)
            userRef?.setValue(["email": user?.user.email, "password": password, "count of tasks": 0, "complete tasks": 0])
            

        }
    }
    

}

