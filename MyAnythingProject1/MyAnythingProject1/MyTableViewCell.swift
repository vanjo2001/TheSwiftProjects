//
//  MyTableViewCell.swift
//  MyAnythingProject1
//
//  Created by Vanjo on 29/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var model: MyModelCell? {
        didSet {
            myLabel.text = model?.nameLabel
            guard let Image = UIImage(named: (model?.nameImage)!) else {return}
            myImage?.image = Image
            myImage.contentMode = .scaleToFill
            myImage.layer.borderWidth = 5
            myImage.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
