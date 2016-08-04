import UIKit

class MCreateItem
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
    
    class func Picture() -> MCreateItem
    {
        let item:MCreateItem = MCreateItemPicture()
        
        return item
    }
    
    class func Ack() -> MCreateItem
    {
        let item:MCreateItem = MCreateItemAck()
        
        return item
    }
    
    init(reusableIdentifier:String, cellHeight:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
    }
}