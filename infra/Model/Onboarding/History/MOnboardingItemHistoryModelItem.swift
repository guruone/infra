import UIKit

class MOnboardingItemHistoryModelItem
{
    let reusableIdentifier:String
    let cellWidth:CGFloat
    
    class func Image() -> MOnboardingItemHistoryModelItem
    {
        let item:MOnboardingItemHistoryModelItem = MOnboardingItemHistoryModelItemImage()
        
        return item
    }
    
    class func Descr() -> MOnboardingItemHistoryModelItem
    {
        let item:MOnboardingItemHistoryModelItem = MOnboardingItemHistoryModelItemDescr()
        
        return item
    }
    
    init(reusableIdentifier:String, cellWidth:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellWidth = cellWidth
    }
}