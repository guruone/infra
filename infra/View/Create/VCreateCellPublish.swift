import UIKit

class VCreateCellPublish:VCreateCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        base.hidden = true
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.main()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.bold(16)
        button.setTitleColor(UIColor.whiteColor(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor(white:1, alpha:0.15), forState:UIControlState.Highlighted)
        button.setTitle(NSLocalizedString("VCreateCellPublish_button", comment:""), forState:UIControlState.Normal)
        
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "button":button]
        
        let metrics:[String:AnyObject] = [:]

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[button]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[button]-10-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}