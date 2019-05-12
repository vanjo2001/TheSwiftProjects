//
//  DetailViewController.swift
//  CollectionView
//
//  Created by Vanjo on 25/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgeView: UIImageView! {
        didSet {
            print("didSet is real!")
            guard let image = menu?.imageName else {return}
            imgeView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var myLabel: UILabel! {
        didSet {
            myLabel.text = menu?.name
        }
    }
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
