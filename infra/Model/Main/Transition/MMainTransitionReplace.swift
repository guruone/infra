import UIKit

class MMainTransitionReplace:MMainTransition
{
    private let kAnimationDuration:NSTimeInterval = 0
    
    init()
    {
        super.init(animationDuration:kAnimationDuration)
    }
    
    override func after(parent:CMainParent, current:UIViewController?, next:UIViewController)
    {
        let barHeight:CGFloat
        
        if parent.bar == nil
        {
            barHeight = 0
        }
        else
        {
            barHeight = parent.bar!.bounds.maxY
        }
        
        let views:[String:AnyObject] = [
            "nextView":next.view]
        
        let metrics:[String:AnyObject] = [
            "barHeight":barHeight]
        
        parent.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[nextView]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        parent.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(barHeight)-[nextView]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}