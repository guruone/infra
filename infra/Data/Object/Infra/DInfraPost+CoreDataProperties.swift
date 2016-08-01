//
//  DInfraPost+CoreDataProperties.swift
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

extension DInfraPost {

    @NSManaged var approved: Bool
    @NSManaged var postId: String?
    @NSManaged var userCreator: DInfraUser?
    @NSManaged var userDisliked: DInfraUser?
    @NSManaged var userLiked: DInfraUser?

}
