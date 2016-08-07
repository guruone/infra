import Foundation

class FDatabaseModelPoem:FDatabaseModel
{
    private let title:String
    private let userId:String
    private let status:DInfraPoem.DInfraPoemStatus
    private let created:Int
    private let lastEdited:Int
    private let likes:Int
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
        status = DInfraPoem.DInfraPoemStatus.Review
        likes = 0
        
        let now:NSTimeInterval = NSDate().timeIntervalSince1970
        created = Int(now)
        lastEdited = Int(now)
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            :
        ]
        
        return dict
    }
}