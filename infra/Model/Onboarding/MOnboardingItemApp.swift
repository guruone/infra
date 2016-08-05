import UIKit

class MOnboardingItemApp:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemApp(onboarding:onboarding)
        
        return controller
    }
}