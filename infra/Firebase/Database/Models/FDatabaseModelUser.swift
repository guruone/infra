import Foundation
import FirebaseDatabase

class FDatabaseModelUser:FDatabaseModel
{
    var access:DInfraUser.DInfraUserAccess
    private let kKeyAccess:String = "access"
    
    init(dbUser:DInfraUser)
    {
        access = dbUser.access
    }
    
    init(snapshot:FIRDataSnapshot)
    {
        let json:[String:AnyObject] = snapshot.value as! [String:AnyObject]
        let rawAccess:Int16 = json[kKeyAccess] as! Int16
        access = DInfraUser.DInfraUserAccess(rawValue:rawAccess)!
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let accessNumber:Int = Int(access.rawValue)
        
        let dict:[String:AnyObject] = [
            kKeyAccess:accessNumber
        ]
        
        return dict
    }
}