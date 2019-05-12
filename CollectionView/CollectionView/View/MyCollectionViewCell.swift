//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Vanjo on 25/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var menu: Menu? {
        didSet {
            myLabel.text = menu?.name
            if let image = menu?.imageName {
                myImageView.image = UIImage(named: image)
                myImageView.contentMode = .scaleAspectFit
            }
        }
    }
}
