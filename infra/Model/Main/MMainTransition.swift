import UIKit

class MMainTransition
{
    let animationDuration:NSTimeInterval
    
    class func Fade() -> MMainTransition
    {
        let transition:MMainTransition = MMainTransitionFade()
        
        return transition
    }
    
    class func ScrollLeft() -> MMainTransition
    {
        let transition:MMainTransition = MMainTransitionScrollLeft()
        
        return transition
    }
    
    class func ScrollRight() -> MMainTransition
    {
        let transition:MMainTransition = MMainTransitionScrollRight()
        
        return transition
    }
    
    class func Replace() -> MMainTransition
    {
        let transition:MMainTransition = MMainTransitionReplace()
        
        return transition
    }
    
    init(animationDuration:NSTimeInterval)
    {
        self.animationDuration = animationDuration
    }
    
    //MARK: public
    
    func before(current:UIViewController?, next:UIViewController?)
    {
    }
    
    func after(current:UIViewController?, next:UIViewController?)
    {
    }
}