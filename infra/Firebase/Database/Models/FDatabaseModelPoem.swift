import Foundation

class FDatabaseModelPoem:FDatabaseModel
{
    private let kKeyTitle:String = "title"
    private let kKeyUserId:String = "user_id"
    private let kKeyStatus:String = "status"
    private let kKeyCreated:String = "created"
    private let kKeyLastEdit:String = "last_edit"
    private let kKeyLikes:String = "likes"
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            :
        ]
        
        return dict
    }
}