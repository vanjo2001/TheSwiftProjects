//
//  User.swift
//  FirebaseProject1
//
//  Created by IvanLyuhtikov on 1/23/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import Foundation
import Firebase

struct UserM {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}

class UserSearch: NSObject {
    var email: String
    var password: String?
    init(email: String) {
        self.email = email
    }
}
