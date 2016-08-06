import UIKit

class COnboardingItemHistory:COnboardingItem
{
    let model:MOnboardingItemHistoryModel
    
    override init(onboarding:COnboarding, pageModel:MOnboardingItem)
    {
        model = MOnboardingItemHistoryModel()
        
        super.init(onboarding:onboarding, pageModel:pageModel)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        view = VOnboardingItemHistory(controller:self)
    }
}