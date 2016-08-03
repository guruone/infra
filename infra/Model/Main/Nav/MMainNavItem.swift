import UIKit

class MMainNavItem
{
    let image:String
    private(set) var state:MMainNavItemState
    weak var cell:VMainBarCell?
    
    class func Home() -> MMainNavItem
    {
        let item:MMainNavItem = MMainNavItemHome()
        
        return item
    }
    
    class func Profile() -> MMainNavItem
    {
        let item:MMainNavItem = MMainNavItemProfile()
        
        return item
    }
    
    class func Create() -> MMainNavItem
    {
        let item:MMainNavItem = MMainNavItemCreate()
        
        return item
    }
    
    class func Liked() -> MMainNavItem
    {
        let item:MMainNavItem = MMainNavItemLiked()
        
        return item
    }
    
    class func Notifications() -> MMainNavItem
    {
        let item:MMainNavItem = MMainNavItemNotifications()
        
        return item
    }
    
    init(image:String)
    {
        self.image = image
        state = MMainNavItemState.None()
    }
    
    //MARK: public
 
    func restate(state:MMainNavItemState)
    {
        self.state = state
        cell?.image.tintColor = state.color
    }
    
    func config(cell:VMainBarCell)
    {
        self.cell = cell
        cell.image.image = UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        cell.image.tintColor = state.color
    }
    
    func selected()
    {
    }
}