import Foundation
import CoreData
import FirebaseDatabase

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
    private var updateHandler:UInt?
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser(snapshot:snapshot)
        
        print("received snapshot")
        print("access: \(fUser.access)")
        
        MConfiguration.sharedInstance.userSynced()
    }
    
    //MARK: public
    
    func syncUser()
    {
        if userId == nil
        {
            let fUser:FDatabaseModelUser = FDatabaseModelUser(dbUser:self)
            userId = FMain.sharedInstance.database.newUser(fUser)
        }
        
        updateHandler = FMain.sharedInstance.database.listenUser(userId!, snapBlock:snapBlock)
    }
}