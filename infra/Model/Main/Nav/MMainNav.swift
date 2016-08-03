import Foundation

class MMainNav
{
    let items:[MMainNavItem]
    let indexHome:Int
    
    init()
    {
        let itemHome:MMainNavItem = MMainNavItem.Home()
        let itemProfile:MMainNavItem = MMainNavItem.Profile()
        let itemCreate:MMainNavItem = MMainNavItem.Create()
        let itemLiked:MMainNavItem = MMainNavItem.Liked()
        let itemNotifications:MMainNavItem = MMainNavItem.Notifications()
        
        items = [
            itemLiked,
            itemNotifications,
            itemHome,
            itemCreate,
            itemProfile
        ]
        
        var indexHome:Int = 0
        let itemsCount:Int = items.count
        
        for index:Int in 0 ..< itemsCount
        {
            let item:MMainNavItem = items[index]
            
            if item === itemHome
            {
                indexHome = index
                
                break
            }
        }
        
        self.indexHome = indexHome
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