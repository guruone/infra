//
//  DInfraPoem+CoreDataProperties.swift
//  
//
//  Created by zero on 8/5/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DInfraPoem {

    @NSManaged var approved: Bool
    @NSManaged var poemId: String?
    @NSManaged var userCreator: DInfraUser?
    @NSManaged var userLiked: DInfraUser?

}
