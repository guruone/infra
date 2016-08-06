import Foundation

class FDatabaseModelUser:FDatabaseModel
{
    var access:DInfraUser.DInfraUserAccess
    var name:String
    private let kKeyAccess:String = "access"
    private let kKeyName:String = "name"
    
    init(dbUser:DInfraUser)
    {
        access = dbUser.access
        name = dbUser.name
    }
    
    init(snapshot:AnyObject?)
    {
        let json:[String:AnyObject]? = snapshot as? [String:AnyObject]
        
        if json != nil
        {
            let rawAccess:Int = json![kKeyAccess] as! Int
            let rawAccessPrimitive:Int16 = Int16(rawAccess)
            access = DInfraUser.DInfraUserAccess(rawValue:rawAccessPrimitive)!
            name = json![kKeyName] as! String
        }
        else
        {
            access = DInfraUser.DInfraUserAccess.Banned
            name = ""
        }
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let accessNumber:Int = Int(access.rawValue)
        
        let dict:[String:AnyObject] = [
            kKeyAccess:accessNumber,
            kKeyName:name
        ]
        
        return dict
    }
}