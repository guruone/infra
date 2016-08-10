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
    var cellWidth:CGFloat
    var cellSize:CGSize?
    var userName:String?
    var attributedString:NSAttributedString?
    private var completion:((error:String?) -> ())?
    let kMarginHorizontal:CGFloat = 10
    let kMarginVertical:CGFloat = 20
    let kMaxHeight:CGFloat = 5000
    let drawingOptions:NSStringDrawingOptions
    let attr:[String:AnyObject]
    
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
        cellWidth = 0
        attr = [NSFontAttributeName:UIFont.regular(16)]
        drawingOptions = NSStringDrawingOptions([NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading])
        itemStatus = MRootPoemsListItemStatus.None(self)
    }
    
    private func loadUserName()
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser()
        let property:String = fUser.kKeyName
        
        FMain.sharedInstance.database.listenUser(userId, property:property)
        { [weak self] (snapshot) in
            
            self?.userName = snapshot.value as? String
            self?.loadPoem()
        }
    }
    
    private func loadPoem()
    {
        FMain.sharedInstance.storage.loadPoem(poemId)
        { [weak self] (poem, error) in
            
            if self != nil
            {   
                if poem == nil
                {
                    self!.text = ""
                }
                else
                {
                    self!.text = poem
                }
                
                self!.attributedString = NSAttributedString(string:self!.text!, attributes:self!.attr)
                self!.completion?(error:error)
                self!.completion = nil
            }
        }
    }
    
    //MARK: public
    
    func completed()
    {
        itemStatus = MRootPoemsListItemStatus.Ready(self)
    }
    
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
        cellWidth = width
        let maxWidth:CGFloat = cellWidth - (kMarginHorizontal + kMarginHorizontal)
        let boundingSize:CGSize = CGSizeMake(maxWidth, kMaxHeight)
        let rect:CGRect = attributedString!.boundingRectWithSize(boundingSize, options:drawingOptions, context:nil)
        let height:CGFloat = ceil(rect.maxY)
        let totalHeight:CGFloat = height + kMarginVertical + kMarginVertical
        cellSize = CGSizeMake(cellWidth, totalHeight)
    }
}