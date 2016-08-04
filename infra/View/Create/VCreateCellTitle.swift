import UIKit

class VCreateCellTitle:VCreateCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let base:UIView = UIView()
        base.clipsToBounds = true
        base.backgroundColor = UIColor.whiteColor()
        base.translatesAutoresizingMaskIntoConstraints = false
        base.layer.borderWidth = 1
        base.layer.borderColor = UIColor(white:0, alpha:0.2).CGColor
        base.layer.cornerRadius = 3
        
        addSubview(base)
        
        let views:[String:AnyObject] = [
            "base":base]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-5-[base]-5-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-5-[base]-5-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}