import UIKit

class VOnboardingItemApp:UIView
{
    weak var controller:COnboardingItemApp!
    
    convenience init(controller:COnboardingItemApp)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        self.controller = controller
    }
}