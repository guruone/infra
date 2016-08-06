import UIKit

class VOnboardingItemHistoryImage:UICollectionViewCell
{
    private let kImageTop:CGFloat = 30
    private let kImageWidth:CGFloat = 220
    private let kImageHeight:CGFloat = 314
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
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
            "H:[image(imageWidth)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(imageTop)-[image(imageHeight)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}