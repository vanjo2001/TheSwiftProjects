//
//  ViewController.swift
//  tableViewController
//
//  Created by Vanjo on 24/12/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var refresh = UIRefreshControl()
    var tableViewController = UITableViewController(style: .plain)
    var allItem = [Date]()
    var identifire = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refresh.addTarget(self, action: #selector(callRefresh), for: .valueChanged)
        
        createTableView()
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(refresh)
    }
    
    @objc func callRefresh() {
        allItem.append(Date())
        refresh.endRefreshing()
        let index = IndexPath(row: allItem.count-1, section: 0)
        tableViewController.tableView.insertRows(at: [index], with: .bottom)
    }
    
    func createTableView() {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        let date = allItem[indexPath.row]
        cell.textLabel?.text = "\(date)"
        print(cell.textLabel?.text)
        return cell
        
    }
    
    
}



