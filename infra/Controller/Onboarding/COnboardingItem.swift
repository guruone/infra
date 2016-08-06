import UIKit

class COnboardingItem:CMainController
{
    weak var onboarding:COnboarding!
    weak var pageModel:MOnboardingItem!
    
    init(onboarding:COnboarding, pageModel:MOnboardingItem)
    {
        super.init(nibName:nil, bundle:nil)
        self.onboarding = onboarding
        self.pageModel = pageModel
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
}