import UIKit

class MOnboardingItemUser:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemUser(onboarding:onboarding)
        
        return controller
    }
}