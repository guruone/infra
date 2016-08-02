import Foundation

class MMainNav
{
    let items:[MMainNavItem]
    
    init()
    {
        let itemHome:MMainNavItem = MMainNavItem.Home()
        let itemProfile:MMainNavItem = MMainNavItem.Profile()
        let itemCreate:MMainNavItem = MMainNavItem.Create()
        let itemLiked:MMainNavItem = MMainNavItem.Liked()
        
        itemHome.selected()
        
        items = [
            itemProfile,
            itemLiked,
            itemHome,
            itemCreate
        ]
    }
}