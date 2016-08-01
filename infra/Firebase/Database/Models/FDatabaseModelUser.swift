import Foundation

class FDatabaseModelUser:FDatabaseModel
{
    var access:DInfraUser.DInfraUserAccess
    private let kKeyAccess:String = "access"
    
    init(dbUser:DInfraUser)
    {
        access = dbUser.access
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