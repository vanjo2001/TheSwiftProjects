//
//  ViewController.swift
//  MyAnythingProject1
//
//  Created by Vanjo on 29/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dataCells = [MyModelCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCells = [MyModelCell(nameLabel: "Sea", nameImage: ""),
                     MyModelCell(nameLabel: "Beach", nameImage: "beach")]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell {
            cell.model = dataCells[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}

