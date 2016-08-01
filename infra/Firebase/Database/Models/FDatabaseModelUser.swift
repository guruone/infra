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
        let rawAccess:Int = json[kKeyAccess] as! Int
        let rawAccessPrimitive:Int16 = Int16(rawAccess)
        access = DInfraUser.DInfraUserAccess(rawValue:rawAccessPrimitive)!
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