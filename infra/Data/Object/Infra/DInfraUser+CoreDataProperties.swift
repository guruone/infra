//
//  DInfraUser+CoreDataProperties.swift
//  
//
//  Created by zero on 8/1/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DInfraUser {

    @NSManaged var access: Int16
    @NSManaged var userId: String?
    @NSManaged var createdPost: NSSet?
    @NSManaged var dislikedPost: NSSet?
    @NSManaged var likedPost: NSSet?

}
