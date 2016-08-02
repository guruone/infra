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
        
        items = [
            itemProfile,
            itemLiked,
            itemHome,
            itemCreate
        ]
    }
    
    //MARK: public
    
    func selectItem(selected:MMainNavItem)
    {
        for item:MMainNavItem in items
        {
            let state:MMainNavItemState
            
            if item === selected
            {
                state = MMainNavItemState.Active()
            }
            else
            {
                state = MMainNavItemState.None()
            }
            
            item.restate(state)
        }
    }
}