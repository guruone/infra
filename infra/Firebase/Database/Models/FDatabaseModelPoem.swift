import Foundation

class FDatabaseModelPoem:FDatabaseModel
{
    var access:DInfraUser.DInfraUserAccess
    private let kKeyTitle:String = "title"
    private let kKeyUserId:String = "user_id"
    private let kKeyStatus:String = "status"
    private let kKeyCreated:String = "created"
    private let kKeyLastEdit:String = "last_edit"
    private let kKeyLikes:String

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