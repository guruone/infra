import UIKit

class MOnboardingItem
{
    weak var nextItem:MOnboardingItem?
    weak var previousItem:MOnboardingItem?
    
    class func History() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemHistory()
        return model
    }
    
    class func App() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemApp()
        return model
    }
    
    class func User() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemUser()
        return model
    }
    
    //MARK: public
    
    func controller(onboarding:COnboarding) -> COnboardingItem
    {
        fatalError()
    }
}