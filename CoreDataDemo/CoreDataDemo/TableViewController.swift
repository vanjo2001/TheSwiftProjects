//
//  TableViewController.swift
//  CoreDataDemo
//
//  Created by Vanjo on 01/01/2019.
//  Copyright © 2019 Vanjo. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var array: [Task] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = AppDelegate()
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            array = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let value = array[indexPath.row]
        cell.textLabel?.text = value.taskToDo

        return cell
    }
    
    func saveTask(taskToDo: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        taskObject.taskToDo = taskToDo
        
        do {
            try context.save()
            array.append(taskObject)
        } catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: "You want to add...", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { (act) in
            let textField = alert.textFields?.first
            self.saveTask(taskToDo: (textField?.text)!)
            //self.array.insert((textField?.text)!, at: 0)
            self.tableView.reloadData()
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
