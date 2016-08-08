import Foundation

class FDatabaseModelPoem:FDatabaseModel
{
    let title:String
    let userId:String
    let status:DInfraPoem.DInfraPoemStatus
    let created:Int
    let lastEdited:Int
    let likes:Int
    private let kKeyTitle:String = "title"
    private let kKeyUserId:String = "user_id"
    private let kKeyStatus:String = "status"
    private let kKeyCreated:String = "created"
    private let kKeyLastEdit:String = "last_edit"
    private let kKeyLikes:String = "likes"
    
    init(title:String)
    {
        self.title = title
        userId = MConfiguration.sharedInstance.user!.userId!
        status = DInfraPoem.DInfraPoemStatus.Uploading
        likes = 0
        
        let now:NSTimeInterval = NSDate().timeIntervalSince1970
        created = Int(now)
        lastEdited = Int(now)
    }
    
    init(json:[String:AnyObject])
    {
        let rawStatus:Int = json[kKeyStatus] as! Int
        let rawStatus16:Int16 = Int16(rawStatus)
        
        title = json[kKeyTitle] as! String
        userId = json[kKeyUserId] as! String
        status = DInfraPoem.DInfraPoemStatus(rawValue:rawStatus16)!
        created = json[kKeyCreated] as! Int
        lastEdited = json[kKeyLastEdit] as! Int
        likes = json[kKeyLikes] as! Int
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let statusNumber:Int = Int(status.rawValue)
        
        let dict:[String:AnyObject] = [
            kKeyTitle:title,
            kKeyUserId:userId,
            kKeyStatus:statusNumber,
            kKeyCreated:created,
            kKeyLastEdit:lastEdited,
            kKeyLikes:likes
        ]
        
        return dict
    }
    
    func propertyStatus(status:DInfraPoem.DInfraPoemStatus) -> [String:AnyObject]
    {
        let statusNumber:Int = Int(status.rawValue)
        
        let dict:[String:AnyObject] = [
            kKeyStatus:statusNumber
        ]
        
        return dict
    }
}