import UIKit

class MOnboardingItem
{
    let index:Int
    weak var nextItem:MOnboardingItem?
    weak var previousItem:MOnboardingItem?
    
    class func History(index:Int) -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemHistory(index:index)
        return model
    }
    
    class func App(index:Int) -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemApp(index:index)
        return model
    }
    
    class func User(index:Int) -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemUser(index:index)
        return model
    }
    
    init(index:Int)
    {
        self.index = index
    }
    
    //MARK: public
    
    func controller(onboarding:COnboarding) -> COnboardingItem
    {
        fatalError()
    }
}