import Foundation

class FDatabaseModelUser:FDatabaseModel
{
    var access:DInfraUser.DInfraUserAccess
    private let kKeyAccess:String = "access"
    
    init(dbUser:DInfraUser)
    {
        access = dbUser.access
    }
    
    init(snapshot:AnyObject?)
    {
        let json:[String:AnyObject]? = snapshot as? [String:AnyObject]
        
        if json != nil
        {
            let rawAccess:Int = json![kKeyAccess] as! Int
            let rawAccessPrimitive:Int16 = Int16(rawAccess)
            access = DInfraUser.DInfraUserAccess(rawValue:rawAccessPrimitive)!
        }
        else
        {
            access = DInfraUser.DInfraUserAccess.Banned
        }
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