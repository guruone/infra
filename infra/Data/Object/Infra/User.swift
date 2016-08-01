import Foundation
import CoreData

class User:NSManagedObject
{
    @NSManaged private(set) var userId:String?
    @NSManaged private(set) var access:Int16
    @NSManaged var createdPost:NSSet
    @NSManaged var likedPost:NSSet
    @NSManaged var dislikedPost:NSSet
}