import Foundation

class MOnboardingItemHistoryModel
{
    let items:[MOnboardingItemHistoryModelItem]
    
    init()
    {
        let itemImage:MOnboardingItemHistoryModelItem = MOnboardingItemHistoryModelItem.Image()
        let itemDescr:MOnboardingItemHistoryModelItem = MOnboardingItemHistoryModelItem.Descr()
        
        items = [
            itemImage,
            itemDescr
        ]
    }
}