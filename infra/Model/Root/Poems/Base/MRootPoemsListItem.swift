import UIKit
import FirebaseDatabase

class MRootPoemsListItem
{
    var itemStatus:MRootPoemsListItemStatus?
    let status:DInfraPoem.DInfraPoemStatus
    let poemId:String
    let title:String
    let userId:String
    let created:NSTimeInterval
    let lastEdit:NSTimeInterval
    let likes:Int
    var text:String?
    var cellSize:CGSize?
    var userName:String?
    private var completion:((error:String?) -> ())?
    
    init(poemId:String, json:[String:AnyObject])
    {
        let fPoem:FDatabaseModelPoem = FDatabaseModelPoem(json:json)
        self.poemId = poemId
        status = fPoem.status
        title = fPoem.title
        userId = fPoem.userId
        created = NSTimeInterval(fPoem.created)
        lastEdit = NSTimeInterval(fPoem.lastEdited)
        likes = fPoem.likes
        itemStatus = MRootPoemsListItemStatus.None(self)
    }
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        userName = snapshot.value as? String
    }
    
    private func loadUserName()
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser()
        let property:String = fUser.kKeyName
        
        FMain.sharedInstance.database.listenUser(userId, property:property, snapBlock:snapBlock)
    }
    
    private func loadPoem()
    {
        FMain.sharedInstance.storage
    }
    
    //MARK: public
    
    func errored(error:String)
    {
        itemStatus = MRootPoemsListItemStatus.Error(self, error:error)
    }
    
    func loadData(completion:((error:String?) -> ()))
    {
        itemStatus = MRootPoemsListItemStatus.Downloading(self)
        self.completion = completion
        
        loadUserName()
    }
    
    func cellSizeFor(width:CGFloat)
    {
        
    }
}