import UIKit

class VOnboardingItemHistory:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout
{
    weak var controller:COnboardingItemHistory!
    weak var layoutImageLeft:NSLayoutConstraint!
    private let kCollectionWidth:CGFloat = 320
    
    convenience init(controller:COnboardingItemHistory)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"onboardingHistory")
        image.layer.cornerRadius = 4
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.blackColor().CGColor
        
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
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remain:CGFloat = width - kImageWidth
        let margin:CGFloat = remain / 2.0
        layoutImageLeft.constant = margin
        
        super.layoutSubviews()
    }
}