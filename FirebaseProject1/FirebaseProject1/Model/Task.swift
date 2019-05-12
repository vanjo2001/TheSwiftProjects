//
//  Task.swift
//  FirebaseProject1
//
//  Created by IvanLyuhtikov on 1/23/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import Foundation
import Firebase


struct Task {
    let title: String
    let userId: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    init(title: String, userId: String) {
        self.title = title
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.title = snapshotValue["title"] as! String
        self.userId = snapshotValue["userId"] as! String
        self.completed = snapshotValue["completed"] as! Bool
        self.ref = snapshot.ref
    }
    func converteToDictionary() -> Any {
        return ["title": title, "userId": userId, "completed": completed]
    }
}

struct MiniTask {
    var email: String
    var countOfTasks: Int//
    var completeTasks: Int
    
    init(email: String = "None", countOfTasks: Int = 0, completeTasks: Int = 0) {
        self.email = email
        self.countOfTasks = countOfTasks//
        self.completeTasks = completeTasks
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.email = snapshotValue["email"] as! String
        self.countOfTasks = snapshotValue["count of tasks"] as! Int//
        self.completeTasks = snapshotValue["complete tasks"] as! Int
    }
}
