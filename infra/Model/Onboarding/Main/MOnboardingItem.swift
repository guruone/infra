import UIKit

class MOnboardingItem
{
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