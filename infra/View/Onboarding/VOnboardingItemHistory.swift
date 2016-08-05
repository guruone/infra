import UIKit

class VOnboardingItemHistory:UIView
{
    weak var controller:COnboardingItemHistory!
    weak var layoutImageLeft:NSLayoutConstraint!
    private let kImageWidth:CGFloat = 180
    private let kImageHeight:CGFloat = 214
    private let kImageTop:CGFloat = 30
    
    convenience init(controller:COnboardingItemHistory)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"onboardingHistory")
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image]
        
        let metrics:[String:AnyObject] = [
            "imageTop":kImageTop,
            "imageWidth":kImageWidth,
            "imageHeight":kImageHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[image(imageWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(imageTop)-[image(imageHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutImageLeft = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutImageLeft)
    }
}