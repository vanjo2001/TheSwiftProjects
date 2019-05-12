//
//  ViewController.swift
//  myTableView
//
//  Created by Vanjo on 22/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    var myTableView = UITableView()
    let identifire = "MyCell"
    let arr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
    }
    
    func createTable() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }
    
    //MARK: - UITableViewDataSource
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        switch section {
        case 0:
            return 3
        case 1:
            return 5
        case 2:
            return 8
        default:
            break
        }
         */
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        let number = arr[indexPath.row]
        
        cell.textLabel?.text = number
        
        /*
        cell.accessoryType = .detailButton
        
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .cyan
        case 1:
            cell.backgroundColor = .lightGray
        case 2:
            cell.backgroundColor = .green
        default:
            break
        }
         */
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    /*
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print(indexPath)
        let item = tableView.cellForRow(at: indexPath)
        print(item?.textLabel?.text ?? "nil")
    }
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = arr[indexPath.row]
        print(number)
        
    }


}

