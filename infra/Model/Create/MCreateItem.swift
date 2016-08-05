import UIKit

class MCreateItem:NSObject
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    class func Title() -> MCreateItem
    {
        let item:MCreateItem = MCreateItemTitle()
        
        return item
    }
    
    class func Text() -> MCreateItem
    {
        let item:MCreateItem = MCreateItemText()
        
        return item
    }
    
    class func Publish() -> MCreateItem
    {
        let item:MCreateItem = MCreateItemPublish()
        
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