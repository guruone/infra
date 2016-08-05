import Foundation

class MOnboardingItemHistoryModelItem
{
    let reusableIdentifier:String
    
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
    
    init(reusableIdentifier:String)
    {
        self.reusableIdentifier = reusableIdentifier
    }
}