//
//  Profile+CoreDataProperties.swift
//  DataSourcee
//
//  Created by IvanLyuhtikov on 8/17/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var name: String?
    @NSManaged public var surName: String?
    @NSManaged public var predicate: Bool

}
