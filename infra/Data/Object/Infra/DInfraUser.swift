import Foundation
import CoreData

@objc(DInfraUser)
class DInfraUser:NSManagedObject
{
    @objc enum DInfraUserAccess:Int16
    {
        case Regular = 0
        case Read
        case Banned
        case Root
    }
    
    @NSManaged private(set) var access:DInfraUserAccess
    @NSManaged private(set) var userId:String?
    @NSManaged var createdPost:NSSet
    @NSManaged var dislikedPost:NSSet
    @NSManaged var likedPost:NSSet
    
    //MARK: public
    
    func getServerId()
    {
        
    }
}