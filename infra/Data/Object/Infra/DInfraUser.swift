import Foundation
import CoreData

@objc(DInfraUser)
class DInfraUser:NSManagedObject
{
    @NSManaged private(set) var access:Int16
    @NSManaged private(set) var userId:String?
    @NSManaged var createdPost:NSSet
    @NSManaged var dislikedPost:NSSet
    @NSManaged var likedPost:NSSet
}