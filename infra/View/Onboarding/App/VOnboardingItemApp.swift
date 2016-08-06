import UIKit

class VOnboardingItemApp:UIView
{
    weak var controller:COnboardingItemApp!
    private let kImageHeight:CGFloat = 120
    
    convenience init(controller:COnboardingItemApp)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        self.controller = controller
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = UIViewContentMode.Center
        image.image = UIImage(named:"onboardingApp")
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image]
        
        let metrics:[String:AnyObject] = [
            "imageHeight":kImageHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[image(imageHeight)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}