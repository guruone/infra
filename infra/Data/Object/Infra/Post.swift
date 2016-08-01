import Foundation
import CoreData

class Post:NSManagedObject
{
    @NSManaged private(set) var postId:String
    @NSManaged private(set) var approved:Bool
    @NSManaged var userCreator:NSManagedObject?
    @NSManaged var userLiked:NSManagedObject?
    @NSManaged var userDisliked:NSManagedObject?
}