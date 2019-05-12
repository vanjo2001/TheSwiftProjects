//
//  TasksViewController.swift
//  FirebaseProject1
//
//  Created by IvanLyuhtikov on 1/16/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var user: UserM!
    var ref: DatabaseReference!
    var ref2: DatabaseReference!
    var ref3: DatabaseReference!
    var tasks = Array<Task>()
    var tasks2 = Array<MiniTask>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = Auth.auth().currentUser else { return }
        user = UserM(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(user.uid).child("tasks")
        ref2 = Database.database().reference(withPath: "users")
        ref3 = ref2.child(user.uid)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ref.observe(.value) { [weak self](snapshot) in
            var _tasks = Array<Task>()
            for item in snapshot.children {
                let task = Task(snapshot: item as! DataSnapshot)
                _tasks.append(task)
            }
            self?.tasks = _tasks
            self?.tableView.reloadData()
        }
        
        ref2.observe(.value) { [weak self](snapshot) in
            var _tasks = Array<MiniTask>()
            for item in snapshot.children {
                let task = MiniTask(snapshot: item as! DataSnapshot)
                _tasks.append(task)
            }
            self?.tasks2 = _tasks
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchSegue" {
            if let svc = segue.destination as? SearchViewController {
                let arrInfo = sender as! [Any]
                let email = arrInfo[0] as! String
                let tasks = arrInfo[1] as! Array<MiniTask>
                svc.prepareEmail = email
                svc.arrTasks = tasks
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ref.removeAllObservers()
    }
    
    //Разрешение на редактирование ячеек
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            task.ref?.removeValue()
            self.ref3.runTransactionBlock { (currentData: MutableData) -> TransactionResult in
                if var post = currentData.value as? [String: AnyObject] {
                    var countOfTasks = post["count of tasks"] as! Int
                    var completeTasks = post["complete tasks"] as! Int
                    countOfTasks -= 1
                    if task.completed {
                        completeTasks -= 1
                    }
                    post["count of tasks"] = countOfTasks as AnyObject
                    post["complete tasks"] = completeTasks as AnyObject
                    currentData.value = post
                    return TransactionResult.success(withValue: currentData)
                }
                return TransactionResult.success(withValue: currentData)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let task = tasks[indexPath.row]
        let isCompleted = !task.completed
        
        ref3.runTransactionBlock { (currentData) -> TransactionResult in
            if var post = currentData.value as? [String: AnyObject] {
                var completeTasks = post["complete tasks"] as! Int
                if isCompleted {
                    completeTasks += 1
                } else {
                    completeTasks -= 1
                }
                post["complete tasks"] = completeTasks as AnyObject
                currentData.value = post
                return TransactionResult.success(withValue: currentData)
            }
            return TransactionResult.success(withValue: currentData)
        }

        toggleCompleation(cell, isCompleted: isCompleted)
        task.ref?.updateChildValues(["completed": isCompleted])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        
        let task = tasks[indexPath.row]
        let taskTitle = task.title
        let isCompleted = task.completed
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = taskTitle
        toggleCompleation(cell, isCompleted: isCompleted)
        
        return cell
        
    }
    
    func toggleCompleation(_ cell: UITableViewCell, isCompleted: Bool) {
        cell.accessoryType = isCompleted ? .checkmark : .none
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Task", message: "Add new Task", preferredStyle: .alert)
        alert.addTextField()
        let save = UIAlertAction(title: "Save", style: .default) {[weak self] _ in
            guard let textField = alert.textFields?.first, textField.text != "" else { return }
            let task = Task(title: textField.text!, userId: (self?.user.uid)!)
            
            self?.ref3.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
                if var post = currentData.value as? [String: AnyObject] {
                    var countOfTasks = post["count of tasks"] as? Int ?? 0
                    countOfTasks += 1
                    print(countOfTasks)
                    post["count of tasks"] = countOfTasks as AnyObject
                    currentData.value = post
                    return TransactionResult.success(withValue: currentData)
                }
                return TransactionResult.success(withValue: currentData)
            })
            
            let taskRef = self?.ref.child(task.title.lowercased())
            taskRef?.setValue(task.converteToDictionary())
            
        }
        
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
        alert.addAction(save)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        let searchAlert = UIAlertController(title: "Search", message: "Enter email user", preferredStyle: .alert)
        searchAlert.addTextField()
        let actionOk = UIAlertAction(title: "Search", style: .default) { [weak self]_ in
            let email = searchAlert.textFields?.first?.text
            self?.performSegue(withIdentifier: "searchSegue", sender: [email, self?.tasks2])
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        searchAlert.addAction(actionOk)
        searchAlert.addAction(cancelAction)
        present(searchAlert, animated: true, completion: nil)
    }
    
    @IBAction func buttonSingOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func countOfTasks() -> Int {
        var countTasks = 0
        
            self.ref.observe(.childAdded, with: { (snapshot) in
                countTasks+=1
                print(countTasks)
            })
        print(countTasks)
        return countTasks
    }
    
}
