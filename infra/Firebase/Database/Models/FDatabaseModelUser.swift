import Foundation

class FDatabaseModelUser
{
    var access:DInfraUser.DInfraUserAccess
    private let kKeyAccess:String = "access"
    
    init()
    {
        access = DInfraUser.DInfraUserAccess.Regular
    }
    
    //MARK: public
    
    func json() -> [String:AnyObject]
    {
        let accessNumber:Int = Int(access.rawValue)
        
        let dict:[String:AnyObject] = [
            kKeyAccess:accessNumber
        ]
        
        return dict
    }
}