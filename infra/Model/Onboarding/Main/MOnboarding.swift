import Foundation

class MOnboarding
{
    let items:[MOnboardingItem]
    
    init()
    {
        let modelHistory:MOnboardingItem = MOnboardingItem.History()
        let modelApp:MOnboardingItem = MOnboardingItem.App()
        let modelUser:MOnboardingItem = MOnboardingItem.User()
        
        items = [
            modelHistory,
            modelApp,
            modelUser
        ]
    }
}