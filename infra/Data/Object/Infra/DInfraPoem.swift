import Foundation
import CoreData

@objc(DInfraPoem)
class DInfraPoem:NSManagedObject
{
    @objc enum DInfraPoemStatus:Int16
    {
        case Review = 0
        case NeedsRevision
        case Rejected
        case Ready
    }
    
    @NSManaged private(set) var status:DInfraPoemStatus
    @NSManaged private(set) var poemId:String
    @NSManaged var userCreator:DInfraUser?
    @NSManaged var userDisliked:DInfraUser?
    @NSManaged var userLiked:DInfraUser?
    
    override class func entityName() -> String
    {
        return "Post"
    }
}