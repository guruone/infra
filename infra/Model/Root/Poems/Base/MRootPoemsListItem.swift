import UIKit

class MRootPoemsListItem
{
    var itemStatus:MRootPoemsListItemStatus
    let status:DInfraPoem.DInfraPoemStatus
    let poemId:String
    let title:String
    let userId:String
    let created:NSTimeInterval
    let lastEdit:NSTimeInterval
    let likes:Int
    var text:String?
    var cellSize:CGSize?
    
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
        itemStatus = MRootPoemsListItemStatus.None()
    }
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser(snapshot:snapshot.value)
        access = fUser.access
        name = fUser.name
        
        MConfiguration.sharedInstance.userSynced()
    }
    
    //MARK: public
    
    func loadData()
    {
        
    }
    
    func cellSizeFor(width:CGFloat)
    {
        
    }
}