import UIKit

class COnboardingItemHistory:COnboardingItem
{
    let model:MOnboardingItemHistoryModel
    
    override init(onboarding:COnboarding)
    {
        model = MOnboardingItemHistoryModel()
        
        super.init(onboarding:onboarding)
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        view = VOnboardingItemHistory(controller:self)
    }
}