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
    @NSManaged private(set) var name:String
    @NSManaged private(set) var onboarded:Bool
    @NSManaged var createdPoem:NSSet
    @NSManaged var likedPoem:NSSet
    private var updateHandler:UInt?
    
    override class func entityName() -> String
    {
        return "User"
    }
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser(snapshot:snapshot.value)
        access = fUser.access
        
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
    
    func stopSyncing()
    {
        if userId != nil && updateHandler != nil
        {
            FMain.sharedInstance.database.stopListener(userId!, handler:updateHandler!)
        }
    }
}