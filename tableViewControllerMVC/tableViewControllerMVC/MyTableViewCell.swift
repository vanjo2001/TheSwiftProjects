//
//  MyTableViewCell.swift
//  tableViewControllerMVC
//
//  Created by Vanjo on 25/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refresh(_ mode: Model) {
        self.myLabel1.text = mode.name
        self.myLabel2.text = mode.profession
    }

}
