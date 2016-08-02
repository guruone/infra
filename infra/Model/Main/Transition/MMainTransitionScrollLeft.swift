import UIKit

class MMainTransitionScrollLeft:MMainTransition
{
    private let kAnimationDuration:NSTimeInterval = 0.3
    
    init()
    {
        super.init(animationDuration:kAnimationDuration)
    }
    
    override func before(parent:CMainParent, current:UIViewController?, next:UIViewController)
    {
    }
    
    override func after(parent:CMainParent, current:UIViewController?, next:UIViewController)
    {
    }
}