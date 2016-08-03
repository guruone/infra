import UIKit

class MMainTransitionScrollRight:MMainTransition
{
    private let kAnimationDuration:NSTimeInterval = 0.3
    
    init()
    {
        super.init(animationDuration:kAnimationDuration)
    }
    
    override func before(parent:CMainParent, current:UIViewController?, next:UIViewController)
    {
        let width:CGFloat
        let barHeight:CGFloat
        
        if current == nil
        {
            width = 0
        }
        else
        {
            width = current!.view.bounds.maxX
        }
        
        if parent.bar == nil
        {
            barHeight = 0
        }
        else
        {
            barHeight = parent.kBarHeight
        }
        
        let views:[String:AnyObject] = [
            "nextView":next.view]
        
        let metrics:[String:AnyObject] = [
            "barHeight":barHeight,
            "viewWidth":width,
            "viewWidthMinus":-width]
        
        parent.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(viewWidthMinus)-[nextView(viewWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        parent.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(barHeight)-[nextView]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    override func after(parent:CMainParent, current:UIViewController?, next:UIViewController)
    {
        if current != nil
        {
            let width:CGFloat = current!.view.bounds.maxX
            
            let views:[String:AnyObject] = [
                "currentView":current!.view]
            
            let metrics:[String:AnyObject] = [
                "viewWidthMinus":-width]
            
            parent.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "H:[currentView]-(viewWidthMinus)-|",
                options:[],
                metrics:metrics,
                views:views))
        }
    }
}