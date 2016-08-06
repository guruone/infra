import Foundation

class MOnboarding
{
    private(set) var items:[MOnboardingItem]
    
    init()
    {
        items = []
        
        addItem(MOnboardingItem.History(items.count))
        addItem(MOnboardingItem.App(items.count))
        addItem(MOnboardingItem.User(items.count))
    }
    
    //MARK: private
    
    private func addItem(item:MOnboardingItem)
    {
        let previousItem:MOnboardingItem? = items.last
        items.append(item)
        
        if previousItem != nil
        {
            item.previousItem = previousItem
            previousItem?.nextItem = item
        }
    }
}