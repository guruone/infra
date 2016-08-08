import UIKit

class VRootListUploading:UIView
{
    weak var controller:CRootListUploading!
    
    convenience init(controller:CRootListUploading)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let numberString:String = numberFormatter.stringFromNumber(controller.model.items.count)!
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.numeric(35)
        label.textColor = UIColor.main()
        label.textAlignment = NSTextAlignment.Center
        label.text = numberString
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = UIColor(white:0.95, alpha:1)
        button.layer.cornerRadius = 4
        button.setTitleColor(UIColor.main(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor.main().colorWithAlphaComponent(0.1), forState:UIControlState.Highlighted)
        button.titleLabel?.font = UIFont.bold(14)
        button.setTitle(NSLocalizedString("VRootListUploading_button", comment:""), forState:UIControlState.Normal)
        
        addSubview(label)
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "label":label,
            "button":button]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-100-[button]-100-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-50-[label(150)]-0-[button(38)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}