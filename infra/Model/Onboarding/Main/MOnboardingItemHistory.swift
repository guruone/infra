import UIKit

class MOnboardingItemHistory:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemHistory(onboarding:onboarding, pageModel:self)
        
        return controller
    }
}