//
//  SearchViewController.swift
//  FirebaseProject1
//
//  Created by IvanLyuhtikov on 1/25/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UIViewController {

    
    let ref = Database.database().reference().child("users")
    
    var arrTasks = [MiniTask]()
    var prepareEmail: String = String()
    var searchUserTask = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
        
    }
    
    
    func fetchUser() -> String {
        let soughFor = "None!"
        for item in arrTasks {
            if item.email == prepareEmail {
                searchUserTask.append(item.email as AnyObject)
                searchUserTask.append(item.countOfTasks as AnyObject)
                searchUserTask.append(item.completeTasks as AnyObject)
                return item.email
            }
        }
        return soughFor
    }
    

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchUserTask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollecitonViewCellCollectionViewCell {
            itemCell.label.text = fetchUser()
            
            itemCell.backgroundColor = .blue
            
            if indexPath.row == 0 {
                itemCell.label.text = "email: " + (searchUserTask[0] as! String)
            }
            if indexPath.row == 1 {
                itemCell.label.text = "count of tasks: " + String(searchUserTask[1] as! Int)
            }
            if indexPath.row == 2 {
                itemCell.label.text = "complete tasks: " + String(searchUserTask[2] as! Int)
            }
            
            return itemCell
        }
        
        return UICollectionViewCell()
    }
    
    
}
