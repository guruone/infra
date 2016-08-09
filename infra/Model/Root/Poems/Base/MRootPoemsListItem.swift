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
    let kMarginHorizontal:CGFloat = 10
    let kMarginVertical:CGFloat = 20
    let kMaxHeight:CGFloat = 3000
    
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
        loadPoem()
    }
    
    private func loadUserName()
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser()
        let property:String = fUser.kKeyName
        
        FMain.sharedInstance.database.listenUser(userId, property:property, snapBlock:snapBlock)
    }
    
    private func loadPoem()
    {
        FMain.sharedInstance.storage.loadPoem(poemId)
        { [weak self] (poem, error) in
            
            self?.text = poem
            self?.completion?(error:error)
            self?.completion = nil
        }
    }
    
    //MARK: public
    
    func errored(error:String)
    {
        itemStatus = MRootPoemsListItemStatus.Error(self, error:error)
        self.completion = nil
    }
    
    func loadData(completion:((error:String?) -> ()))
    {
        itemStatus = MRootPoemsListItemStatus.Downloading(self)
        self.completion = completion
        
        loadUserName()
    }
    
    func cellSizeFor(width:CGFloat)
    {
        let attr:[String:AnyObject] = [NSFontAttributeName:UIFont.regular(15)]
        let attrString:NSAttributedString = NSAttributedString(string:text!, attributes:attr)
        let maxWidth:CGFloat = width - (kMarginHorizontal + kMarginHorizontal)
        let boundingSize:CGSize = CGSizeMake(maxWidth, kMaxHeight)
        let drawingOptions:NSStringDrawingOptions = NSStringDrawingOptions([NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading])
        let rect:CGRect = attrString.boundingRectWithSize(boundingSize, options:drawingOptions, context:nil)
        let height:CGFloat = rect.maxY
        let totalHeight:CGFloat = height + (kMarginVertical + kMarginVertical)
        cellSize = CGSizeMake(width, totalHeight)
    }
}