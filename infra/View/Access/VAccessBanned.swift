import UIKit

class VAccessBanned:UIView
{
    weak var controller:CAccessBanned!
    
    convenience init(controller:CAccessBanned)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.blueColor()
        userInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let logo:UIImageView = UIImageView()
        logo.userInteractionEnabled = false
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = UIViewContentMode.Center
        logo.image = UIImage(named:"genericLogo")
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(17)
        label.textColor = UIColor(white:1, alpha:0.5)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("VAccessBanned_label", comment:"")
        
        addSubview(logo)
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "logo":logo,
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[logo]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[label]-20-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-100-[logo(100)]-20-[label]",
            options:[],
            metrics:metrics,
            views:views))
    }
}