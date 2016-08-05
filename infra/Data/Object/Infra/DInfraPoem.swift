import Foundation
import CoreData

@objc(DInfraPoem)
class DInfraPoem:NSManagedObject
{
    @NSManaged private(set) var approved:Bool
    @NSManaged private(set) var poemId:String
    @NSManaged var userCreator:DInfraUser?
    @NSManaged var userDisliked:DInfraUser?
    @NSManaged var userLiked:DInfraUser?
    
    override class func entityName() -> String
    {
        return "Post"
    }
}