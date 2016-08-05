import UIKit

class MCreateItem:NSObject
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    class func Title() -> MCreateItemTitle
    {
        let item:MCreateItemTitle = MCreateItemTitle()
        
        return item
    }
    
    class func Text() -> MCreateItemText
    {
        let item:MCreateItemText = MCreateItemText()
        
        return item
    }
    
    class func Publish() -> MCreateItemPublish
    {
        let item:MCreateItemPublish = MCreateItemPublish()
        
        return item
    }
    
    init(reusableIdentifier:String, cellHeight:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
    }
    
    //MARK: public
    
    func config(cell:VCreateCell, controller:CCreate, indexPath:NSIndexPath)
    {
    }
    
    func validate() -> String?
    {
        return nil
    }
}