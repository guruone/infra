import Foundation

class MMainNavItem
{
    let image:String
    var state:MMainNavItemState
    
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
    
    init(image:String)
    {
        self.image = image
        state = MMainNavItemState.None()
    }
    
    //MARK: public
    
    func selected()
    {
        state = MMainNavItemState.Active()
    }
}