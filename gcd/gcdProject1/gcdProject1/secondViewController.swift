//
//  secondViewController.swift
//  gcdProject1
//
//  Created by IvanLyuhtikov on 3/3/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            activityIndecator.startAnimating()
            activityIndecator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        delay(3) {
            self.login()
        }
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    fileprivate func login() {
        let alert = UIAlertController(title: "Register", message: "Do you want to register now?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        
        alert.addTextField { (usernameTF) in
            usernameTF.placeholder = "enter username"
        }
        alert.addTextField { (passwordTF) in
            passwordTF.placeholder = "enter password"
            passwordTF.isSecureTextEntry = true
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    ///Grand Central Dispatch - GCD
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://apps4.life/img/wp-content/uploads/2017/03/boombeach_og.jpg?width=940&height=573")
        activityIndecator.isHidden = false
        activityIndecator.startAnimating()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}

