import UIKit

class VCreateCellPublish:VCreateCell
{
    weak var layoutButtonLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 160
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        base.hidden = true
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor(white:0.94, alpha:1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.bold(16)
        button.setTitleColor(UIColor.blackColor(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor(white:0, alpha:0.1), forState:UIControlState.Highlighted)
        button.setTitle(NSLocalizedString("VCreateCellPublish_button", comment:""), forState:UIControlState.Normal)
        
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "button":button]
        
        let metrics:[String:AnyObject] = [:]

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[button(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-5-[button]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutButtonLeft = NSLayoutConstraint(
            item:button,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutButtonLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.size.width
        let remain:CGFloat = width - kButtonWidth
        let margin:CGFloat = remain / 2.0
        layoutButtonLeft.constant = margin
    }
}