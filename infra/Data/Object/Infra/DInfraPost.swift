import Foundation
import CoreData

@objc(DInfraPost)
class DInfraPost:NSManagedObject
{
    @NSManaged private(set) var approved:Bool
    @NSManaged private(set) var postId:String
    @NSManaged var userCreator:DInfraUser?
    @NSManaged var userDisliked:DInfraUser?
    @NSManaged var userLiked:DInfraUser?
    
    override class func entityName() -> String
    {
        return "Post"
    }
}