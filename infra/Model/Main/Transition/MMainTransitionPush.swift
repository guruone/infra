import UIKit

class MMainTransitionPush:MMainTransition
{
    private let kAnimationDuration:NSTimeInterval = 6
    
    init()
    {
        super.init(animationDuration:kAnimationDuration)
    }
    
    override func positionBefore()
    {
        let width:CGFloat = current!.view.bounds.maxX
        let barHeight:CGFloat
        let shadow:VMainShadow = VMainShadow()
        
        if parent.bar == nil
        {
            barHeight = 0
        }
        else
        {
            barHeight = parent.kBarHeight
        }
        
        parent.layoutTopTemporal = NSLayoutConstraint(
            item:next.view,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:parent.view,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:barHeight)
        parent.layoutBottomTemporal = NSLayoutConstraint(
            item:next.view,
            attribute:NSLayoutAttribute.Bottom,
            relatedBy:NSLayoutRelation.Equal,
            toItem:parent.view,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:1,
            constant:0)
        parent.layoutLeftTemporal = NSLayoutConstraint(
            item:next.view,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:parent.view,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:width)
        parent.layoutRightTemporal = NSLayoutConstraint(
            item:next.view,
            attribute:NSLayoutAttribute.Right,
            relatedBy:NSLayoutRelation.Equal,
            toItem:parent.view,
            attribute:NSLayoutAttribute.Right,
            multiplier:1,
            constant:width)
        
        parent.view.addConstraint(parent.layoutLeftTemporal!)
        parent.view.addConstraint(parent.layoutRightTemporal!)
        parent.view.addConstraint(parent.layoutTopTemporal!)
        parent.view.addConstraint(parent.layoutBottomTemporal!)
        
        parent.shadow = shadow
        next.view.addSubview(shadow)
        
        let views:[String:AnyObject] = [
            "shadow":shadow]
        
        let metrics:[String:AnyObject] = [:]
        
        next.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[shadow]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        next.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[shadow]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    override func animationBefore()
    {
        parent.view.layoutIfNeeded()
    }
    
    override func positionAfter()
    {
        let width:CGFloat = current!.view.bounds.maxX / 2.0
        parent.layoutLeft!.constant = -width
        parent.layoutRight!.constant = -width
        parent.layoutLeftTemporal!.constant = 0
        parent.layoutRightTemporal!.constant = 0
    }
    
    override func animationAfter()
    {
        parent.view.layoutIfNeeded()
        parent.shadow?.alpha = 1
    }
}