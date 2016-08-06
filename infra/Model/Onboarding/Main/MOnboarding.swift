import Foundation

class MOnboarding
{
    private(set) var items:[MOnboardingItem]
    
    init()
    {
        items = []
        
        let modelHistory:MOnboardingItem = MOnboardingItem.History()
        let modelApp:MOnboardingItem = MOnboardingItem.App()
        let modelUser:MOnboardingItem = MOnboardingItem.User()
        
        addItem(modelHistory)
        addItem(modelApp)
        addItem(modelUser)
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