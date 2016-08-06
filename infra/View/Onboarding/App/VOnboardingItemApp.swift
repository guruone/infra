import UIKit

class VOnboardingItemApp:UIView
{
    weak var controller:COnboardingItemApp!
    weak var layoutElementsTop:NSLayoutConstraint!
    private let kImageHeight:CGFloat = 90
    private let kLabelHeight:CGFloat = 100
    
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
        
        let label:UILabel = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(15)
        label.textColor = UIColor.main()
        label.numberOfLines = 0
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.Center
        label.text = NSLocalizedString("VOnboardingItemApp_label", comment:"")
        
        addSubview(image)
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "image":image,
            "label":label]
        
        let metrics:[String:AnyObject] = [
            "imageHeight":kImageHeight,
            "labelHeight":kLabelHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:image(imageHeight)]-0-[label(labelHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutElementsTop = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutElementsTop)
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let remain:CGFloat = height - (kImageHeight + kLabelHeight)
        let margin:CGFloat = remain / 2.0
        
        layoutElementsTop.constant = margin
        
        super.layoutSubviews()
    }
}