import UIKit

class MOnboardingItem
{
    class func History() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemWelcome()
        return model
    }
    
    class func App() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemPermission()
        return model
    }
    
    class func User() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemLoading()
        return model
    }
    
    //MARK: public
    
    func controller(onboarding:COnboarding) -> COnboardingItem
    {
        fatalError()
    }
}